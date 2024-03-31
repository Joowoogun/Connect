<%@page import="com.smhrd.model.ScrapListVO"%>
<%@page import="java.util.Set"%>
<%@page import="com.smhrd.model.TodolistVO"%>
<%@page import="com.smhrd.model.MemberVO"%>

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
    <link rel="stylesheet" href="assets/css/scrapstyle.css">
    
	<%
	ScrapListVO mvo = (ScrapListVO) session.getAttribute("scrapList");
	
	MemberVO vo = (MemberVO) session.getAttribute("profile");
	%>


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
                	<img class="logo-abbr" src="assets/images/finalimglogo.png" alt="" width = "40px" height = "40px"> 
                    <img class="logo-compact" src="assets/images/finalmainlogo.png" alt=""> 
                    <img class="brand-title" src="assets/images/finalmainlogo.png" alt="" height = "40px">
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
							</a>
							<div>
							<span style="color:#593BDB; font-weight: 700;">${profile.userId}님</span>
							</div>
                            <!-- 프로필 드롭다운 -->
                               </li>
                            <li class="nav-item dropdown header-profile"><a
                               class="nav-link" href="#" role="button" data-toggle="dropdown">
                                 
                                <!-- 변경한 이미지 img -->
                               <img class="mdi mdi-account" src="assets/images/memberprofileimg/1.png" width = "30px" height = "30px" style="border-radius: 15px; margin-right: 10px;">
                                <!-- 원래 드롭다운 i태그 -->
                                <!-- <i class="mdi mdi-account"></i> -->
                               
       
       
       
                            </a>
                               <div class="dropdown-menu dropdown-menu-right">
                                  <a href="Mypage.do" class="dropdown-item"> <i
                                     class="icon-user"></i> <span class="ml-2">MyPage </span>
                                  </a> 
                                  <a href="Logout.do" class="dropdown-item"> <i
                                     class="icon-key"></i> <span class="ml-2">Logout </span>
                                  </a>
                               </div>
							</li>
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
        <div class="content-body"  style="text-align: center;">
            <!-- row -->
            <div class="scrap_wrap">
               <div class="scrap_title">
                    <strong>My Scrap</strong>
                     <!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
              </div>
           <div class="scrap_list_wrap">
         	<div class="scrap_list">
            	<div class="ourscraptop">
                    <div class="ourscrapnum">카테고리</div>
                    <div class="ourscraptitle">공고 제목</div>
                    <div class="ourscrapdate">기간</div>
                </div>
            	<c:forEach items="${scrapList}" var="sl">
            		<div class="myscraprow">
                <form action="ClickContestInfo.do" method="post" style="display: flex; align-items: center;">
                    <div class="ourscrapnum" style="margin-right: 10px;">${sl.conCategory}</div>
                    <div class="ourscraptitle" style="margin-right: 10px;"><a href="gocrawling.do">${sl.conName}</a></div>
                    <div class="ourscrapdate" style="margin-right: 10px;">${sl.conStartDate} ~ ${sl.conEndDate}</div>
                    <input type="hidden" value="${sl.conName}" name="conName">
                    <input type="hidden" name="userId" value="${profile.userId}">
                    <input type="hidden" name="conIdx" value="${sl.conIdx}">
                    <input type="hidden" name="conName" value="${sl.conName}">
                    <input type="submit" value="상세보기">
                </form>
            </div>
            	</c:forEach>
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
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
                <p>Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a></p> 
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