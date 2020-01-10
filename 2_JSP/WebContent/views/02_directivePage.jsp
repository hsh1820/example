<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" errorPage="error.jsp"%><!-- 2. 1개의 page 지시자에 추가 --><!-- 
	errorPage 사용시 exception 사용 가능
 --><!-- 자바 api import방법 -->
<!-- 1. 페이지 지시자를 새로 선언해서 import -->
<%-- <%@ page import="java.util.ArrayList" %> --%>   
<!-- jsp 문서 특성 상 import 자동 완성시 최상단에 있는 import 구문을 page 지시자 밑에 선언되야 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 지시자(import, errorPage)</title>
</head>
<body>
	<!-- html 주석 -->
	<%-- JSP 주석 --%>
	
	<%-- -- <h1>주석 처리 테스트</h1> --> --%>
	<!-- HTML 주석은 클라이언트에게 전달됨 -->
	<%-- JSP 주석은 클라이언트에게 전달되지 않는다. 컴파일단계에서 사라짐. 주석은 컴파일 안됨 --%>
	<%
		ArrayList<String> list = new ArrayList<String>();
		
		list.add("HTML");
		list.add("Servlet");
		list.add("JSP");
		
		// 강제로 에러 요소 추가
		list.add(10, null);
		
		for(String str : list){
	    	System.out.println(str);
		}
	%>
	
	<h3>단순 출력</h3>
	<%= list.get(0) %><br>
	<%= list.get(1) %><br>
	<%= list.get(2) %><br>
	
	<h3>Scriptlet + exprssion + HTML</h3>
	<% for(String str : list){	%>
		<%= str %>
		<br>
	<% } %>
	
	<h3>Scriptlet + expression + Javascript</h3>
	<button onclick="test();">확인하기</button>
	<p id="area"></p>
	
	<script>
		function test(){
			var area = document.getElementById("area");
			
			// 이전 내용 삭제
			area.innerHTML = "";
			
			<% for (String str : list){	%>
				area.innerHTML += "<%= str %><br>"; /* javascript에서 자바의 문자열을 인식하기 위해 "" 붙음 */
			<% } %>
		}
		
		
	</script>
</body>
</html>