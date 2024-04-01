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
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/finalimglogo.png">
    <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/boardcss.css">
    <link rel="stylesheet" href="assets/css/boardstyle.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <a href="goindex.do" class="brand-logo">
                <img class="logo-abbr" src="assets/images/finalimglogo.png" alt="">
                <img class="logo-compact" src="assets/images/finalmainlogo.png" alt="">
                <img class="brand-title" src="assets/images/finalmainlogo.png" alt="" height ="40px">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
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
										<input class="form-control" type="search" placeholder="Contest Search"
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="SelectScrapAll.do" role="button"> <!-- data-toggle="dropdown" -->
									<img class = "scrapright" src="assets/images/allpagescrap.png" height="10px" width="10px">
									<!--  <div class="pulse-css"></div> -->
							</a>
					
							<div>
							<span style="color:#593BDB; font-weight: 700;">${profile.userId}님</span>
						</div>
								</li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<img class="mdi mdi-account" src="assets/images/memberprofileimg/1.png" width = "30px" height = "30px" style="border-radius: 15px; margin-right: 10px;">
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
           
            <div class="board_wrap">
                <div class="board_title" style = "font-family : 'waguri';">
                    <strong>DOCUMENT</strong>
                    <!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
                </div>
                <div class="board_list_wrap" style = "font-family : 'gmarket';">
                    <div class="board_list">
                        <ul class="board_row title_row">
                            <li class="noticeboardnum">번호</li>
                            <li class="noticeboardtitle">제목</li>
                            <!-- 게시글 리스트에서 파일 첨부 확인
                                    <div class="attachment">
                                    <a href="./images/attach.png"><img src="./images/attach.png" alt="" width="25px" height="25px"></a>
                                </div> -->
                            <li class="noticeboardwriter">작성자</li>
                            <li class="noticeboarddate">작성일</li>
                            <!-- <div class="ourboardcount">조회</div> -->
                        </ul>
                      
                        	<div class="postTitle">
                            	<!-- 여기에 게시판 글들이 들어가요! -->
                       		</div>
                     
                    </div>
                    <div class="notice_boardpagination">
                        <button class="before_move" onclick="before()"><<</button>
                        <div class="block">
                            <!-- 블럭 추가로 들어오는 위치 -->
                        </div>
                        <button class="next_move" onclick="next()">>></button>
                    </div>
                    <div class="bt_wrap">
                        <a href="goDocumentWrite.do" class="on">등록</a>
                    </div>
                </div>
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
    <script src="assets/js/notice-board.js"></script>

   <script>
                $(document).ready(function() {
                    // 게시물 목록에서 각 게시물의 첨부파일을 가져와서 첨부파일이 있으면 보이도록 설정
                    $(".post").each(function() {
                        var attachmentLink = $(this).find(".attachment a").attr("href");
                        if (attachmentLink !== undefined && attachmentLink !== "") {
                            $(this).find(".attachment").show();
                        }
                    });
                });
    </script>



</body>

</html>