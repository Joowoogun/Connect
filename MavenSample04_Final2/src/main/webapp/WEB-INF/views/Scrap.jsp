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
	<%
	ScrapListVO mvo = (ScrapListVO) session.getAttribute("scrapList");
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
                <img class="logo-abbr" src="assets/images/finalimglogo.png" alt="">
                <img class="logo-compact" src="assets/images/logo-text.png" alt="">
                <img class="brand-title" src="assets/images/ConNectFont.png" alt="">
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
										<input class="form-control" type="search" placeholder="Search"
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="SelectScrapAll.do" role="button"> <!-- data-toggle="dropdown" -->
									<img class = "scrapright" src="assets/images/scrap.png" height="18px" width="27px">
									<!--  <div class="pulse-css"></div> -->
							</a>
					
							<div>
							<span style="color:#593BDB; font-weight: 700;">${profile.userId}님</span>
						</div>
								<div class="dropdown-menu dropdown-menu-right">
									<ul class="list-unstyled">
										<li class="media dropdown-item"><span class="success"><i
												class="ti-user"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Martin</strong> has added a <strong>customer</strong>
														Successfully
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="primary"><i
												class="ti-shopping-cart"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Jennifer</strong> purchased Light Dashboard 2.0.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="danger"><i
												class="ti-bookmark"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Robin</strong> marked a <strong>ticket</strong> as
														unsolved.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="primary"><i
												class="ti-heart"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>David</strong> purchased Light Dashboard 1.0.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="success"><i
												class="ti-image"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong> James.</strong> has added a<strong>customer</strong>
														Successfully
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
									</ul>
									<a class="all-notification" href="#">See all notifications
										<i class="ti-arrow-right"></i>
									</a>
								</div></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="./page-mypage.jsp" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">MyPage </span>
									</a> 
									<a href="gopage-login.do" class="dropdown-item"> <i
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
                  <!--  <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a>
                         <ul aria-expanded="false">
                            <li><a href="./index.jsp">Dashboard 1</a></li>
                            <li><a href="./index2.jsp">Dashboard 2</a></li>
                        </ul> 
                    </li> -->
                  <!--    <li class="nav-label">Apps</li> -->
                <!--     <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-app-store"></i><span class="nav-text">Apps</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.jsp">Profile</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Email</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.jsp">Compose</a></li>
                                    <li><a href="./email-inbox.jsp">Inbox</a></li>
                                    <li><a href="./email-read.jsp">Read</a></li>
                                </ul>
                            </li>
                            <li><a href="./app-calender.jsp">Calendar</a></li>
                        </ul>
                    </li> -->
                   <!-- <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-chart-bar-33"></i><span class="nav-text">Charts</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.jsp">Flot</a></li>
                            <li><a href="./chart-morris.jsp">Morris</a></li>
                            <li><a href="./chart-chartjs.jsp">Chartjs</a></li>
                            <li><a href="./chart-chartist.jsp">Chartist</a></li>
                            <li><a href="./chart-sparkline.jsp">Sparkline</a></li>
                            <li><a href="./chart-peity.jsp">Peity</a></li>
                        </ul>
                    </li> -->
              <!--   <li class="nav-label">Components</li> --> 
              <!--  <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-world-2"></i><span class="nav-text">Bootstrap</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./ui-accordion.jsp">Accordion</a></li>
                            <li><a href="./ui-alert.jsp">Alert</a></li>
                            <li><a href="./ui-badge.jsp">Badge</a></li>
                            <li><a href="./ui-button.jsp">Button</a></li>
                            <li><a href="./ui-modal.jsp">Modal</a></li>
                            <li><a href="./ui-button-group.jsp">Button Group</a></li>
                            <li><a href="./ui-list-group.jsp">List Group</a></li>
                            <li><a href="./ui-media-object.jsp">Media Object</a></li>
                            <li><a href="./ui-card.jsp">Cards</a></li>
                            <li><a href="./ui-carousel.jsp">Carousel</a></li>
                            <li><a href="./ui-dropdown.jsp">Dropdown</a></li>
                            <li><a href="./ui-popover.jsp">Popover</a></li>
                            <li><a href="./ui-progressbar.jsp">Progressbar</a></li>
                            <li><a href="./ui-tab.jsp">Tab</a></li>
                            <li><a href="./ui-typography.jsp">Typography</a></li>
                            <li><a href="./ui-pagination.jsp">Pagination</a></li>
                            <li><a href="./ui-grid.jsp">Grid</a></li>

                        </ul>
                    </li> -->

                   <!--  <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-plug"></i><span class="nav-text">Plugins</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./uc-select2.jsp">Select 2</a></li>
                            <li><a href="./uc-nestable.jsp">Nestedable</a></li>
                            <li><a href="./uc-noui-slider.jsp">Noui Slider</a></li>
                            <li><a href="./uc-sweetalert.jsp">Sweet Alert</a></li>
                            <li><a href="./uc-toastr.jsp">Toastr</a></li>
                            <li><a href="./map-jqvmap.jsp">Jqv Map</a></li>
                        </ul>
                    </li> -->
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
                    <!--  <li class="nav-label">Forms</li> -->
                  <!--   <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-form"></i><span class="nav-text">Forms</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./form-element.jsp">Form Elements</a></li>
                            <li><a href="./form-wizard.jsp">Wizard</a></li>
                            <li><a href="./form-editor-summernote.jsp">Summernote</a></li>
                            <li><a href="form-pickers.jsp">Pickers</a></li>
                            <li><a href="form-validation-jquery.jsp">Jquery Validate</a></li>
                        </ul>
                    </li> --> 
                   <!-- <li class="nav-label">Table</li> -->
                 <!--    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-layout-25"></i><span class="nav-text">Table</span></a>
                        <ul aria-expanded="false">
                            <li><a href="table-bootstrap-basic.jsp">Bootstrap</a></li>
                            <li><a href="table-datatable-basic.jsp">Datatable</a></li>
                        </ul>
                    </li>  -->

                    <!-- <li class="nav-label">Extra</li> -->
                 <!--    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-copy-06"></i><span class="nav-text">Pages</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./page-register.jsp">Register</a></li>
                            <li><a href="gopage-login.do">Login</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="./page-error-400.jsp">Error 400</a></li>
                                    <li><a href="./page-error-403.jsp">Error 403</a></li>
                                    <li><a href="./page-error-404.jsp">Error 404</a></li>
                                    <li><a href="./page-error-500.jsp">Error 500</a></li>
                                    <li><a href="./page-error-503.jsp">Error 503</a></li>
                                </ul>
                            </li>  
                            <li><a href="./page-lock-screen.jsp">Lock Screen</a></li> -->
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
        <div class="content-body"  style="text-align: center;">
            <!-- row -->
            <c:forEach items="${contest}" var="con">
            <div>
            <form action="ClickContestInfo.do" method="post" >
            <input type="hidden" value="${con.conName}" name="conName">
            ${con.conName}
			<input type="hidden" name="conNum" value="${con.conIdx}">
			<input type="hidden" name="conName" value="${con.conName}"> 
            <input type="submit" value="상세보기">
            </form>
                        <br>
            <br>
            </div>
            </c:forEach>
            <img src = "assets/images/Scrapex01.png" width = "1600px" height = "820px" >
            
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