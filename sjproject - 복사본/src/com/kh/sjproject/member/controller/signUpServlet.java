package com.kh.sjproject.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sjproject.member.model.service.MemberService;
import com.kh.sjproject.member.model.vo.Member;

/**
 * Servlet implementation class signUpServlet
 */
@WebServlet("/member/signUp.do")
public class signUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public signUpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		// 1. POST방식 + 한글 데이터 포함 - >인코딩 설정
			//request.setCharacterEncoding("UTF-8");

		// 2. 전달된 파라미터를 변수에 저장 후 Member 객체를 생성하여 저장
			String memberId = request.getParameter("id"); //인풋태그 이름이 id
			String memberPwd = request.getParameter("pwd1");
			String memberName = request.getParameter("name");
			
			// 전화번호를 '-'를 구분자로 하여 하나의 string으로 합침
			String memberPhone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
			
			String memberEmail = request.getParameter("email");
		
			// 주소를 ','를 구분자로 하여 하나의 string으로 합침
			String memberAddress =  request.getParameter("address1")+","+request.getParameter("address2")+","+request.getParameter("post");
			
			// 관심분야 배열을 ","를 구분자로 하여 하나의 string으로 합침
			String[] interest = request.getParameterValues("memberInterest");
			//String memberInterest = String.join("," ,  interest);
			String memberInterest = null;
			if(interest!=null) memberInterest = String.join(",", interest);
		
			// 전달받은 파라미터를 Member 객체에 저장
			Member member = new Member(memberId, memberPwd, memberName, memberPhone, memberEmail, memberAddress, memberInterest);
			System.out.println("signup : " + member);
			
			// 3. 비지니스 로직을 수행하여 DB에 회원정보 저장
			try {
				
				int result = new MemberService().signMember(member);
				
			// 4. result 값에 따라 경고창에 메시지 출력
				String msg = null;
				if(result>0) msg = "가입 성공!";
				else		 msg = "가입 실패!";
				
				// session의 "msg" 속성에 msg 세팅
				request.getSession().setAttribute("msg", msg);
				
				/*
				HttpSession session = request.getSession();
				if(result>0) { 
					session.setAttribute("msg", "가입 성공!");
				}else {
					session.setAttribute("msg", "가입 실패..");
				}*/
				
				// 메인페이지로 이동
				response.sendRedirect(request.getContextPath());
				
			}catch(Exception e){
				
				request.setAttribute("errorMsg", "가입 과정에서 오류가 발생하였습니다.");
				e.printStackTrace();
				
				String path = "/WEB-INF/views/common/errorPage.jsp";
				RequestDispatcher view = request.getRequestDispatcher(path);
				view.forward(request,response);
				
			}
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
