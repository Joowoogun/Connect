<%@page import="java.util.Set"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.smhrd.model.ContestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>CONNECT</title>
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

//formatInquiryText 함수 정의
function formatInquiryText(text) {
 // "-"로 시작하는 문장을 <br> 태그로 구분하여 분리
 let lines = text.split("\n").map(line => line.trim());
 let formattedText = "";

 for (let i = 0; i < lines.length; i++) {
     let line = lines[i];

     // 문장이 "-"로 시작하면 <br> 태그와 "-" 추가 및 클래스 적용
     if (line.includes("-")) {
         formattedText += "<br>" + "<span class='ourcrwcontenttextfont'>- " + line.substring(1).trim() + "</span>";
     } 
     // 문장이 "▶"로 시작하면 <br> 태그 추가 및 클래스 적용
     else if (line.includes("●")) {
         formattedText += "<span class='ourcrwcontenttextsub'>" + line.trim() + "</span>";
     }
     // 문장이 "※"를 포함하면 <br> 태그 추가 및 클래스 적용
     else if (line.includes("*")) {
         formattedText += "<br>" + "<span class='ourcrwcontenttextfont'>" + line.trim() + "</span>";
     } 
     // 그 외의 경우는 클래스만 추가
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

//document ready 함수
document.addEventListener("DOMContentLoaded", function() {
 // 원본 문장
 let text = `${contest.conContent}`;

 // JavaScript 함수 호출하여 문장 포맷팅
 let formattedText = formatInquiryText(text);

 // 결과를 적절한 HTML 요소에 삽입
 document.getElementById("formattedText").innerHTML = formattedText;
});

</script>


</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="goindex.do" class="brand-logo"> <img class="logo-abbr"
				src="assets/images/finalimglogo.png" alt="" width="40px"
				height="40px"> <img class="logo-compact"
				src="assets/images/finalmainlogo.png" alt=""> <img
				class="brand-title" src="assets/images/finalmainlogo.png" alt=""
				height="40px">
			</a>

			<div class="nav-control">
				<div class="hamburger">
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">
							<div class="search_bar dropdown">
								<span class="search_icon p-3 c-pointer" data-toggle="dropdown">
									<i class="mdi mdi-magnify"></i>
								</span>
								<div class="dropdown-menu p-0 m-0">
									<form>
										<input class="form-control" type="search"
											placeholder="Contest Search" aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="SelectScrapAll.do" role="button"> <!-- data-toggle="dropdown" -->
									<img class="scrapright" src="assets/images/allpagescrap.png"
									height="10px" width="10px"> <!--  <div class="pulse-css"></div> -->
							</a>

								<div>
									<!-- 프로필 이미지 img -->
									<!-- <img src="assets/images/memberprofileimg/1.png" width = "30px" height = "30px" style="border-radius: 15px; margin-right: 10px;"> -->
									<!-- 프로필 닉네임 -->
									<span style="color: #593BDB; font-weight: 700;">${profile.userId}</span>
								</div> <!-- 프로필 드롭다운 -->
								</li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">

									<!-- 변경한 이미지 img --> <img class="mdi mdi-account"
									src="assets/images/memberprofileimg/1.png" width="30px"
									height="30px" style="border-radius: 15px; margin-right: 10px;">
									<!-- 원래 드롭다운 i태그 --> <!-- <i class="mdi mdi-account"></i> -->
							</a>
								<div class="dropdown-menu dropdown-menu-right">
                                  <a href="Mypage.do" class="dropdown-item"> <i
                                     class="icon-user"></i> <span class="ml-2">MyPage </span>
                                  </a> 
                                  <a href="Logout.do" class="dropdown-item"> <i
                                     class="icon-key"></i> <span class="ml-2">Logout </span>
                                  </a>
                               </div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="quixnav">
         <div class="quixnav-scroll">
            <ul class="metismenu" id="menu">
               <li class="nav-label first">MENU</li>

               <!-- 사이드 카테고리 -->
              <li><a href="goindex.do" aria-expanded="false"><img
                     src="assets/images/contesttab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">CONTEST</span></a>
               </li>
               <li><a href="fullCalendar.do" aria-expanded="false"><img
                     src="assets/images/calendartab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">CALENDAR</span></a></li>
               <li><a href="SelectTodoAll.do" aria-expanded="false"><img
                     src="assets/images/todotab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">TO
                        DO</span></a></li>
               <li><a href="goDocument.do" aria-expanded="false"><img
                     src="assets/images/documenttab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">DOCUMENT</span></a></li>

            </ul>
         </div>


      </div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<!-- 크롤링 포스터 제목 -->
			<div class="ourcrwcontesttitle" style = "font-family : 'waguri';">

				<span id="contestcrwtitle"> ${contest.conName} </span>
				<hr width="97%">
			</div>

			<!-- 크롤링 포스터 + 내용 -->
			<!-- 전체 DIV -->
			<div class="ourcrwviewcontent" >
				<!-- 전체2 DIV -->
				<div class="ourcontentdetail">
					<!-- 플렉스 DIV -->
					<div class="ourflexcontentdetailtop">
						<!-- 왼쪽 포스터 -->
						<div class="ourimgwrap">
							<img src="assets/images/${contest.conIdx}.png" width="600px"
								height="650px">
						</div>

						<!-- 오른쪽 전체 DIV -->
						<div class="ourpositonrelative" style = "font-family : 'gmarket';">



							<!-- 1문단 div-->
							<div>
								<!-- 1문단 tit-->
								<div class="ourpttit">주최</div>
								<!-- 1문단 txt-->
								<div class="ourpttxt">${contest.conHost}</div>
							</div>

							<!-- 2문단 div-->
							<div>
								<!-- 2문단 tit-->
								<div class="ourpttit">응모분야</div>
								<!-- 2문단 txt-->
								<div class="ourpttxt">
									<ul class="ourptclearfix">
										<li>${contest.conCategory}</li>
									</ul>
								</div>
							</div>

							<!-- 3문단 div-->
							<div>
								<!-- 3문단 tit-->
								<div class="ourpttit">접수방법</div>
								<!-- 3문단 txt-->
								<div class="ourpttxt">홈페이지</div>
							</div>

							<!-- 4문단 div-->
							<div>
								<!-- 4문단 tit-->
								<div class="ourpttit">접수기간</div>
								<!-- 4문단 txt-->
								<div class="ourpttxt">${contest.conStartDate} ~
									${contest.conEndDate} ${contest.conEndTime}</div>
							</div>

							<!-- 5문단 div-->
							<div>
								<!-- 5문단 tit-->
								<div class="ourpttit">참가자격</div>
								<!-- 5문단 txt-->
								<div class="ourpttxt">
									<ul class="ourptclearfix">
										<li>${contest.conSpec}</li>
									</ul>
								</div>
							</div>

							<!-- 6문단 div-->
							<div>
								<!-- 6문단 tit-->
								<div class="ourpttit">시상종류</div>
								<!-- 6문단 txt-->
								<div class="ourpttxt">${contest.conRewardType}</div>
							</div>

							<!-- 7문단 div-->
							<div>
								<!-- 7문단 tit-->
								<div class="ourpttit">시상금(1등)</div>
								<!-- 7문단 txt-->
								<div class="ourpttxt">${contest.conReward}</div>
							</div>

							<!-- 8문단 div-->
							<div>
								<!-- 8문단 tit-->
								<div class="ourpttit">홈페이지</div>
								<!-- 8문단 txt-->
								<div class="ourpttxt">
									<a href="${contest.conHomepage}"
										style="color: black;"><u>${contest.conHomepage}</u></a>
								</div>
							</div>
							<div class="ourbuttonframe">
								<c:choose>
									<c:when test="${scrapconNamesList.contains(contest.conName)}">
										<button id="scrapBtn" class="ourcustom-btn btn-7"
											type="button">스크랩취소</button>
									</c:when>
									<c:otherwise>
										<button id="scrapBtn" class="ourcustom-btn btn-7"
											type="button">스크랩하기</button>
									</c:otherwise>
								</c:choose>
							</div>

						</div>

					</div>
					<!-- 아래 수평선 -->
					<hr width="97%">

				</div>


			</div>

			<!-- 공모요강 -->
			<div class="ourcrwcontenttext" style = "font-family : 'gmarket';">
				<!-- 공모전 제목 -->
				<P>
					<b> <span
						style="font-size: 20px; font-weight: 700; color: black; margin-left : 60px;">
							${contest.conName} </span>
					</b>
				</P>
				<!-- 공백 -->
				<p></p>
				<div id="formattedText" class="ourcrwcontenttext"></div>
				<input type="hidden" id="scrapStatus" name="scrapStatus" value="">
				<input type="hidden" id="conIdx" name="conIdx"
					value="${contest.conIdx}"> <input type="hidden"
					id="conName" name="conName" value="${contest.conName}"> <input
					type="hidden" id="conStartDate" name="conStartDate"
					value="${contest.conStartDate}"> <input type="hidden"
					id="conEndDate" name="conEndDate" value="${contest.conEndDate}">


			</div>




		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by CONNECT 2024</p>
                <p>Distributed by CONNECT</p> 
            </div>
        </div>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="assets/vendor/global/global.min.js"></script>
	<script src="assets/js/quixnav-init.js"></script>
	<script src="assets/js/custom.min.js"></script>


	<!-- Vectormap -->
	<script src="assets/vendor/raphael/raphael.min.js"></script>
	<script src="assets/vendor/morris/morris.min.js"></script>


	<script src="assets/vendor/circle-progress/circle-progress.min.js"></script>
	<script src="assets/vendor/chart.js/Chart.bundle.min.js"></script>

	<script src="assets/vendor/gaugeJS/dist/gauge.min.js"></script>

	<!--  flot-chart js -->
	<script src="assets/vendor/flot/jquery.flot.js"></script>
	<script src="assets/vendor/flot/jquery.flot.resize.js"></script>

	<!-- Owl Carousel -->
	<script src="assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

	<!-- Counter Up -->
	<script src="assets/vendor/jqvmap/js/jquery.vmap.min.js"></script>
	<script src="assets/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
	<script src="assets/vendor/jquery.counterup/jquery.counterup.min.js"></script>


	<script src="assets/js/dashboard/dashboard-1.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
    	
        let isScrapped = null; // 스크랩 상태를 저장하는 변수
        
        $("#scrapBtn").on("click", function() {
        // 누를때마다 버튼의 텍스트정보를 가지고옴
        let btntxt = $("#scrapBtn").text();

            if (btntxt == "스크랩하기") {
                alert("스크랩이 완료되었습니다.");
                $("#scrapBtn").text("스크랩취소")
                isScrapped = true;
            } else {
                alert("스크랩이 취소되었습니다.");
                $("#scrapBtn").text("스크랩하기")
                isScrapped = false;
            }

            $("#scrapStatus").val(isScrapped ? "true" : "false");

            let sendData = { "scrapStatus": $("#scrapStatus").val(),
            		"conIdx":$("#conIdx").val(),
            		"conName":$("#conName").val(),
            		"conStartDate":$("#conStartDate").val(),
            		"conEndDate":$("#conEndDate").val()}; // sendData에 "scrapStatus"라는 키를 사용하여 값을 설정
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