package com.kh.sjproject.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


// filterName : 필터의 이름지정(필터순서지정시 사용)
// urlPatterns : 필터가 적용될 url 패턴 지정(/* : 모든 url)
@WebFilter(filterName="encoding", urlPatterns = "/*")
public class CommonFilter implements Filter {
	// implements Filter 라는 interface상속 받으며, 서버에서 생성
	/* Filter는 request, response가 Servlet / JSP 또는 클라이언트 에게 도달하기 전에 
	 * 필요한 전/후 처리 작업을 맡는 클래스( FilterChain 을 통해 여러 필터 사용 가능)
	 * 
	 * Filter의 생명주기
	 * init() -> doFilter() -> destroy() 
	 * 서버시작        필터링 내용           변경/수정시 파괴
	 * 
	 * Filter 등록 방법
	 * 1. web.xml에 등록
	 * 2. @WebFilter 어노테이션 사용(Servlet 3.0이상)
	 * 		-> tomcat 8.5v == servlet 3.1v
	 * */
    public CommonFilter() {
    	
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 서블릿 컨테이너가 현재 요청/응답에 필터 적용이 필요하다 판단되면
		// 호출되는 메소드
		// HTTPServletRequset 클래스의 부모 
		
		// 요청 / 응답 시 문자인코딩을 모두 UTF-8로 변환하는 필터
		// 1. 요청받은 값 변환
		request.setCharacterEncoding("UTF-8");
		
		// 2. 뷰로 전달(응답)할 값 변환
		response.setContentType("text/html; charset=UTF-8");
		// jsp에는 페이지 지시자에 입력되어 있지만 html에는 없으므로 혼합하여 사용시 필수 기재
		
		
		chain.doFilter(request, response);
		/* Filter 인터페이스의 doFilter()
		 * -> 필요한 필터링 작업을 작성하는 곳
		 * 
		 * FilterChain의 doFilter()
		 * -> 다음 필터로 넘기거나, 
		 * 		현재 필터가 마지막일 경우 
		 * 		요청된 Servlet / JSP 또는 View(클라이언트 측)를 호출
		 * */
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
