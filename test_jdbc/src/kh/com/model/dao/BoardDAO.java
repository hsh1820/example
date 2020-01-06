package kh.com.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import static kh.com.common.JDBCTemplate.*;
import kh.com.model.vo.Member;

public class BoardDAO {
	private Properties prop = null;
	
	public BoardDAO() throws Exception{
		prop = new Properties();
		prop.load(new FileReader("query.properties"));
	}
	
	public Member login (Connection conn, Member inputLogin)throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, inputLogin.getMemberID());
			pstmt.setString(2, inputLogin.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				String memberId = rset.getString("member_id");
				String memberPwd = rset.getString("member_Pwd");
				String memberName = rset.getString("member_Name");
				char gender = rset.getString("gender").charAt(0);
				String email = rset.getString("email");
				String phone = rset.getString("phone");
				String address = rset.getString("address");
				int age = rset.getInt("age");
				
				member = new Member(memberId, memberPwd, memberName, gender, email, phone, address, age);
				
			}
		}finally {
			close(rset);
			close(pstmt);
		}
		return null;
	}
}
