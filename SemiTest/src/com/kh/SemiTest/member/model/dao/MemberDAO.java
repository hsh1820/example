package com.kh.SemiTest.member.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import static com.kh.SemiTest.common.JDBCTemplate.*;
import com.kh.SemiTest.member.model.vo.Member;

public class MemberDAO { 
	
	private Properties prop = null;
	
	public MemberDAO() throws Exception{
		// member 관련 sql파일을 관리할 properties파일 생성
		// 			-- 작업용 버전을 만든것
		String fileName 
		= MemberDAO.class.getResource("/com/kh/SemiTest/sql/member/member-query.properties").getPath();
		
		prop = new Properties();
		prop.load(new FileReader(fileName));
		
	}

	/** 로그인용 Dao
	 * @param conn
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member loginMember(Connection conn, Member member) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member loginMember = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int memberNo = rset.getInt("MEMBER_NO");
				String memberId = rset.getString("MEMBER_ID");
				String memberName = rset.getString("MEMBER_NM");
				String memberPhone = rset.getString("MEMBER_PHONE");
				String memberEmail = rset.getString("MEMBER_EMAIL");
				String memberAddress = rset.getString("MEMBER_ADDR");
				String memberInterest = rset.getString("MEMBER_INTEREST");
				Date memberEnrollDate = rset.getDate("MEMBER_ENROLL_DATE");
				String memberStatus = rset.getString("MEMBER_STATUS");
				String memberGrade = rset.getString("MEMBER_GRADE");
				
				loginMember 
				= new Member(memberNo, memberId, memberName, 
								memberPhone, memberEmail, memberAddress, 
								memberInterest, memberEnrollDate, memberStatus, 
								memberGrade);
			}
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginMember;
	}
	
}
