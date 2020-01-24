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
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/member/updatePwd.do")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePwdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. POST방식, 한글 미포함 -> 문자 인코딩을 변환할 필요 x
		
		// 2. 전달받은 파라이터들을 변수에 저장 + session에서 현재 로그인 된 아이디 얻어오기
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// String memberId = loginMember.getMemberId();
		// 전달받은 파라미터를 효율적으로 서비스단으로 전달하기 위해
		// loginMember를 활용
		// -> loginMember에 id가 저장되어 있으므로 memberId 불필요해짐.
		
		String currentPwd = request.getParameter("currentPwd");
		loginMember.setMemberPwd(currentPwd);
		// loginMember객체에 currentPwd를 저장하여
		// 서비스로 전달하는 매개변수의 개수를 줄임.
		
		String newPwd = request.getParameter("newPwd1");
		// newPwd1이나 newPwd2중 하나만 가져오면 된다.
		
		// 3. 비지니스 로직을 위한 서비스 호출 후 반환 값 저장
		try {
			
			int result = new MemberService().UpdatePwd(loginMember,newPwd);
			
			String msg = null;
			String path = null;
			
			if(result>0) {
				msg = "비밀번호가 변경되었습니다.";
				path = "mypage.do";
			}else if(result ==0 ) { 
				msg = "비밀번호 변경에 실패하였습니다.";
				path = "mypage.do"; // db 쪽 오류거나 불일치등의 상황. - 마이페이지에 돌아가서 관리자에게 문의하는 상황
			}else {
				msg = "현재 비밀번호가 일치하지 않습니다.";
				path = "changePwd.do";
			}
			
			session.setAttribute("msg", msg);
			response.sendRedirect(path);
			
		}catch(Exception e) {
			request.setAttribute("errorMsg", "비밀번호 수정 과정에서 오류가 발생하였습니다.");
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
