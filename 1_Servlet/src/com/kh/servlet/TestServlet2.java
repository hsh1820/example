package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet2
 */
public class TestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식으로 데이터를 전달 받은 경우
		// HTTP Body에 요청하는 브라우저의 ContentType이 같이 전달 됨.
		// 현재 개발 환경 문자 인코딩 == UTF-8
		// 브라우저 문자 인코딩(크롬) == ISO-8859-1
		// 둘의 문자 인코딩이 달라 getParameter()로 값을 얻어오는 순간부터 문자열이 깨짐
		// getParameter() 이전에 문자셋을 설정해야 함
		
		request.setCharacterEncoding("UTF-8");
		// GET방식에서는 응답 화면을 전달할 때 html화면 전달 이전에 설정을 했고
		// POSt 방식에서는 파라미터를 가져오기 전에 먼저 설정을 해야함
		// ---> 요청하는 브라우저의 ContentType이 같이 전달되기 때문
		
		String name = request.getParameter("name");
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
		for(int i=0;i<food.length;i++) {
			System.out.println("입력받은 food : "+ food[i]);
		}
	
		
		// 응답 화면 출력 준비
		response.setContentType("text/html; charset=\"UTF-8\""); 
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>\r\n" + 
				"<html lang = \"ko\">\r\n" + 
				"    <head>\r\n" + 
				"    <meta charset = \"UTF-8\">\r\n" + 
				"        <title>개인 정보 출력 화면</title> \r\n" + 
				"        <style>\r\n" + 
				"            h2{color: red;}\r\n" + 
				"            span.name{color:orange; font-weight: bold; }\r\n" + 
				"            span.gender{color:yellow; font-weight: bold; background-color: black;}\r\n" + 
				"            span.age{color:green; font-weight: bold; }\r\n" + 
				"            span.city{color:blue; font-weight: bold; }\r\n" + 
				"            span.height{color:navy; font-weight: bold; }\r\n" + 
				"            span.food{color:purple; font-weight: bold; }\r\n" + 
				"        </style>\r\n" + 
				"    </head>\r\n" + 
				"    <body>\r\n" + 
				"        <h2>개인 정보 입력 결과(POST)</h2>");
		
		
		out.printf("        <span class=\"name\">%s</span>님은 \r\n" + 
				"        <span class=\"age\">%s</span> 이시며,\r\n" + 
				"        <span class=\"city\">%s</span> 에 사는\r\n" + 
				"        키 <span class=\"height\">%s</span> cm인 \r\n" + 
				"        <span class=\"gender\">%s</span> 입니다.\r\n" + 
				"        <br>\r\n" + 
				"        좋아하는 음식은 \r\n" + 
				"        <span class=\"food\">%s</span> 입니다. \r\n" + 
				"        \r\n" + 
				"    </body>\r\n" + 
				" </html>", name, age, city, height, gender, 
					String.join(", ", food));		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
