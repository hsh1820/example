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

import com.kh.searchfree.wrapper.EncryptWrapper;

@WebFilter(urlPatterns= {"/member/login.do","/member/signUp.do"
		,"/member/updatePwd.do","/member/deleteMember.do"})
public class EncryptFilter implements Filter {

    public EncryptFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest h_request = (HttpServletRequest)request; // 강제형변환- 다운캐스팅
		// 리퀘스트에 담겨져 있는 비밀번호만 암호화해서 돌려받아야 한다.
		
		// Encrypt Wrapper 객체 생성
		EncryptWrapper encWrapper = new EncryptWrapper(h_request);
		
		chain.doFilter(encWrapper, response);
		// request를 포장된 request인 encwrapper로..
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
