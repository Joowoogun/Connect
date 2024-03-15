// js 코드를 작성할수 있는 공간
		
		// jquery 문법 기준
		
		// 1) 버튼 태그를 DOM 형식으로 가져와서 클릭했을 때 이벤트 등록
		$(".btn").on("click",function(){
		// 2) 클릭했을 떄 , input태그를 DOM 형식으로 가져와서 안쪽에 입력된 글자 꺼내오기
			let sendData = {
				"sendData" : $("#data").val()
				};
		// 3) console에 출력하기
			console.log(sendData)
		// 4) 비동기통신을 사용하여 Servlet으로 데이터 전송
			$.ajax({
			// 보내줄 url : 서블릿쪽 맵핑값
			url: "Ajax",
			// 보내줄 data : 객체형태로 보냄
			data : sendData,
			// 전송방식 지정
			type : "get",
			// 결과값 자료형 지정 <---------------------------------- json 
			dataType : 'json',
			// 성공했을 떄 실행할 함수 지정
			success : (res)=>{
				console.log("데이터 전송 성공!");
				console.log("받아온 데이터 >> ",res);
			},
			// 실패했을 떄 실행할 함수 지정
			error : ()=>{
				console.log("데이터 전송 실패");
			}			
			
			})
		
		})
		
		