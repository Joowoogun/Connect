<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="name">
	<button>검색</button>
	<div>
		<!-- 크롤링한 이미지 결과 1장만 띄워볼거임! -->
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		$("button").on("click",function(){
			let sendData = {"name":$("#name").val()}
			$.ajax({
				url : "http://127.0.0.1:9000/",
				data : sendData,
				success : (res) => {
					console.log("데이터 통신 성공",res);
					$("div").append(`<img src='\${res}'>`);
				},
				error : () => {
					console.log("데이터 통신 실패")
				}
			
			})
			
		})
	
	
	
	
	
	</script>
</body>
</html>