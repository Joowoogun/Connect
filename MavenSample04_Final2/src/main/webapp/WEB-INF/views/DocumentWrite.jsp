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
								class="nav-link" href="goScrap.do" role="button"> <!-- data-toggle="dropdown" -->
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
									<a href="gopage-mypage.do" class="dropdown-item"> <i
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
							src="assets/images/contesttab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">CONTEST</span></a></li>
					<li><a href="goQuickView.do" aria-expanded="false"><img
							src="assets/images/quickviewtab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">QUICK
								VIEW</span></a></li>
					<li><a href="goCalendar.do" aria-expanded="false"><img
							src="assets/images/calendartab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">CALENDAR</span></a></li>
					<li><a href="SelectTodoAll.do" aria-expanded="false"><img
							src="assets/images/todotab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">TO
								DO</span></a></li>
					<li><a href="documentSelect.do" aria-expanded="false" style="background-color: #6b51df; color: #fff"><img
							src="assets/images/documenttab.png" width="30px" height="30px"
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
                <form action="documentWrite.do" method="post">
                    <div class="board_title">
                        <strong>DOCUMENT WRITE</strong>
                        <p>글을 작성하는 공간.</p>
                    </div>

                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="ourboardtitle">
                            <dl>
                                <dt>제목</dt>
                                <dd><input type="text" name="postTitle" placeholder="제목 입력"></dd>
                            </dl>
                        </div>
                        <div class="ourboardinfo">
                            	
                           		<!-- <dt>파일 첨부 </dt> -->
                                <!-- <dt>비밀번호</dt>
                                <dd><input type="password" placeholder="비밀번호 입력"></dd> -->
                                <!-- <dd><input type="file" name="reviewImg" id="reviewImageFileOpenInput" accept="image/*"></dd> -->
                            <dl class="filebox">
                                 <dt>자료</dt>
                                 <dd>
                                 	<input class="upload-name" value="첨부파일" placeholder="첨부파일">
                                	<label for="file">파일찾기</label>
                                    <input type="file" name="file" id="file">
                                 </dd>
                            </dl>
                        </div>
                        <div class="ourboardcont">
                            <textarea name="postContent" placeholder="내용 입력"></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap">
                    	<input type="hidden" name="work" value="write"> 
                    	<input type="image" src="assets/images/10번째.jpg">
                        <a href="documentSelect.do">취소</a>
                    </div>
                </div>
                </form>
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
	<script src="assets/js/notice-board.js"></script>

</body>

</html>