package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet3
 */
public class TestServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식 요청 데이터 문자 인코딩 변환
		request.setCharacterEncoding("UTF-8");
		
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
		
		// 나이대에 따라서 추천할 선물 지정
		// 10대 미만 : 인형
		// 10대 : 텀블러
		// 20대 : 향수
		// 30대 : 명품
		// 40대 : 상품권
		// 50대 : 안마의자
		
		
		response.setContentType("text/html; charset=\"UTF-8\""); 
		
		PrintWriter out = response.getWriter();
		
		String recommendation = null;
		
		switch(age){
			case "10대 미만": recommendation = "인형";break;
			case "10대": recommendation = "인형";break;
			case "20대": recommendation = "향수";break;
			case "30대": recommendation = "명품";break;
			case "40대": recommendation = "상품권";break;
			case "50대": recommendation = "안마의자"; break;
		}
	
		
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
		
			//			String present = ""; 
			//			
			//			if(age.equals("10대 미만")) {
			//				present = "인형";
			//			}else if(age.equals("10대")) {
			//				present = "텀블러";
			//			}else if(age.equals("20대")) {
			//				present = "향수";
			//			}else if(age.equals("30대")) {
			//				present = "명품";
			//			}else if(age.equals("40대")) {
			//				present = "상품권";
			//			}else if(age.equals("50대")) {
			//				present = "안마의자";
			//			}
			
			
		out.printf("        <span class=\"name\">%s</span>님은 \r\n" + 
				"        <span class=\"age\">%s</span> 이시며,\r\n" + 
				"        <span class=\"city\">%s</span> 에 사는\r\n" + 
				"        키 <span class=\"height\">%s</span> cm인 \r\n" + 
				"        <span class=\"gender\">%s</span> 입니다.\r\n" + 
				"        <br>\r\n" + 
				"        좋아하는 음식은 \r\n" + 
				"        <span class=\"food\">%s</span> 입니다. \r\n" + 
				"        \r\n" + 
				"<p><h3>%s에 맞는 선물 추천</h3>"+
				"<span>\"%s\"  선물은 어떠신가요?</span></p>"+
				"    </body>\r\n" + 
				" </html>", name, age, city, height, gender, 
					String.join(", ", food),age,recommendation);		
			// out.print(); 추가 시 이전 출력에서 닫아줬던 body, html 태그를 추가해주는 print()메소드에 작성해줘야함		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
