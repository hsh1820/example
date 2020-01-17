package com.kh.sjproject.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.sjproject.notice.model.dao.NoticeDao;
import com.kh.sjproject.notice.model.vo.Notice;
import static com.kh.sjproject.common.JDBCTemplate.*;


public class NoticeService {

	/** 공지사항 목록 조회용 서비스 
	 * @return list
	 * @throws Exception
	 */
	public List<Notice> selectList() throws Exception{
		Connection conn = getConnection();
		
		return new NoticeDao().selectList(conn);
	}
	
}
