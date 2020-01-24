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
	
/**
 * Servlet implementation class updateMyPageServlet
 */
@WebServlet("/member/updateMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. POST방식 + 한글 포함 시 문자 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 2. 전달 받은 파라미터를 변수에 저장 + 로그인 ID를 얻어와 member객체에 저장
		
		// session에 저장된 ID 얻어오기
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		
		// 파라미터에 변수 저장
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String memberPhone = phone1 +"-" + phone2 + "-" + phone3 ;
		String memberEmail = request.getParameter("email");
		String memberAddress = request.getParameter("post") + "," 
		+ request.getParameter("address1") + "," +  request.getParameter("address2");
		String[] memberInterestArr = request.getParameterValues("memberInterest");
		String memberInterest=null;
		if(memberInterestArr!=null) {
			memberInterest = String.join(",", memberInterestArr);
			// nullpointerException 발생 방지
		}
		
		// Member 객체에 저장
		Member member = new Member(memberId, memberPhone, memberEmail, memberAddress, memberInterest);
	
		// 3. 비지니스 로직을 수행할 서비스 메소드 호출 후 결과 값 반환 받기
		try { // db로부터 exception 모두 전달 받음
			
			int result = new MemberService().updateMember(member);
			// 업데이트를 수행하여 성공한 행의 갯수 
			
			if(result>0) {
				session.setAttribute("msg", "회원 정보가 수정되었습니다.");
			}else {
				session.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			}
			
			//response.sendRedirect("mypage.do");
			RequestDispatcher view = request.getRequestDispatcher("mypage.do");
			view.forward(request, response);
			
		}catch(Exception e) {
			
			request.setAttribute("errorMsg", "회원정보 수정 과정에서 오류가 발생하였습니다.");
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
