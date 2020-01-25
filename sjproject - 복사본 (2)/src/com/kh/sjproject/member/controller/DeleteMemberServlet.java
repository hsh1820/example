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

@WebServlet("/member/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디(session), 비밀번호(request) 얻어오기
		
		// 비지니스로직 처리를 위한 메소드 호출 후 반환 값 저장
		
		// 비밀번호 불일치 -> "비밀번호 불일치" 메세지, 회원탈퇴 페이지로 다시 이동
		// 비밀번호 일치, 실패(db쪽 오류) -> "탈퇴 실패" 메세지, 마이페이지로 이동
		// 비밀번호 일치, 성공 -> "탈퇴 되었습니다." 메인페이지로 이동
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String currentPwd = request.getParameter("currentPwd");
		
		// loginMember객체에 현재 비밀번호를 저장
		// loginMember.setMemberPwd(memberPwd);
		
		loginMember.setMemberPwd(currentPwd);
		try {
			
			int result = new MemberService().deleteMember(loginMember);
			
			String msg = null;
			String path = null;
			
			if(result<0) {
				msg = "비밀번호가 일치하지 않습니다.";
				path = "secession.do"; // 탈퇴 페이지를 다시 보여줌
			}else if(result ==0 ) { 
				msg = "회원 탈퇴에 실패하였습니다.";
				path = "mypage.do"; // db 쪽 오류거나 불일치등의 상황. - 마이페이지에 돌아가서 관리자에게 문의하는 상황
			}else {
				msg = "회원 탈퇴가 완료되었습니다..";
				path = request.getContextPath();
				
				// session.invalidate(); -> 세션 무효화 시 모든 session 데이터가 사라지므로 
				// msg 전달 등의 기능이 동작하지 않는 문제 발생
				
				session.removeAttribute("loginMember");
			}
			
			session.setAttribute("msg", msg);
			response.sendRedirect(path);
		
		}catch(Exception e) {
			request.setAttribute("errorMsg", "오류가 발생하였습니다.");
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
