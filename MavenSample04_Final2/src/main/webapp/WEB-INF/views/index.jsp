<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.ScrapListVO"%>
<%@page import="java.util.Set"%>
<%@page import="com.smhrd.model.TodolistVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>ConNect</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/finalimglogo.png">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">



</head>

<%
MemberVO mvo = (MemberVO) session.getAttribute("profile");
%>
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
				src="assets/images/finalimglogo.png" alt=""> <img
				class="logo-compact" src="assets/images/logo-text.png" alt="">
				<img class="brand-title" src="assets/images/ConNectFont.png" alt="">
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
										<input class="form-control" type="search" placeholder="Search"
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="" role="button"> <!-- data-toggle="dropdown" -->
									<form action="SelectScrapAll.do" method="post">
										<input class="scrapright" type="image"
											src="assets/images/scrap.png" height="18px" width="27px">
										<c:forEach items="${conProfile}" var="cl">
											<input type="hidden" name="conNum" value="${cl.conIdx}">
											<input type="hidden" name="conName" value="${cl.conName}">
										</c:forEach>
									</form> <!--  <div class="pulse-css"></div> -->
							</a>

								<div>
									<span style="color: #593BDB; font-weight: 700;">${profile.userId}</span>
								</div>
								</li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="gopage-mypage.do" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">MyPage </span>
									</a> <a href="gopage-login.do" class="dropdown-item"> <i
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
					
					<li><a href="goindex.do" aria-expanded="false"><img
							src="assets/images/contesttab.png" width="18px" height="18px"
							style="margin-right: 5px;"><span class="nav-text">CONTEST</span></a></li>
					<li><a href="goQuickView.do" aria-expanded="false"><img
							src="assets/images/quickviewtab.png" width="18px" height="18px"
							style="margin-right: 5px;"><span class="nav-text">QUICK
								VIEW</span></a></li>
					<li><a href="goCalendar.do" aria-expanded="false"><img
							src="assets/images/calendartab.png" width="18px" height="18px"
							style="margin-right: 5px;"><span class="nav-text">CALENDAR</span></a></li>
					<li><a href="SelectTodoAll.do" aria-expanded="false"><img
							src="assets/images/todotab.png" width="18px" height="18px"
							style="margin-right: 5px;"><span class="nav-text">TO
								DO</span></a></li>
					<li><a href="goDocument.do" aria-expanded="false"><img
							src="assets/images/documenttab.png" width="18px" height="18px"
							style="margin-right: 5px;"><span class="nav-text">DOCUMENT</span></a></li>
					
				</ul>
				</li>
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
			<!-- row -->
			<div>
				<table width="1600px" align="center">

					<tr height="400px">
						<th colspan="6"><img src="assets/images/display.jpg"
							width="1600px"></th>
					</tr>


					<tr height="100px" align="center">
						<td><input type="button" value="코딩/회로"></td>
						<td><input type="button" value="인문/사회"></td>
						<td><input type="button" value="미술/체육"></td>
						<td><input type="button" value="광고/기획"></td>
						<td><input type="button" value="사진/영상"></td>
						<td><input type="button" value="공학/과학"></td>


						<!-- 공모전 정보수에따라 이미지 눌러서 들어갈 수 있게 함 -->
					</tr>
					<tr height="300px">
						<c:forEach items="${conProfile}" var="ci">
							<form action="ClickContestInfo.do" method="post">
								<td><input type="image"
									src="assets/images/${ci.conHomepage}.jpg" width="270px">
									<input type="hidden" name="conNum" value="${ci.conIdx}">
									<input type="hidden" name="conName" value="${ci.conName}">
									<c:forEach items="${scrapProfile}" var="si" varStatus="status">
										<input type="hidden" name="scrapconName${status.index}"
											value="${si}">
									</c:forEach></td>
							</form>
						</c:forEach>
						<td><img src="assets/images/imgex03.jpg" width="270px"></td>
						<td><img src="assets/images/imgex04.png" width="270px"></td>
						<td><img src="assets/images/imgex05.jpg" width="270px"></td>
						<td><img src="assets/images/imgex06.png" width="270px"></td>
					</tr>

				</table>
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
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
					2019
				</p>
				<p>
					Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
				</p>
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

</body>

</html>