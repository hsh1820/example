package com.kh.sjproject.board.model.service;

import static com.kh.sjproject.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.sjproject.board.model.dao.BoardDao;
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

}
