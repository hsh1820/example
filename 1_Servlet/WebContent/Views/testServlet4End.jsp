<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/* JSP에서 JAVA코드 작성한다는 의미 */
	String name = (String)request.getAttribute("name");
	String age = (String)request.getAttribute("age");
	String gender = (String)request.getAttribute("gender");
	String city = (String)request.getAttribute("city");
	String height= (String)request.getAttribute("height");
	String recommendation= (String)request.getAttribute("recommendation");
	String foods = (String)request.getAttribute("foods");
	// request.getAttribute() : Object 형으로 리턴되어있는 상태
	// request.setAttribute("name", name);
	//                         ^ 키값을 입력
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 출력 화면</title> 
        <style>
            h2{color: red;}
            span.name{color:orange; font-weight: bold; }
            span.gender{color:yellow; font-weight: bold; background-color: black;}
            span.age{color:green; font-weight: bold; }
            span.city{color:blue; font-weight: bold; }
            span.height{color:navy; font-weight: bold; }
            span.food{color:purple; font-weight: bold; }
        </style>
    </head>
    <body>
        <h2>개인 정보 입력 결과(Servlet + JSP)</h2>
        <span class="name"><%= name %></span>님은 
        <span class="age"><%= age %></span> 이시며,
        <span class="city"><%= city %></span> 에 사는
        키 <span class="height"><%= height %></span> cm인 
        <span class="gender"><%= gender %></span> 입니다.
        <br>
        좋아하는 음식은 
        <span class="food"><%= foods %></span> 입니다. 
        
        <h3><%= age %>에 맞는 선물 추천</h3>
        '<%= recommendation %>' 선물은 어떠신가요?
        
    </body>
</html>