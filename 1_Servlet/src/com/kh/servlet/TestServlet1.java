package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet1
 */
public class TestServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// servlet 초기화 메소드
		System.out.println("init() 메소드 실행!!");
		// init() 메소드가 없을 경우 자동적으로 다음 순서인 
		// service()메소드를 실행
	}
	
	

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 메소드 실행!!");
		
		doPost(request, response);
		// service() 메소드가 없어도 전송된 방식(GET,POST)를 알아서 따져
		// doGet() 또는 doPost()를 호출함.
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HttpServletRequest request : 웹 브라우저에서 사용자가 요청한 내용을
		// 								받아주는 용도 + 각 종 클라이언트 정보(요청한 사람의 ip, 브라우저, 나라, 시간대 ...)가 담겨있음
		// HttpServletResponse response :
		// HttpServletRequest를 처리한 결과를 다시 클라이언트 웹 브라우저에 보여주기 위한 용도로 사용
		
		String name = request.getParameter("name");
		// input 태그 중 name 속성이 "name"인 요소의 값을 얻어옴.
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String height = request.getParameter("height");
		String[] food = request.getParameterValues("food");
		
		System.out.println("입력받은 name : "+ name);
		System.out.println("입력받은 gender : "+ gender);
		System.out.println("입력받은 age : "+ age);
		System.out.println("입력받은 city : "+ city);
		System.out.println("입력받은 height : "+ height);
		if(food != null) {
			for(int i =0; i<food.length;i++) {		
				System.out.println("입력받은 food : "+ food[i]);
			}
		}else {
			System.out.println("입력받은 food 가 없음 ");
			
		}
		
		// 응답(Response) 화면 출력 준비
		
		// 응답 페이지에 사용할 문자 인코딩 지정
//		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 문자열(HTML 코드)을 사용자 응답 화면에 출력할 스트림을
		// HttpServletResponse 객체에서 얻어와
		// 응답 화면과 해당 Servlet 연결
		// HttpServletResponse 객체 : 어디로 응답해야한다는 정보가 담겨있음
		PrintWriter out = response.getWriter();
		// response 객체에서 출력할 스트림을 out에 저장
		
		out.println("<html>");
		out.println("<head>");
//		out.println("<meta charset='UTF-8'>");
//		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>개인 정보 출력 화면</title>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<h2>개인 정보 출력 화면(GET)</h2>");
		out.println("</body>");
		out.println("</html>");
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
