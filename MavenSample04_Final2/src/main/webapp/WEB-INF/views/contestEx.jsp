<%@page import="java.util.Set"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.smhrd.model.ContestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/finalimglogo.png">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/crawlingcss.css" rel="stylesheet">

<script>
    // document ready 함수
    document.addEventListener("DOMContentLoaded", function() {
        // JavaScript 함수 정의
        function formatInquiryText(text) {
            // "-"로 시작하는 문장을 <br> 태그로 구분하여 분리
            let lines = text.split("\n").map(line => line.trim());
            let formattedText = "";

            for (let i = 0; i < lines.length; i++) {
                let line = lines[i];

                // 문장이 "-"로 시작하면 <br> 태그 추가
                if (line.includes("-")) {
                    formattedText += "<br>" + "<span class='ourcrwcontenttextfont'>- " + line.substring(1).trim() + "</span>";
                } 
                // 문장이 "▶"로 시작하면 <br> 태그 추가 및 클래스 적용
                else if (line.includes("▶")) {
                    formattedText += "<span class='ourcrwcontenttextsub'>" + line.trim() + "</span>";
                }
                // 문장이 "※"를 포함하면 <br> 태그 추가
                else if (line.includes("※")) {
                    formattedText += "<br>" + "<span class='ourcrwcontenttextfont'>" + line.trim() + "</span>";
                } 
                // 그 외의 경우는 그대로 추가
                else {
                    formattedText += "<span class='ourcrwcontenttextfont'>" + line + "</span>";
                }

                // 다음 문장이 없거나 "-"로 시작하지 않는 경우에는 <br> 태그 추가
                if (i < lines.length - 1 && !lines[i + 1].startsWith("-")) {
                    formattedText += "<br>";
                }
            }

            return formattedText;
        }

        // 예시 텍스트를 JSP 변수로 저장
        let inquiryText = `${contest.conContent}`;
        
        let formattedInquiryText = formatInquiryText(inquiryText);
        document.getElementById("formattedInquiryText").innerHTML = formattedInquiryText;

        // 함수 호출하여 포맷팅된 텍스트 출력
        console.log(formatInquiryText(inquiryText));
    });
</script>
</head>
<body>
	<div>${contest.conName}<br> ${contest.conCategory}<br>
		${contest.conHomepage}<br> ${contest.conStartDate}<br>
		${contest.conEndDate}<br> ${contest.conEndTime}<br>
		${contest.conSpec}<br> ${contest.conRewardType}<br>
		${contest.conReward}<br>
		<!-- formatInquiryText 함수를 호출하여 포맷팅된 텍스트를 출력 -->
		<div id="formattedInquiryText" class = "ourcrwcontenttext"></div>
	</div>	
	<input type="hidden" id="scrapStatus" name="scrapStatus" value="">
	<input type="hidden" id="conIdx" name="conIdx"
		value="${contest.conIdx}">
	<input type="hidden" id="conName" name="conName"
		value="${contest.conName}">
	<c:choose>
		<c:when test="${scrapconNamesList.contains(contest.conName)}">
			<button class="btn" type="button">스크랩취소</button>
		</c:when>
		<c:otherwise>
			<button class="btn" type="button">스크랩하기</button>
		</c:otherwise>
	</c:choose>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
    	
        let isScrapped = null; // 스크랩 상태를 저장하는 변수
        
        $(".btn").on("click", function() {
        // 누를때마다 버튼의 텍스트정보를 가지고옴
        let btntxt = $(".btn").text();

            if (btntxt == "스크랩하기") {
                alert("스크랩이 완료되었습니다.");
                $(".btn").text("스크랩취소")
                isScrapped = true;
            } else {
                alert("스크랩이 취소되었습니다.");
                $(".btn").text("스크랩하기")
                isScrapped = false;
            }

            $("#scrapStatus").val(isScrapped ? "true" : "false");

            let sendData = { "scrapStatus": $("#scrapStatus").val(),
            		"conIdx":$("#conIdx").val(),
            		"conName":$("#conName").val()}; // sendData에 "scrapStatus"라는 키를 사용하여 값을 설정
            console.log(sendData);

            $.ajax({
                url: "scrapAjax",
                data: sendData,
                type: 'post', // POST 메서드를 사용하여 데이터를 전송
                dataType: 'json',
                success: (res) => {
                    console.log("데이터 전송 성공!");
                    console.log("받아온 데이터 >>", res);
                },
                error: () => {
                    console.log("데이터 전송 실패!");
                }
            });
        }); 
    });
</script>

</body>
</html>