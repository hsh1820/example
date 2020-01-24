package com.kh.sjproject.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sjproject.member.model.service.MemberService;
import com.kh.sjproject.member.model.vo.Member;

@WebServlet("/member/mypage.do")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에 저장되어 있는 ID 가져오기
		/*
		 * String memberId = ((Member)(request.getSession()
		 * .getAttribute("loginMember"))).getMemberId();
		 */
		//session 범위는 전체 브라우저들 이라고했는데 왜 서블렛에서 각각생성? 
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		///loginMember.getMemberId(); : 다른사람의 아이디로 값을 얻어올 수 있음
		
		try {
			// db에서 아이디가 일치하는 회원 정보 읽어오기
			Member selectMember = new MemberService().selectMember(memberId);
			
			request.setAttribute("member", selectMember);
			
			String path ="/WEB-INF/views/member/mypage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(path);
			view.forward(request, response);
			
		}catch(Exception e) {
			request.setAttribute("errorMsg", "회원정보 조회 과정에서 오류가 발생하였습니다.");
			
			e.printStackTrace();
			String path = "/WEB-INF/views/common/errorPage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(path);
			view.forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
