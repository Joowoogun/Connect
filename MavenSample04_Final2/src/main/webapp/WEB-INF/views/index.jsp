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
<title>CONNECT</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/finalimglogo.png">
<link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
   <style>
      .ourcontestposter ul{
         margin-left :0px;   
      }
        /* 리스트 아이템을 가로로 배열하여 이미지를 한 줄에 놓음 */
        .ourcontestposter ul li{
            display: inline-block;
            margin-left: 20px; /* 이미지 사이의 간격 설정 */
         margin-bottom : 20px;
         
        }
      .ourcontestposter ul li img{
         width: 300px;
         height: 300px;
      }
    </style>



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
			<a href="goindex.do" class="brand-logo"> 
				<img class="logo-abbr" src="assets/images/finalimglogo.png" alt="" width = "40px" height = "40px"> 
				<img class="logo-compact" src="assets/images/finalmainlogo.png" alt=""> 
				<img class="brand-title" src="assets/images/finalmainlogo.png" alt="" height = "40px">
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
                              <input class="form-control" type="search" placeholder="Contest Search"
                                 aria-label="Search">
                           </form>
                        </div>
                     </div>
                  </div>

                  <ul class="navbar-nav header-right">
                     <li class="nav-item dropdown notification_dropdown">
                     <a class="nav-link" href="SelectScrapAll.do" role="button"> <!-- data-toggle="dropdown" -->
                           <form action="SelectScrapAll.do" method="post">
										<input class="scrapright" type="image"
											src="assets/images/allpagescrap.png" height="10px" width="10px">
										<c:forEach items="${scrapProfile}" var="sp">
											<input type="hidden" name="scrapconIdx" value="${sp.conIdx}">
											<input type="hidden" name="scrapconName"
												value="${sp.conName}">
											<input type="hidden" name="scrapconStartDate"
												value="${sp.conStartDate}">
											<input type="hidden" name="scrapconEndDate"
												value="${sp.conEndDate}">
										</c:forEach>
									</form>
                           <!--  <div class="pulse-css"></div> -->
                     </a>
               
                     <div>
                     <!-- 프로필 닉네임 -->
                     <span style="color:#593BDB; font-weight: 700;">${profile.userId}</span>
                  </div>
                     <!-- 프로필 드롭다운 -->
                        <div class="dropdown-menu dropdown-menu-right">
                           <ul class="list-unstyled">
                              <li class="media dropdown-item"><span class="success">
                                
                                 <i class="ti-user"></i>
                              
                              </span>
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
                          
                         <!-- 변경한 이미지 img -->
                        <img class="mdi mdi-account"
                           src="assets/images/memberprofileimg/1.png" width="30px"
                           height="30px" style="border-radius: 15px; margin-right: 10px;">
                         <!-- 원래 드롭다운 i태그 -->
                         <!-- <i class="mdi mdi-account"></i> -->
                        



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

               <!-- 사이드 카테고리 -->
              <li><a href="goindex.do" aria-expanded="false"><img
                     src="assets/images/contesttab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">CONTEST</span></a>
               </li>
               <li><a href="goQuickView.do" aria-expanded="false"><img
                     src="assets/images/quickviewtab.png" width="30px" height="30px"
                     style="margin-right: 5px;"><span class="nav-text">QUICK
                        VIEW</span></a></li>
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
            </li>
         </div>


      </div>
      <!--**********************************
            Sidebar end
        ***********************************-->

      <!--**********************************
            Content body start
        ***********************************-->
      <div class="content-body">
         <!-- 메인 포스터 배너 넣는 div -->
         <div align="center" >
            <a>
               <img src="assets/images/display.jpg" width="1600px">
            </a>
         </div>

         <!-- 가운데 카테고리 버튼  -->
         <div class="ourbuttonframe">
            <button class="ourcustom-btn btn-1" value="게임/소프트웨어" id="ourfirst">게임/SW</button>
            <button class="ourcustom-btn btn-2" value="기획/아이디어" id="oursecond">기획/아이디어</button>
            <button class="ourcustom-btn btn-3" value="디자인" id="ourthird">디자인</button>
            <button class="ourcustom-btn btn-4" value="문학/수기" id="ourfourth">문학/수기</button>
            <button class="ourcustom-btn btn-5" value="미술" id="ourfifth">미술<div class="dot"></div></button>
            <button class="ourcustom-btn btn-6" value="영상/UCC" id="oursixth">영상/UCC</button>
         </div>

         <!-- 카테고리 별 이미지 -->

         <div class = "ourcontestposter">
         <div class ="onlycontestposter">
            <ul>
    <c:forEach items="${conProfile}" var="ci" varStatus="loop">
        <li>
            <div class="contestInfo">
                <form action="ClickContestInfo.do" method="post">
                    <input type="image" src="assets/images/${ci.conIdx}.png" width="300px" height="300px">
                    <input type="hidden" name="userId" value="${profile.userId}">
                    <input type="hidden" name="conContent" value="${ci.conContent}">
                    <input type="hidden" name="conCategory" value="${ci.conCategory}">
                    <input type="hidden" name="conIdx" value="${ci.conIdx}">
                    <input type="hidden" name="conName" value="${ci.conName}">
                    <c:forEach items="${scrapProfile}" var="si" varStatus="status">
                        <input type="hidden" name="scrapconName${status.index}" value="${si}">
                    </c:forEach>
                </form>
            </div>
        </li>
    </c:forEach>
            </ul>
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

   <!-- 비동기화 함수 -->
   <script>
      document.addEventListener("DOMContentLoaded", function() {
        var buttons = document.querySelectorAll('.ourcustom-btn');
        var images = document.querySelectorAll('.ourcontestposter ul li img');
    
        buttons.forEach(function(button) {
          button.addEventListener('click', function() {
            var buttonIndex = parseInt(this.className.match(/\d+/)[0]); // 버튼의 인덱스 추출
            var startIndex = (buttonIndex - 1) * 10 + 1; // 이미지 그룹의 시작 인덱스 계산
    
            // 해당하는 이미지 그룹을 표시
            images.forEach(function(image, index) {
              var imageIndex = startIndex + index;
              var imageSrc = `./images/contestbn/imgex${imageIndex.toString().padStart(2, '0')}`; // 파일 이름 설정
    
              // 확장자에 따라 이미지 파일 형식 결정
              var pngImageSrc = imageSrc + ".png";
              var jpgImageSrc = imageSrc + ".jpg";
    
              // 이미지 파일이 존재하는 경우에만 이미지 소스 설정
              if (checkImageExists(pngImageSrc)) {
                image.src = pngImageSrc;
              } else if (checkImageExists(jpgImageSrc)) {
                image.src = jpgImageSrc;
              }
            });
          });
        });
    
        // 이미지 파일의 존재 여부를 확인하는 함수
        function checkImageExists(imageSrc) {
          var http = new XMLHttpRequest();
          http.open('HEAD', imageSrc, false);
          http.send();
          return http.status !== 404;
        }
      });
    </script>  
	
	<script type="text/javascript">
	$('#ourfirst').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
	
	$('#oursecond').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
	
	$('#ourthird').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
	
	$('#ourfourth').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
	
	$('#ourfifth').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
	
	$('#oursixth').on("click", function(){
	    // 선택된 카테고리의 값을 가져옵니다.
	    var selectedCategory = $(this).val();
	    console.log("selectedCategory >>",selectedCategory);
	    
	    
	    // 각 공모전 정보를 확인하며 선택한 카테고리에 해당하는 정보만 표시합니다.
	    $('.contestInfo').each(function(){
	        // 공모전 카테고리 값을 가져옵니다.
	        var conCategory = $(this).find('input[name="conCategory"]').val();
	        console.log("conCategory >>",conCategory);
	        
	        // 선택한 카테고리와 공모전 카테고리를 비교하여 일치하는 경우 해당 정보를 보여줍니다.
	        if (conCategory !== selectedCategory) {
	        	 $(this).closest('li').hide();
	        }else{
	        	$(this).closest('li').show();
	        }
	    });
	});
</script>

</body>

</html>