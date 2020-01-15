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

@WebServlet("/member/signUp.do")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignUpServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("id");
		String memberPwd = request.getParameter("pwd1");
		String memberName = request.getParameter("name");
		String memberPhone = request.getParameter("phone1")+"-"+
				request.getParameter("phone3")+"-"+
				request.getParameter("phone3");
		String memberEmail = request.getParameter("email");
		String memberAddress = request.getParameter("post")+","+request.getParameter("address1")+","+request.getParameter("address2");
		String[] memberInterests = request.getParameterValues("memberInterest");
		
		String memberInterest = String.join(", ", memberInterests);
		
		Member member = new Member(memberId, memberPwd, memberName, memberPhone, memberEmail,
				memberAddress, memberInterest);
		
		System.out.println("signup : "+ member);
		
		try {
			int result = new MemberService().joinMember(member);
			
			HttpSession session = request.getSession();
			
			if(result >0) {
				response.sendRedirect(request.getContextPath());
				session.setAttribute("msg", "가입성공");
			}else {
				response.sendRedirect(request.getContextPath());
				session.setAttribute("msg", "가입실패");
			}
			
			
		}catch(Exception e) {
			request.setAttribute("errorMsg", "로그인 과정에서 오류가 발생하였습니다.");
			
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
