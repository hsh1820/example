package com.kh.SemiTest.member.model.service;

import static com.kh.SemiTest.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.SemiTest.member.model.dao.MemberDAO;
import com.kh.SemiTest.member.model.vo.Member;

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
	
}
