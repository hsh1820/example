package com.kh.searchfree.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.searchfree.member.model.vo.Member;

//urlPatterns : 핕터가 적용될 url패턴 지정
@WebFilter(urlPatterns = {"/member/mypage.do",
						  "/member/changePwd.do",
						  "/member/secession.do"})
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 로그인 확인 -> Session -> Request
		// sendRedirect() ->response
		
		HttpServletRequest req = (HttpServletRequest)request; // 다운캐스팅
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			// 로그인이 되어있지 않은 경우
			session.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			res.sendRedirect(req.getContextPath()); // 메인으로 이동
		}else {
			chain.doFilter(request, response);
			// 로그인이 되어있는 경우
			// 다음필터 또는 요청된 servlet/jsp로 이동
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}