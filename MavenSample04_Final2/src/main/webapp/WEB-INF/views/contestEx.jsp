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
</head>
<body>
	<div>${contest.conName}<br> ${contest.conCategory}<br>
		${contest.conHomepage}<br> ${contest.conStartDate}<br> ${contest.conEndDate}<br>
		${contest.conEndTime}<br> ${contest.conSpec}<br> ${contest.conRewardType}<br>
		${contest.conReward}</div>
    <input type="hidden" id="scrapStatus" name="scrapStatus" value="">
    <input type="hidden" id="conIdx" name="conIdx" value="${contest.conIdx}">
    <input type="hidden" id="conName" name="conName" value="${contest.conName}">
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