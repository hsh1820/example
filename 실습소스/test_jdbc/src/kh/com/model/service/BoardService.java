package kh.com.model.service;

import static kh.com.common.JDBCTemplate.*;

import java.sql.Connection;

import kh.com.model.vo.Member;

public class BoardService {
	public Member login(Member inpuLogin) throws Exception{
		
		Connection conn =  getConnection();
		BoardDAO boardDAO = new BoardDAO();
		
		return null;
	}
}
