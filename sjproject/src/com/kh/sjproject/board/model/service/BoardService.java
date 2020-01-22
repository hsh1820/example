package com.kh.sjproject.board.model.service;

import static com.kh.sjproject.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.sjproject.board.model.dao.BoardDao;
import com.kh.sjproject.board.model.vo.Attachment;
import com.kh.sjproject.board.model.vo.Board;

public class BoardService {

	/** 전체 게시글 수 조회 Service
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount() throws Exception{
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
	public List<Board> selectList(int currentPage, int limit) throws Exception{
		Connection conn = getConnection();
		List<Board> bList = new BoardDao().selectList(conn,currentPage,limit);
		
		close(conn);
		return bList;
	}

	/**게시글 등록 용 Service
	 * @param board
	 * @param boardWriter
	 * @param fList
	 * @return result
	 * @throws Exception
	 */
	public int insertBoard(Board board, int boardWriter, ArrayList<Attachment> fList) throws Exception {
		Connection conn = getConnection();
		
		BoardDao boardDao = new BoardDao();
		
		int result = 0;
		
		//1) 등록될 게시글의 번호를 얻어옴.
		//   SEQ_BNO.NEXTVAL 값을 얻어와라!
		int boardNo = boardDao.selectNextNo(conn);
		
		board.setBoardNo(boardNo);
		
		if(boardNo > 0) { // 게시글 번호를 얻어온 경우
			// 2) 게시글 (Board)를 DB 에 먼저 삽입
			result = boardDao.insertBoard(conn,board, boardWriter);
			
			if(result > 0) {
				result = 0; // 트랜잭션 처리를 위해 재활용
				
				// 3) fList의 데이터를 하나씩 DB에 삽입하는 작업
				for(Attachment file : fList) {
					// 현재 게시글 번호 추가
					file.setBoardId(boardNo);
					
					result = boardDao.insertAttachment(conn,file);
					
					// DB에 게시글 삽입 실패
					if(result == 0) break;
					// 다른 작업 할 필요없이 for문 종료
					
				}
			}
			
		}
		// 4) 트랜잭션 처리
		if(result>0) commit(conn);
		else {
			// 5) DB 삽입 실패 시 
			// 서버에 저장된 파일을 삭제
			// --> multipartrequest객체 생성시 이미 저장됨
			for(Attachment file : fList) {
				String path = file.getFilePath();
				String saveFile = file.getFileChangeName();
				
				File failedFile = new File(path+saveFile);
				// java.io
				// -> 매개변수로 지정된 경로의 파일을 취급할/ 접근할 수있음.
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
	public List<Attachment> selectFileList(int currentPage, int limit) throws Exception{
		Connection conn = getConnection();
		
		ArrayList<Attachment> fList 
		= new BoardDao().selectFileList(conn,currentPage,limit);
		
		close(conn);
		
		return fList;
	}

}
