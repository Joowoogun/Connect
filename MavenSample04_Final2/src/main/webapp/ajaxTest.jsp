<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp에서 servlet으로 비동기통신으로 데이터를 보내주기 -->
	<input type="text" id="data">
	<button class="btn">데이터전송</button>
	<!-- jquery 라이브러리 가져오기 -->
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
	// 버튼 태그를 Dom형식으로 가져와서 클릭했을때 이벤트 등록
		$(".btn").on("click",function(){
			// 2)input 데이터 불러오고 변수에 저장
			let sendData = {"sendData":$("#data").val()};
			// 3)console에 출력
			
				console.log(sendData);
		// 4) 비동기 통신을 사용하여 Servlet으로 데이터 전송
		$.ajax({
			// 보내줄 url 
			url : "Ajax",
			// 보내줄 data
			data : sendData,
			// 전송방식 지정
			type : 'get',
			// 데이터타입
			dataType:'json',
			// 성공했을 때 실행할 함수 지정
			success : (res) => {
				console.log("데이터 전송 성공!");
				console.log("받아온 데이터 >> ", res);
			},
			// 실패했을 때 실행할 함수 지정
			error : () => {
				console.log("데이터 전송 실패!");
			}
			
		})
			
		})
		
		
	
	
	</script>
</body>
</html>