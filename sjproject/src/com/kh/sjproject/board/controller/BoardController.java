package com.kh.sjproject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sjproject.board.model.service.BoardService;
import com.kh.sjproject.board.model.vo.Board;
import com.kh.sjproject.board.model.vo.PageInfo;
import com.kh.sjproject.common.ExceptionForward;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring((contextPath+"/board").length());
		
		String msg = null;
		String path = null;
		RequestDispatcher view = null;
		BoardService boardService = new BoardService();
		
		// 게시글 목록 조회용 Controller 
		if(command.equals("/list")) {
			try {
				
			// 페이징 처리(pagination)
			// 눈에 보이는 게시판에 일정 개수의 게시글만 노출되고
			// 나머지는 페이지로 구분하여 숫자 형태로 보여주게하는 방법
			
			// 현재 게시글 전체 수
			int listCount = boardService.getListCount();
			
			int limit = 5; // 한 페이지에 보여질 게시글의 수
			int pagingBarSize = 10;// 보여질 페이징 바의 페이지 개수

			int currentPage = 0;// 현재 페이지 번호를 표시할 변수 -> 요청하는(request:서버쪽에서 자바를 위해 만들어는 객체)곳에서 넘어오는 값 -> Service에서는 순수한 자바 만 다루기 때문에 controller에서 작업
			int maxPage = 0;// 전체 페이지의 수 (== 마지막 페이지)
			int startPage = 0;// 페이징바 시작 페이지 번호
			int endPage = 0;// 페이징바 끝 페이지 번호
			
			// currentPage - 현재 페이지 번호를 표시할 변수
			// 처음 게시판 목록으로 화면이 전환이 되면 1페이지가 보여야함
			if(request.getParameter("currentPage")== null) {
				currentPage = 1;
			}else {
				// 전달 받은 값이 있을 경우 해당 번호를 저장
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// maxPage - 총 페이지 수(==마지막 페이지) 
			// limit = 5일 경우
			// 게시글의 개수가 50개일 경우 페이지의 수  : 10 페이지
			// 게시글의 개수가 51개일 경우 페이지의 수  : 11 페이지
			maxPage = (int)Math.ceil(((double)listCount / limit));
			
			// startPage - 페이징바의 시작 페이지 번호
			// 페이징바에 수가 10개씩 보여질 경우
			// 시작번호는 1, 11, 21, 31, ...
			startPage = (currentPage -1 ) / pagingBarSize * pagingBarSize + 1;
			
			// endPage - 페이징바 끝 페이지 번호
			endPage = startPage + pagingBarSize -1 ;
			if(maxPage <= endPage) {
				endPage = maxPage;
			}
			PageInfo pInf = new PageInfo(listCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
			
			System.out.println(pInf);
			
			List<Board> bList = boardService.selectList(currentPage,limit); 
			
			path = "/WEB-INF/views/board/boardList.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("pInf", pInf);
			
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
			
			}catch (Exception e) {
				ExceptionForward.errorPage(request, response, "게시판 목록 조회", e);
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
