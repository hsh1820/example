<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
</head>
<!-- onload를 이용해 idValue() 실행 -->
<body onload="idValue();"> <!-- 페이지 로딩이 다 된 다음 idValue() 실행 -->
	<h4>아이디 중복 검사</h4>
	<br>
	<form action="<%= request.getContextPath() %>/member/idDupCheck.do" id="idChekcForm" method="post">
		<input type="text" id="id" name="id">
		<input type="submit" value="중복확인">
	</form>
	<br>
	
	<% 
		if(request.getAttribute("result") != null){ 
			
			int result = (int)request.getAttribute("result");
			
			if(result > 0){
	%>
				이미 사용중인 아이디입니다.
	<%
			} else{ 
	%>
				사용 가능한 아이디입니다.
	<%
			}
		}
	%>
	
	<br>
	<br>
	
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	<input type="button" id="confirmId" value="확인" onclick="confirmId();" disabled="disabled">
	<!-- usedId() 함수 작성하자 -->
	
	<script type="text/javascript">
	
		// 중복체크창 아이디 입력부분 초기 값 및 확인버튼 활성/비활성 설정
		function idValue(){
			var id;
			if("<%= request.getAttribute("result") %>" == "null"){
				id = opener.document.signUpForm.id.value; // 부모창의 아이디 저장
				// 나를 연 부모창. 문서에서. signUpForm인 name값. id라는 input태그의. value값을 가져와라
			}else{ // result가 있으면 DB에서 조회해서 값을 가져온 것
				// 중복 체크 후 아이디 저장
				id = "<%= request.getAttribute("id") %>"; /* DB에서 가져온 ID값 저장 */
				
				// 중복체크 확인 버튼 활성/비활성
				if(<%= request.getAttribute("result")%> == 0){ // 0이면 사용가능
					document.getElementById("confirmId").removeAttribute("disabled");	// disabled 속성 제거		
				}else{
					document.getElementById("confirmId").setAttribute("disabled", "disabled");
				}
			}
			
			document.getElementById("id").value = id;
			
		}
	
		function confirmId(){ // 중복체크 확인 시 회원가입창 아이디 부분 비활성화
			console.log(opener.document.signUpForm.idDup);
			if(<%= request.getAttribute("result")%> == 0){
				opener.document.signUpForm.id.value = document.getElementById("id").value;
				// 중복체크를 확인받아온 아이디 값을 부모창의 id input태그 value 로 전달
				opener.document.signUpForm.idDup.value = true;
				
			}else{
				opener.document.signUpForm.idDup.value = false;
			}
		
			if(opener != null){ // 아이디 중복창 닫기 
				// 부모창이 있으면 현재 창 닫기
				opener.checkForm = null;
				self.close();
			}
		}
		
	</script>
</body>
</html>