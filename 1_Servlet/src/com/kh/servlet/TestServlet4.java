package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet4
 */
public class TestServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
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
		if(food != null) {
			for(int i =0; i<food.length;i++) {		
				System.out.println("입력받은 food : "+ food[i]);
			}
		}else {
			System.out.println("입력받은 food 가 없음 ");
			
		}
		
		response.setContentType("text/html; charset=\"UTF-8\""); 
		
		String recommendation = null;
		
		switch(age){
			case "10대 미만": recommendation = "인형";break;
			case "10대": recommendation = "인형";break;
			case "20대": recommendation = "향수";break;
			case "30대": recommendation = "명품";break;
			case "40대": recommendation = "상품권";break;
			case "50대": recommendation = "안마의자"; break;
		}
		
		// JSP에게 HTML 코드에 알맞은 값을 작성할 수 있도록 데이터 위임 준비
		// request객체에 Key, Value 형태로 값을 저장해서 위임 가능
		
		//requset 객체 세팅
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("age", age);
		request.setAttribute("city", city);
		request.setAttribute("height", height);
		request.setAttribute("foods", String.join(", ", food));
		request.setAttribute("recommendation", recommendation);
		
		// Servlet 에서 jsp로 위임
		// 위임 객체 -> RequestDispatcher
		// Dispatcher : 필요한 정보를 제공하는 역할
		// RequestDispatcher : 현재 request객체에 담긴 정보를 저장하고 있다가
		// 					      다음 지정된 페이지에서 해당 정보를 볼 수 있게 위임(제공)하는 역할
		
		// request 객체의 정보를 getRequestDispatcher에 전달
		RequestDispatcher view = request.getRequestDispatcher("Views/testServlet4End.jsp");
		// getRequestDispatcher() : 모든 request 객체는 
		// 자신의 request정보를 전달할 수 있도록 getRequestDispatcher() 메소드를 가지고 있음
		view.forward(request, response);
		
		// forward 방식 : 기존 파라미터를 유지하며 페이지 전환
		
		// request.getRequestDispatcher("Views/testServlet4End.jsp"); :
		// 해당 페이지의 Request 정보들을 Views/testServlet4End.jsp 에 전달하는 의미
		// view.forward(request, response); 없으면 정보들을 전달 불가
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
