<%@page import="com.kh.SemiTest.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String msg = (String)session.getAttribute("msg");
	Member loginMember = (Member)session.getAttribute("loginMember");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">
	<script> 
		// 로그인 실패 메세지 출력 후 
		// session에 남아있는 "msg" 속성 제거
		<% if(msg != null) {  %> // 로그인이 실패한 경우
			alert("<%=msg%>");			
		<% 
				session.removeAttribute("msg");
			}
		%>
		
	</script>
</head>
<body>
	<header class="blog-header">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1">
				<a class="text-muted" href="<%= request.getContextPath()%>"> 
				<!-- contextroot로 이동하는 동작             서버ip:8080/sjproject		-->
				<img src="https://www.iei.or.kr/resources/images/common/top_logo.jpg"
					height="60px">
				</a>
			</div>
			<%-- 로그인이 되어있지 않은 경우 start 지점 --%>
			<% if(loginMember == null) {%> <%-- 로그인이 안되어있을 떄만 로그인 버튼 보임 --%>
			<div class="col-4 d-flex justify-content-end align-items-center">
				<a id="modal-120930" href="#modal-container-120930" role="button"
					class="btn btn-sm btn-outline-secondary" data-toggle="modal">로그인</a>

				<div class="modal fade" id="modal-container-120930" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="myModalLabel">로그인 모달창</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<form class="form-signin" method="POST" 
								action="<%=request.getContextPath()%>/member/login.do"
								onsubmit="return loginValidate();">
								
									<input type="text" class="form-control" id="memberId" name="memberId"
										placeholder="아이디"> <br> 
									<input type="password" class="form-control" id="memberPwd" name="memberPwd"
										placeholder="비밀번호"> <br>
									<div class="checkbox mb-3">
										<label> <input type="checkbox"> 아이디 저장
										</label>
									</div>
									<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
									<a class="btn btn-lg btn-secondary btn-block" href="<%= request.getContextPath() %>/member/signUpForm.do">회원가입</a>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div><%-- 로그인이 되어있지 않은 경우 End 지점 --%>
			<% } else { %>
				<%-- 로그인이 된 경우 start --%>
				<div class="d-flex justify-content-end align-items-center">
					<%= loginMember.getMemberName() %>님 환영합니다.
					&nbsp;
					<a href="#" role="button" class="btn btn-sm btn-outline-secondary">마이페이지</a>
					&nbsp;
					<a href="<%= request.getContextPath() %>/member/logout.do" 
					role="button" class="btn btn-sm btn-outline-secondary">로그아웃</a>
				</div>
				<%-- 로그인이 된 경우 end --%>
			<% } %>
		</div>
	</header>
	
	
	<script>
		// 로그인 유효성 검사
		function loginValidate(){
			// trim() : 문자열 앞뒤 공백 제거
			if( $("#memberId").val().trim().length == 0) {
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				
				return false; /* 폼태그 기본 동작(값넘김) 제거 */
			}
			if( $("#memberPwd").val().trim().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#memberPwd").focus();
				
				return false; /* 폼태그 기본 동작 제거 */
			}
			
			return true;
		}
	</script>
	
	

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>