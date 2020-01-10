<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String pizza = (String)request.getAttribute("pizza");
    String toppings = (String)request.getAttribute("topping");
    String sides = (String)request.getAttribute("side");
    int price = (int)request.getAttribute("price");
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {font-weight: bold;font-size: 20px;}
    span.pizza{color: red;}
    span.toppings{color:green; font-weight: bold; }
    span.sides{color:blue; font-weight: bold;}
    span.price{font-weight: bold; text-decoration: underline;}
</style>
</head>
<body>
	<h2>주문 내역</h2>
        피자는 <span class="pizza"><%= pizza %></span>,
        토핑은 <span class="toppings"><%= toppings %></span>,
        사이드는 <span class="sides"><%= sides %></span>,
      
    주문하셨습니다.
    
    <br><br><br><br><br>
    <h2>총합 : <span class="price"><%= price %>원</span></h2>
    
</body>
</html>