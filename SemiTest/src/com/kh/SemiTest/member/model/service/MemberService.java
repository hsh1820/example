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
	
}
