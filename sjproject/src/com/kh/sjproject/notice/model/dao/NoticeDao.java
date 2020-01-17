package com.kh.sjproject.notice.model.dao;

import static com.kh.sjproject.common.JDBCTemplate.*;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.sjproject.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = null;
	
	public NoticeDao() throws Exception{
		String fileName = NoticeDao.class.getResource("/com/kh/sjproject/sql/notice/notice-query.properties")
				.getPath();
		prop = new Properties();
		prop.load(new FileReader(fileName));
	}
	
	/**공지사항 목록 조회용 Dao
	 * @param conn
	 * @return list
	 * @throws Exception
	 */
	public List<Notice> selectList(Connection conn) throws Exception {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		List<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Notice>();
			// 조회 결과가 없는 경우 값이 비어있는 리스트가 반환됨
			
			Notice notice = null;
			
			while(rset.next()) {
				notice = new Notice(rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_WRITER"),
						rset.getInt("NOTICE_COUNT"),
						rset.getDate("NOTICE_MODIFY_DT"));
				
				list.add(notice);
			}
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
