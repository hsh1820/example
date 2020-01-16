$(function(){
			// 1. 버튼 클릭 시 GET 방식으로 서버에 입력값 전송 및 응답
			$("#btn1").click(function(){
				var input = $("#input1").val();
				
				$.ajax({
					// {} : 자바스크립트 객체 형식 으로 값을 넘김
					// -> ajax 내부 구성도 자바스크립트 형식임
					url : "../jqTest1.do",
					// data : 요청 시 전달할 파라미터 설정
					data : {input:input},
						//   key    var input
					// type : 전송 방식(GET/POST) 
					type : "GET",
					
					// success : Ajax 통신 성공 시 처리할 함수를 지정하는 속성
					success : function(result){
						// success 함수의 매개변수(result)의 의미
						// -> 서버에서 전달받은 응답 데이터가 저장된 변수
						// -> 이 매개변수 명은 임의로 지정 가능
						console.log("1번 Ajax 통신 성공 !");
						$("#output1").val(result);
						// input태그는 값을 넣을때 val()
						
					},
					// error : Ajax통신 실패 시 처리할 함수를 지정하는 속성
					error : function(){
						console.log("1번 Ajax 통신 실패");
					},
					
					// complete : 통신 성공 여부 관계없이 실행되는 함수를 지정하는 속성
					complete : function(){
						console.log("무조건 호출되는 것 확인");
					}
				});
			});
			
			
			
			
			
			
			
			
			
			
			
			
			
			// 2. 버튼 클릭 시 POST 방식으로 서버에 데이터 전송 및 응답
			$("#btn2").click(function(){
				var input = $("#input2").val();
				
				$.ajax({
					url : "../jqTest2.do",
					data : {input : input},
					type : "POST",
					
					//dataType : 서버의 응답데이터 형식을 지정해주는 속성
					dataType : "text",
					// 굳이 안써도 되나 미작성 시 자동으로 응답데이터의 형식을 판단하여 지정함
					// JSON 사용 시에는 반드시 "JSON"으로 작성
					
					success : function(data){
						$("#output2").val(data);
					},
					
					error : function(e){
						console.log("2번 ajax 통신 실패 .. ");
						console.log(e);
					}
					
					
				})
			});
			
		});