package com.kh.sjproject.member.model.service;
import static com.kh.sjproject.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.sjproject.member.model.dao.MemberDAO;
import com.kh.sjproject.member.model.vo.Member;

public class MemberService {

	/** 로그인용 Service
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member loginMember(Member member) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = new MemberDAO().loginMember(conn, member);
		
		return loginMember;
	}

	/** 아이디 중복 확인용 Service
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String id) throws Exception{
		
		Connection conn = getConnection();
		return new MemberDAO().idDupCheck(conn, id);
	}

	public int joinMember(Member member) throws Exception {
		
		Connection conn = getConnection();
		int result = new MemberDAO().joinMember(conn,member);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/** 회원 정보 조회용 Service
	 * @param memberId
	 * @return selectMember
	 * @throws Exception
	 */
	public Member selectMember(String memberId) throws Exception{
		
		Connection conn = getConnection();
		return new MemberDAO().selectMember(conn,memberId);
	}

	/** 회원 정보 수정용 Service
	 * @param member
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member member, String memberId) throws Exception{
		
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn,member,memberId);
		
		// 트랜잭션 처리
		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}

	/** 비밀번호 수정용 Service
	 * @param loginMember
	 * @param newPwd
	 * @return result
	 * @throws Exception
	 */
	public int updatePwd(Member loginMember, String newPwd) throws Exception{
		
		Connection conn = getConnection();
		
		MemberDAO MemberDAO = new MemberDAO();
		
		// 현재 비밀번호 일치 여부 확인
		// SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=?
		int result = MemberDAO.checkPwd(conn,loginMember);
		
		if(result > 0) { // 현재 비밀번호가 일치할 경우
			
			// 비밀번호 변경
			loginMember.setMemberPwd(newPwd);
			result = MemberDAO.updatePwd(conn,loginMember);
			
			if(result>0) commit(conn);
			else         rollback(conn);
			
			return result;
		}else {
			// 현재 비밀번호가 다를 경우
			return -1;
		}
	}

	public int deleteMember(Member loginMember) throws Exception{
		
		Connection conn = getConnection();
		
		MemberDAO MemberDAO = new MemberDAO();
		
		int result = MemberDAO.checkPwd(conn, loginMember);
		
		if(result>0) {
			result = MemberDAO.deleteMember(conn,loginMember);
			
			// 회원탈퇴 성공
			if(result>0) commit(conn);
			else         rollback(conn);
			
			return result;
		}else {
			// 현재 비밀번호 다른 경우
			return -1;
		}
	}

	
}
