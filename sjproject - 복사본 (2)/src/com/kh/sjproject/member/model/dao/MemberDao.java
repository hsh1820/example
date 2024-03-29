package com.kh.sjproject.member.model.dao;

import static com.kh.sjproject.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.kh.sjproject.common.JDBCTemplate;
import com.kh.sjproject.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = null;
	
	public MemberDao() throws Exception{ 
		// member 관련 sql 파일을 관리할 properties 파일 생성
		
		String fileName 
		= JDBCTemplate.class
		.getResource("/com/kh/sjproject/sql/member/member-query.properties")
		.getPath();
		
		prop = new Properties();
		
		prop.load(new FileReader(fileName));
		
		
	}

	/**로그인용 Dao
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
		System.out.println(member);
		
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
				 
				 loginMember = new Member(memberNo, memberId, memberName, memberPhone, memberEmail, memberAddress, 
						 memberInterest, memberEnrollDate, memberStatus, memberGrade);
			}
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginMember;
	}

	/** 아이디 중복체크 확인용 Dao
	 * @param conn
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(Connection conn, String id) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idDupCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {// 다음 값이 있으면 
				result = rset.getInt(1); //1행1열 가져옴
			}
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/** 회원가입용 Dao
	 * @param conn
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signMember(Connection conn, Member member) throws Exception{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("signMember");
		
		try {
		pstmt = conn.prepareStatement(query);
			
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPwd());
		pstmt.setString(3, member.getMemberName());
		pstmt.setString(4, member.getMemberPhone());
		pstmt.setString(5, member.getMemberEmail());
		pstmt.setString(6, member.getMemberAddress());
		pstmt.setString(7, member.getMemberInterest());
		
		result = pstmt.executeUpdate();
		
		}
		
		finally {
				close(pstmt);
		}
	
		return result;
	
	}

	/** 회원 정보 조회용 Dao
	 * @param conn
	 * @param memberId
	 * @return selectMember
	 * @throws Exception
	 */
	public Member selectMember(Connection conn, String memberId) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member selectMember = null;
		// 조회결과를 저장할 객체
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectMember = new Member(rset.getInt("MEMBER_NO"),
										  rset.getString("MEMBER_ID"),
										  rset.getString("MEMBER_NM"),
										  rset.getString("MEMBER_PHONE"),
										  rset.getString("MEMBER_EMAIL"),
										  rset.getString("MEMBER_ADDR"),
										  rset.getString("MEMBER_INTEREST"));}
			}
		finally {
			close(rset);
			close(pstmt);
		}
		
		return selectMember;
	}

	/** 회원정보 수정
	 * @param conn
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Connection conn, Member member) throws Exception {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPhone());
			pstmt.setString(2, member.getMemberEmail());
			pstmt.setString(3, member.getMemberAddress());
			pstmt.setString(4, member.getMemberInterest());
			pstmt.setString(5, member.getMemberId());
			
			result = pstmt.executeUpdate();
			//System.out.println(member);
			
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	/** 현재 비밀번호 일치 여부 확인용 Dao
	 * @param conn
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int checkPwd(Connection conn, Member loginMember) throws Exception{
		
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		int result = 0; // 조회결과를 담음
		String query = prop.getProperty("checkPwd");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginMember.getMemberId());
			pstmt.setString(2, loginMember.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
				//result = rset.getInt(1);
			}
			
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	/** 비밀번호 수정용 Dao
	 * @param conn
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int updatePwd(Connection conn, Member loginMember) throws Exception {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginMember.getMemberPwd());
			pstmt.setString(2, loginMember.getMemberId());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 회원 탈퇴용 Dao
	 * @param conn
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int deleteMember(Connection conn, Member loginMember) throws Exception{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginMember.getMemberId());
			result = pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
