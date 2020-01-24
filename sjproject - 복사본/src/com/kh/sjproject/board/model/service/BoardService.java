package com.kh.sjproject.board.model.service;

import static com.kh.sjproject.common.JDBCTemplate.close;
import static com.kh.sjproject.common.JDBCTemplate.commit;
import static com.kh.sjproject.common.JDBCTemplate.getConnection;
import static com.kh.sjproject.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.sjproject.board.model.dao.BoardDao;
import com.kh.sjproject.board.model.vo.Attachment;
import com.kh.sjproject.board.model.vo.Board;
import com.kh.sjproject.board.model.vo.Reply;

public class BoardService {

	/** 전체 게시글 수 조회 Service
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount() throws Exception {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);

		close(conn);
		
		return listCount;
	}

	/** 게시판 목록 조회용 Service
	 * @param currentPage
	 * @param limit
	 * @return bList
	 * @throws Exception
	 */
	public List<Board> selectList(int currentPage, int limit) throws Exception {
		Connection conn = getConnection();
		
		List<Board> bList = new BoardDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return bList;
	}

	/** 게시글 등록용 Service
	 * @param board
	 * @param boardWriter
	 * @param fList
	 * @return result
	 * @throws Exception
	 */
	public int insertBoard(Board board, int boardWriter, ArrayList<Attachment> fList) throws Exception{
		Connection conn = getConnection();
		
		BoardDao boardDao = new BoardDao();
		int result = 0;
		
		// 1)등록된 게시글의 번호를 얻어옴
		// -> SEQ_BNO.NEXTVAL 값을 얻어오라.
		int boardNo = boardDao.selectNextNo(conn);
		
		if(boardNo>0) { // 게시글 번호를 얻어 온 경우
			// 2) 게시글 (Board)을 DB에 먼저 삽입
			board.setBoardNo(boardNo);
			result = boardDao.insertBoard(conn, board, boardWriter);
			
			if(result>0) { // 게시글 삽입 성공 시 
				result = 0; // 트랜잭션 처리를 위해 재활용 
				
				// 3) fList의 데이터를 하나씩 DB에 삽입
				for(Attachment file : fList) {
					// 현재 게시글 번호 추가
					file.setBoardId(boardNo);
					result = boardDao.insertAttachment(conn, file);
					
					if(result == 0) break; // db에 데이터 삽입 실패시
					
				}
				
			}
			
		} 
		// 4)트랜잭션 처리
		if(result>0) commit(conn);
		else {
			// 5) DB 삽입 실패 시 
			// 서버에 저장된 파일을 삭제 
			for(Attachment file : fList) {
				String path = file.getFilePath();
				String saveFile = file.getFileChangeName();
				
				File failedFile = new File(path + saveFile);
				// -> 매개변수로 지정된 경로의 파일을 취급할 수 있음.
				
				failedFile.delete();
			}
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	/** 썸네일 이미지 목록 조회 Service
	 * @param currentPage
	 * @param limit
	 * @return fList
	 * @throws Exception
	 */
	public List<Attachment> selectFileList(int currentPage, int limit) throws Exception {
		Connection conn = getConnection();
		
		ArrayList<Attachment> fList = new BoardDao().selectFileList(conn, currentPage, limit);
		
		close(conn);
		
		return fList;
	}

	/** 게시글 상세 조회용 Service
	 * @param boardNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBoard(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		//상세 조회하면 조회수가 증가해야 함. ->쿼리문 2번 날려야 함
		BoardDao boardDao = new BoardDao();
		
		// 1) 게시글 상세 조회
		Board board = boardDao.selectBoard(conn, boardNo);
		
		// 2) 게시글 상세 조회 성공 시 조회수 증가
		if(board != null) {
			int result = boardDao.increaseCount(conn, boardNo);
			
			if(result>0) {
				commit(conn);
				//반환되는 notice는 조회수 증가가 되어있지 않으므로 
				// 리턴 시 조회수를 +1 시켜줌
				board.setBoardCount(board.getBoardCount()+1);
				
			}else {
				rollback(conn);
				board = null; // 조회수 증가 실패 시 조회되지 않게 만듦.
			}
		}
		
		close(conn);
		
		return board;
	}

	/** 게시글 이미지 파일 조회용 Service
	 * @param boardNo
	 * @return files
	 * @throws Exception
	 */
	public List<Attachment> selectFiles(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		List<Attachment> files = new BoardDao().selectFiles(conn, boardNo);
		
		close(conn);
		return files;
	}
	
	/** 파일 다운로드용 Service
	 * @param fNo
	 * @return file
	 */
	public Attachment selectFile(int fNo) throws Exception {
		Connection conn = getConnection();
		
		Attachment file = new BoardDao().selectFile(conn, fNo);
		
		close(conn);
		return file;
	}

	public int getFileCount(int fNo) throws Exception {
		Connection conn = getConnection();
		
		int fileCount = new BoardDao().getFileCount(conn,fNo);
		
		close(conn);
		
		return fileCount;
	}

	/** 댓글 등록용 Service
	 * @param reply
	 * @param replyWriter
	 * @return result
	 * @throws Exception
	 */
	public int insertReply(Reply reply, int replyWriter) throws Exception {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, reply, replyWriter);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}

	
	/** 댓글 리스트 조회용 Service
	 * @param boardId
	 * @return 
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(int boardId) throws Exception{
		Connection conn = getConnection();
		
		List<Reply> rList = new BoardDao().selectReplyList(conn, boardId); 
		
		close(conn);
		
		return rList;
	}

}
