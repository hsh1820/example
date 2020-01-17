package com.kh.sjproject.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sjproject.notice.model.service.NoticeService;
import com.kh.sjproject.notice.model.vo.Notice;

// 클라이언트의 요청 중 /notice디렉토리 하위로 요청 시 
// 해당 서블릿(controller)으로 집중을 시킴
@WebServlet("/notice/*")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Front Controller
		// - 클라이언트의 요청을 한 곳으로 집중시켜서 
		//   개발 및 유지보수의 효율성을 증가시키는 패턴
		
		// - 요청에 따른 servlet을 따로 생성하지 않고
		//   오직하나의 Servlet에서 제어함.
		
		String uri = request.getRequestURI();
		
		System.out.println("uri : "+ uri);
		
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		
		String command = uri.substring((contextPath+"/notice").length());
//		substring : 잘라내고 나머지를 저장
		
		String path = null;
		RequestDispatcher view = null;
		
		NoticeService noticeService = new NoticeService();
		
		// 요청 주소가 /list(공지사항 목록조회 )인 경우
		if(command.equals("/list")) {
			try {
				List<Notice> list = noticeService.selectList();
				request.setAttribute("list", list);
				path = "/WEB-INF/views/notice/noticeList.jsp";
				
			}catch (Exception e) {
				request.setAttribute("errormsg", "공지사항 목록 조회 과정에서 오류가 발생하였습니다.");
				path = "/WEB-INF/views/common/errorPage.jsp";
				e.printStackTrace();
			}finally {
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
