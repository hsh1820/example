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
			
			// 3. 서버로 기본형 데이터 전송 후
			//    응답을 객체(Object)로 전달 받기
			$("#btn3").click(function(){
				var input = $("#input3").val();
				
				$.ajax({
					url : "../jqTest3.do",
					data : {input:input},
					dataType : "json", // * json 데이터를 전달하는 방법 3
					// dataType : 응답데이터의 형식을 지정
					type : "get",
					success : function(obj){
						// * json 데이터를 전달하는 방법 2
//						obj = JSON.parse(obj);
						// 매개변수로 들어온 문자열이 json 형식이면 자바스크립트 객체로 변환
						var result = "";
						
						if(obj != null){
							result = "번호 : " + obj.no + "\n" ;
							result += "이름 : " + obj.name + "\n" ;
							result += "나이 : " + obj.age + "\n" ;
							result += "성별 : " + obj.gender;
						}else {
							result = "사용자 정보가 없습니다.";
						}
						
						$("#textarea3").val(result);
						
						console.log(obj);
					},
					error : function(){
						console.log("ajax 통신 실패");
						
					}
				});
			});
			
			//4. 서버로 기본형 데이터를 전송 후, 응답을 리스트(List)형태로 받기
			$("#btn4").click(function(){
				var gender = $('input[name="chk_gender4"]:checked').val();
				$.ajax({
					url : "../jqTest4.do",
					data : {gender:gender},
					type : "get",
					dataType : "json",
					success:function(list){
						console.log(list);
						
						// $.each(배열명, function(index){});
						// --> 배열명[index] 각 요소에 접근 가능
						
						var result ="";
						
						$.each(list, function(i){
							result += list[i].no + " / "
									 + list[i].name + " / "
									 + list[i].age + " / "
									 + list[i].gender + "\n"
						});
						
						$("#textarea4").val(result);
					},
					error:function(){
						consol.log("ajax 통신 실패")
					}
				
				});
			});
			
			// 6. Gson을 이용하여 응답을 List 형태로 전송받아 테이블에 출력하기
			$("#btn6").click(function(){
				$.ajax({
					url : "../jqTest6.do",
					type : "post",
					dataType : "json",
					success:function(list){
						console.log(list);
						
						var $tableBody = $("#memberTable6 tbody");
						
						$tableBody.html("");
						
						var $result;
						
						$.each(list, function(i){
							$result = "";
							$result += "<tr><td>" + list[i].no + "</td>"
									+  "<td>" + list[i].name + "</td>"
									+  "<td>" + list[i].age + "</td>"
									+  "<td>" + list[i].gender + "</td></tr>";
							$tableBody.append($result);
						});
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
				
			});
			
			
			
			
			
			
			
			
			
			
		});