package com.kh.sjproject.member.model.service;

import static com.kh.sjproject.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.sjproject.member.model.dao.MemberDao;
import com.kh.sjproject.member.model.vo.Member;

public class MemberService {

	/** 로그인용 Service
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member loginMember(Member member) throws Exception{
		Connection conn = getConnection();
		
		Member loginMember = new MemberDao().loginMember(conn, member);
		
		return loginMember;
	}

	/** 아이디 중복 확인용 Service
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String id) throws Exception {
		Connection conn = getConnection();
		return new MemberDao().idDupCheck(conn, id);
	}

	/** 회원가입용 서비스
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signMember(Member member) throws Exception {
		Connection conn = getConnection();
		int result = new MemberDao().signMember(conn,member);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}// 트랜젝션 처리
		
		return result;
	}

	/** 회원 정보 조회용 서비스
	 * @param memberId
	 * @return selectMember
	 * @throws Exception
	 */
	public Member selectMember(String memberId) throws Exception {
		// 조회만하므로 트랜젝션 처리 필요가 없다.
		
		Connection conn = getConnection();
		return new MemberDao().selectMember(conn, memberId);
	}

	/** 회원 정보 수정용 서비스 
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member member) throws Exception{
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, member);
		
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**비밀번호 수저용 서비스
	 * @param loginMember
	 * @param newPwd
	 * @return result
	 * @throws Exception
	 */
	public int UpdatePwd(Member loginMember, String newPwd) throws Exception {
		
		Connection  conn = getConnection();
		
		MemberDao memberDao = new MemberDao();
		
		// 현재 비밀번호 일치 여부 확인
		// SELECT COUNT (*) FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=?
		int result = memberDao.checkPwd(conn, loginMember);
		
		if(result>0) { // 현재 비밀번호가 일치하는 경우
			
			// 비밀번호 변경
			loginMember.setMemberPwd(newPwd);
			result = memberDao.updatePwd(conn, loginMember);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			return result; 
		}else { // 현재 비밀번호가 다를 경우
			return -1;
		}
		
	}

	public int deleteMember(Member loginMember) throws Exception {
		Connection conn = getConnection();
		MemberDao memberDao = new MemberDao();
		
		int result = memberDao.checkPwd(conn, loginMember); // 비밀번호 일치 확인
		
		if(result>0) { // 일치하는 경우 
			result = memberDao.deleteMember(conn, loginMember); 
			
			if(result>0) {
				commit(conn); 
			}else {
				rollback(conn);
			}
			
			return result; 
			
		}else { // 현재 비밀번호가 다를 경우
			return -1;
		}
		
		
	}
		

}
