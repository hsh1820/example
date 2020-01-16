<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Javascript 방식의 Ajax</title>
<script>
	// XMLHttpRequest 객체 생성
	// - Ajax는 브라우저 내장 객체인 XMLHttpRequest객체를 이용하여 구현
	
	var xhr;

	// XMLHttpRequest 객체를 바로 생성하지 않고 
	// 크로스브라우저 대처 작업을 진행하여 생성
	// -> 브라우저 별로 Ajax에 사용되는 객체가 다름
	function getXMLHttpRequest(){
		// IE 7버전 이상 또는 그 외 브라우저들 
		if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}
		
		// IE 6버전 이하
		else if(window.ActiveXObject) {
			try{
				return ActiveXObject("Microsoft.XMLHttp");
			}catch(e){
				return null;
			}
		}
		// ajax를 지원하지 않는 브라우저 
		else {
			return null;			
		}
	}
</script>
</head>
<body>
	<h2>버튼 클릭 시 페이지가 갱신 또는 이동 되는지 꼭 확인할 것</h2>
	
	<h3>1. 버튼 클릭 시 GET 방식으로 서버에 데이터 전송 및 응답.</h3>
	<button onclick="jsAjax1();">GET 방식 전송</button>
	<p id="test1"></p>
	<hr>
	
	<h3>2. 버튼 클릭 시 POST 방식으로 서버에 데이터 전송 및 응답.</h3>
	<button onclick="jsAjax2();">POST 방식 전송</button>
	<p id="test2"></p>
	<hr>
	
	<script>
	
		function jsAjax1(){
			
		// 1.XMLHttpRequest 객체 생성
		xhr = getXMLHttpRequest();
		
		// 2. onreadystatechange
		// Ajax 통신이 성공(비동기로 서버와 연결이 된 상태)한 경우에 대한 동작 구현 
		xhr.onreadystatechange = function(){
			
			// 1) readyState : 서버 응답 상태 확인
			// -> Ajax 통신 진행 상황 확인 
			if(xhr.readyState == 4){ 
				// xhr.readyState == 4 -> 
				// 요청을 정상적으로 받고 응답할 준비가 됨
				
				// 2) status : HTTP 응답 상태 코드
				// -> 응답이 정상적으로 이루어 졌는지 확인
				if(xhr.status == 200){
					// statue == 200 -> 응답이 정상적으로 이루어짐
					// 404, 400, 500
					console.log("jsAjax1() - ajax 통신 성공");
					
					var str = xhr.responseText;
					// responseText : 응답데이터 문자열을 반환
					//repsonse.getWriter()로 만들어진 문자열들이 쌓여서 하나의 문자열이된것 
					
					document.getElementById("test1").innerHTML = str;
				}
			}
		}
		
		// 3. open() : 서버와 데이터 교환 시 필요한 정보 입력
		xhr.open("GET", "<%= request.getContextPath()%>/jsAjax1.do?name=홍길동&age=20", true);
		// 		  전송방식                               요청할 URL						    true : 비동기, false : 동기
														// 쿼리스트링(input태그 없이도 사용 가능) 
		// 4. send() : 서버로 데이터 교환 요청
		xhr.send();
	}
		
		
		function jsAjax2(){
			
			// 1.XMLHttpRequest 객체 생성
			xhr = getXMLHttpRequest();
			
			// 2. onreadystatechange
			// Ajax 통신이 성공(비동기로 서버와 연결이 된 상태)한 경우에 대한 동작 구현 
			xhr.onreadystatechange = function(){
				
				// 1) readyState : 서버 응답 상태 확인
				// -> Ajax 통신 진행 상황 확인 
				if(xhr.readyState == 4){ 
					// xhr.readyState == 4 -> 
					// 요청을 정상적으로 받고 응답할 준비가 됨
					
					// 2) status : HTTP 응답 상태 코드
					// -> 응답이 정상적으로 이루어 졌는지 확인
					if(xhr.status == 200){
						// statue == 200 -> 응답이 정상적으로 이루어짐
						// 404, 400, 500
						console.log("jsAjax2() - ajax 통신 성공");
						
						var str = xhr.responseText;
						// responseText : 응답데이터 문자열을 반환
						//repsonse.getWriter()로 만들어진 문자열들이 쌓여서 하나의 문자열이된것 
						
						document.getElementById("test2").innerHTML = str;
					}
				}
			}
			
			// 3. open() : 서버와 데이터 교환 시 필요한 정보 입력
			xhr.open("POST", "<%= request.getContextPath()%>/jsAjax2.do", true);
			// POST 방식에서는 URL 로 값을 넘길 때 쿼리스트링을 사용하지않는것을 지향
			
			// * POST 방식 데이터 전송 시 send() 호출하기 전에 
			// 전달되는 데이터에 Mime Type을 설정해야 함
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");				
			
			
			// 4. send() : 서버로 데이터 교환 요청
			xhr.send("name=신사임당&age=40");
		}
	</script>
</body>
</html>