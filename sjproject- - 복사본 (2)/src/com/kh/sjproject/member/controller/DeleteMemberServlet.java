package com.kh.sjproject.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import com.kh.sjproject.member.model.service.MemberService;
import com.kh.sjproject.member.model.vo.Member;

@WebServlet("/member/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 아이디(session), 비밀번호(request parameter)
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		String currentPwd = request.getParameter("currentPwd");
		
		loginMember.setMemberPwd(currentPwd);
		
		
		// 비즈니스로직 처리를 위한  메소드 호출 후 반환 값 저장
		// 비밀번호 불일치 : "비밀번호 불일치", 회원 탈퇴 페이지 이동
		// 비밀번호 일치, 실패 : "탈퇴 실패", 마이페이지 이동
		// 비밀번호 일치, 성공 : "탈퇴 성공", 메인페이지 이동
		
		try {
			int result = new MemberService().deleteMember(loginMember);
			
			String msg = null;
			String path = null;
			
			if(result>0) {
				msg="탈퇴 성공";
				path = request.getContextPath();
				session.removeAttribute("loginMember");
				
			}else if(result == 0) {
				msg="탈퇴 실패";
				path = "mypage.do";
			}else {
				msg = "현재 비밀번호가 일치하지 않습니다.";
				path = "secession.do";
			}
			session.setAttribute("msg", msg);
			response.sendRedirect(path);
			
			
		}catch(Exception e) {
			request.setAttribute("errorMsg", "회원 탈퇴 과정에서 오류가 발생하였습니다.");
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
