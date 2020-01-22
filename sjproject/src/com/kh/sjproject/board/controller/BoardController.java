package com.kh.sjproject.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.sjproject.board.model.service.BoardService;
import com.kh.sjproject.board.model.vo.Attachment;
import com.kh.sjproject.board.model.vo.Board;
import com.kh.sjproject.board.model.vo.PageInfo;
import com.kh.sjproject.common.ExceptionForward;
import com.kh.sjproject.common.MyFileRenamePolicy;
import com.kh.sjproject.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


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
			
			List<Attachment> fList = boardService.selectFileList(currentPage, limit);
			
			path = "/WEB-INF/views/board/boardList.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("pInf", pInf);
			
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
			
			}catch (Exception e) {
				ExceptionForward.errorPage(request, response, "게시판 목록 조회", e);
			}
			
		}
		
		// 게시글 작성 화면 출력용 Controller
		else if(command.equals("/insertForm")) {
			path = "/WEB-INF/views/board/boardInsert.jsp";
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
			
		}
		
		// 게시글 등록용 Controller
		else if (command.equals("/insert")) {
			// form 전송 시 mutipart/form-data로 전송하는 경우 
			// 기존처럼 request.getPrarameter()를 이용하여 
			// 입력값을 전달받을 수 없음
			// -> MultipartRequest를 사용해야 함
			//    -> cos.jar 라이브러리 추가 필요
			//      (http://www.servlets.com/ )
			try {
				// 요청(requset)가 mutipart/form-data 형식으로 전달됐는지 확인
				if(ServletFileUpload.isMultipartContent(request)) {
					// 1_1. 전송 파일의 용량 제한 : 10mb로 제한
					// B -> KB -> MB -> GB -> TB 
					int maxSize = 10 * 1024 * 1024;// 최대 이미지 사이즈를 byte 단위로 지정
					
					// 1_2. 웹 서버 컨테이너 경로 추출
					// 		-> WebContent/ 경로 추출
					String root = request.getSession().getServletContext().getRealPath("/");
					// servletContext 까지가 웹 컨테이너 영역
					
					// 1_3. 업로드 된 파일이 저장될 경로 지정
					String savePath = root + "resources/uploadImages/";
					
					// 2. 파일명 변환 작업
					// 서버내에서 파일명 중복으로 인한 데이터 손실 예방
					// + 파일명이 한글 또는 특수문자가 포함되면 서버 종류에 따라 문제가 발생할 수 있어서
					
					// cos.jar -> DefaultFileRenamePolicy를 제공해 주지만
					// 나만의 파일명 규칙을 적용하기 위해서
					// 별도의 MyFileRenamePolicy 작성
					
					// 3. MultipartRequest 객체 생성 
					//    -> 객체가 생성되는 순간에 
					//    -> request, 파일경로 지정, maxSize 크기 지정
					//       문자 인코딩지정
					//    -> * 변경된 파일명으로 지정된 경로로 서버에 이미지 파일이 저장됨.
					MultipartRequest multiRequest = 
							new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
					// 4. 서버에 저장된 파일의 원래 파일명, 이전 파일명을 
					//    DB에 전달하기 위한 ArrayList생성
					// 이전 파일명 유지하여 다운로드시 원본파일명 으로 내려받기
					
					// 저장된 파일(변경된 파일명)
					ArrayList<String> saveFiles = new ArrayList<String>();
					
					// 원본 파일명
					ArrayList<String> originFiles = new ArrayList<String>();
					
					// 전달된 요청(multipartRequest)에서 파일 리스트 정보를 얻어와
					// 저장된 파일명, 원래 파일명을 각 ArrayList에 추가함
					multiRequest.getFileNames();
					// Enumeration : iterator 의 과거 버전
					Enumeration<String> files = multiRequest.getFileNames();
					
					while(files.hasMoreElements()) {
						// hasNext()
						
						// 업로드된 파일은 역순으로 전달됨.
						String name = files.nextElement();
						
						if(multiRequest.getFilesystemName(name) != null) {
							// getFilesystemName(key) : 해당 key에 해당하는 rename 된 파일명을 얻어옴
							saveFiles.add(multiRequest.getFilesystemName(name));
							
							originFiles.add(multiRequest.getOriginalFileName(name));
						}
						
					}
					
					// 5. 파일 외에 나머지 게시글 입력 값 얻어오기 
					String boardTitle = multiRequest.getParameter("title");
					String boardContent = multiRequest.getParameter("content");
					String boardCategory = multiRequest.getParameter("category");
					// 오라클에 number 타입의 문자열 "숫자"가 들어오면 자동으로 숫자로 저장 
					
					Board board = new Board(boardTitle, boardContent, boardCategory);
					
					// 회원 번호를 session에서 얻어옴
					// session 은 multirequest가 아니라 일반 request에서 만 얻어올 수 있다.
					// -> multirequest는 parameter만 전달이 안되는 것
					Member loginMember = (Member)request.getSession().getAttribute("loginMember");
					
					int boardWriter = loginMember.getMemberNo();
					
					// 6. Attachment VO를 생성한 후
					// Attachment들을 List를 생성하여
					// 파일경로, 파일 원본명, 변경된 파일명을 세팅
					
					ArrayList<Attachment> fList = new ArrayList<Attachment>();
					
					// 파일 정보는 역순으로 전달되므로 반복문을 역으로 수행하여 원래 순서대로 저장
					 for(int i = originFiles.size()-1; i>=0; i--) {
						 Attachment file = new Attachment();
						 file.setFilePath(savePath);
						 file.setFileOriginName(originFiles.get(i));
						 file.setFileChangeName(saveFiles.get(i));
						 
						 
						 // 썸네일 이미지는 fileLevel을 0으로 
						 // 나머지 이미지에는 fileLevel을 1부여
						 if(i == originFiles.size()-1) {
							 file.setFileLevel(0);
							 
						 }else {
							 file.setFileLevel(1);
						 }
						 
						 fList.add(file);
					 }
					 
					 int result = boardService.insertBoard(board, boardWriter, fList);
					
					 if(result>0) msg = "게시글 등록 성공";
					 else		  msg = "게시글 등록 실패"; 
					 
					 request.getSession().setAttribute("msg", msg);
					 response.sendRedirect("list");
				}
			}catch (Exception e) {
				ExceptionForward.errorPage(request, response, "게시글 등록", e);
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
