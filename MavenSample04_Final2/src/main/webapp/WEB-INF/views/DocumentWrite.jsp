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
    <link rel="stylesheet" href="css/boardcss.css">



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
								class="nav-link" href="goScrap.do" role="button"> <!-- data-toggle="dropdown" -->
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
            <div class="board_wrap">
                
                    <div class="board_title">
                        <strong>DOCUMENT WRITE</strong>
                        <p>글을 작성하는 공간.</p>
                    </div>

                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="ourboardtitle">
                            <dl>
                                <dt>제목</dt>
                                <dd><input type="text" placeholder="제목 입력"></dd>
                            </dl>
                        </div>
                        <div class="ourboardinfo">
                            <dl>
                                <dt>글쓴이</dt>
                                <dd><input type="text" placeholder="글쓴이 입력"></dd>
                            </dl>
                            <dl>
                                <!-- <dt>파일 첨부 </dt> -->
                                <!-- <dt>비밀번호</dt>
                                <dd><input type="password" placeholder="비밀번호 입력"></dd> -->
                                <!-- <dd><input type="file" name="reviewImg" id="reviewImageFileOpenInput" accept="image/*"></dd> -->
                                <div class="filebox">
                                    <dd><input class="upload-name" value="첨부파일" placeholder="첨부파일"></dd>
                                <dd><label for="file">파일찾기</label></dd> 
                                    <input type="file" id="file">
                                </div>
                            </dl>
                        </div>
                        <div class="ourboardcont">
                            <textarea placeholder="내용 입력"></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap">
                        <a href="goDocumentView.do" class="on">등록</a>
                        <a href="goDocument.do">취소</a>
                    </div>
                </div>
            </div>


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

    <script src="assets/js/boardfile.js"></script>


</body>

</html>