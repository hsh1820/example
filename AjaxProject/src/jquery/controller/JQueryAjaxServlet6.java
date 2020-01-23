package jquery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import jquery.model.vo.User;

@WebServlet("/jqTest6.do")
public class JQueryAjaxServlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JQueryAjaxServlet6() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보가 저장되어있는 List 생성
				ArrayList<User> list = new ArrayList<>();
				
				list.add(new User(1,"박철수", 30, '남'));
				list.add(new User(2,"김영희", 26, '여'));
				list.add(new User(3,"오영심", 32, '여'));
				list.add(new User(4,"이민기", 28, '남'));
				list.add(new User(5,"홍길동", 33, '남'));
				
				response.setCharacterEncoding("UTF-8");
				
		new Gson().toJson(list, response.getWriter());
		// jsonArray로 바꿔서 출력하려는 스트립으로 내보냄
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
