package com.kh.sjproject.member.model.service;

import static com.kh.sjproject.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.sjproject.member.model.dao.MemberDAO;
import com.kh.sjproject.member.model.vo.Member;

public class MemberService {

	/** 로그인용  Serivce
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member loginMember(Member member) throws Exception{
		Connection conn = getConnection();
		
		return new MemberDAO().loginMember(conn, member);
		
	}

	/**아이디 중복 확인용 Service
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String id) throws Exception {
		Connection conn = getConnection();
		return new MemberDAO().idDupCheck(conn,id);
	}

	public int joinMember(Member member) throws Exception{
		Connection conn = getConnection(); 
		
		int result = new MemberDAO().joinMember(conn, member);
		
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**회원 정보 조회용 서비스 
	 * @param memberId
	 * @return selectMember
	 * @throws Exception
	 */
	public Member selectMember(String memberId) throws Exception{
		Connection conn = getConnection();
		return new MemberDAO().selectMember(conn, memberId);
	}

	public int UpdateMember(Member member) throws Exception{
		Connection conn = getConnection(); 
		
		int result = new MemberDAO().UpdateMember(conn, member);
		
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
}
