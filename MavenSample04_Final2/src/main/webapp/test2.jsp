<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>	
<body>
	<h1>테스트 2번 입니다.</h1>
	<div id="text"></div>
    <button id="btn">요청</button>

    <script>

        // 버튼을 클릭했을떄 api url 에 데이터를 요청
        $("#btn").on("click",function(){
            // ajax를 통해서 비동기 요청
            $.ajax({
                // 1. 요청을 보낼 서버의 주소 
                // 프로젝트 할때 URL -> 백엔드 컨트롤러와 연관 있는 부분 /join               
                url : "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=b95eae622d21911cfdc90b750d52f0c4&targetDt=20240304",
                // 2. 요청 방법 명시(get, post) 기본값 get
                type : "get",
                // 3. 데이터를 보내는 공간
                // data : "넘길 데이터"
                // 4. 응답데이터를 처리하는 공간(성공)
                // 응답 성공시에는 반드시 매개변수에 저장
                // json -> 자바스크립트 객체 데이터 -> 키, 인덱스 잘 활용해서 꺼내오기!
                success : function(res){
                    // console.log(res.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
                    // $("#txt").html(res.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
                    // 모든 데이터를 랭크, 영화이름, 개봉일자 출력
                    console.log(res.boxOfficeResult.dailyBoxOfficeList);
                    for(var i = 0; i<res.boxOfficeResult.dailyBoxOfficeList.length; i++){
                        var str = 
                        `
                            <span>랭크 : ${res.boxOfficeResult.dailyBoxOfficeList[i].rank}</span>
                            <span>개봉일 : ${res.boxOfficeResult.dailyBoxOfficeList[i].openDt}</span>
                            <span>영화제목 : ${res.boxOfficeResult.dailyBoxOfficeList[i].movieNm}</span>
                            <br>
                        `
                        $("#text").append(str);
                    }
                },
                // 5. 응답데이터를 처리하는 공간(실패)
                error : function(){
                    alert("요청에 실패했습니다.");
                }
            })
        })
        // 성공했다면 div에 내용을 넣겠다!


    </script>
	
</body>
</html>