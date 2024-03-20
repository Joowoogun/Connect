<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.smhrd.model.TodolistVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ConNect</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/ConNectlogo.png">
    <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- 추가 링크 및 스크립트 -->
     <link rel="stylesheet" href="assets/css/Todolist.css" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js" 
         integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w==" 
         crossorigin="anonymous" 
         referrerpolicy="no-referrer">
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
            <a href="goindex.do" class="brand-logo">
                <img class="logo-abbr" src="assets/images/ConNectlogo.png" alt="">
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
                        class="nav-link" href="Scrap.jsp" role="button"> <!-- data-toggle="dropdown" -->
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
                           <a href="./page-login.jsp" class="dropdown-item"> <i
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
                    <<li><a href="goindex.do" aria-expanded="false"><img
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
     <div class="content-body">
            <!-- row -->
            <div class="all_title">
               <strong>
                 <form action="todoChageTitle.do" method="post">
                     <input id="showHide" name="title" type="text" placeholder="${TodoTitle}">
                     <input id="firstHide" name="titleName" type="hidden" value="${TodoTitle}">
                   <input type="hidden" type="submit" value="나는 투명이다~">
                 </form>
               </strong>
            </div>
            <div>
           <span>
           <progress
               class="progress"
               id="progress"
               value="0"
               min="0"
              max="100"
          ></progress>
          </span> 
          <div class = "ourSelect">
          
          
          <select id="todoTitle" onchange="changeValue()">
            <c:forEach items="${TodoOption}" var="title">
                  <option>${title}</option>
              </c:forEach>
         </select>
         </div>
            </div>
 
      <br>
       <div>
       
       
      <a href="goaddTodo.do">일정추가</a>
      <h1>${todoTitle}</h1>
    <div class="container">
      <div class="column" id="Todo">
         <h1>Todo</h1>
         <c:forEach items="${TodoList}" var="todo">
            <c:if test="${todo.do_Status == '해야 할 일' and todo.userId == todo.profileId}">
               <div class="list-group-item" draggable="true">
                  <form action="todoDel.do" method="post">
                     ${todo.content} ${todo.todoIdx} <br> ${todo.do_startDate} ~
                     ${todo.do_endDate} <br> ${todo.do_startTime} ~
                     ${todo.do_endTime} 
                     유저아이디 : ${todo.userId} 프로파일 : ${todo.profileId}
                     <input type="hidden" id="status" value="해야 할 일"> 
                     <input type="hidden" id="todoIdx" value="${todo.todoIdx}"> 
                     <input type="hidden" name="todoTitle" value="${todo.todoTitle}">
                     <input type="hidden" name="txt" value="${todo.content}"> 
                     <input type="submit" value="삭제">
                  </form>
               </div>
            </c:if>

         </c:forEach>
      </div>

      <div class="column" id="InProgress">
         <h1>InProgress</h1>
         <c:forEach items="${TodoList}" var="todo">
            <c:if test="${todo.do_Status == '진행 중' and todo.userId == todo.profileId}">         
               <div class="list-group-item" draggable="true">
                  <form action="todoDel.do" method="post">
                     ${todo.content} ${todo.todoIdx} <br> ${todo.do_startDate} ~
                     ${todo.do_endDate} <br> ${todo.do_startTime} ~
                     ${todo.do_endTime}
                     유저아이디 : ${todo.userId} 프로파일 : ${todo.profileId}
                     <input type="hidden" id="status" value="진행 중">
                     <input type="hidden" name="todoTitle" value="${todo.todoTitle}">
                     <input type="hidden" id="todoIdx" value="${todo.todoIdx}">
                     <input type="hidden" name="txt" value="${todo.content}">
                     <input type="submit" value="삭제">
                  </form>
               </div>
            </c:if>
         </c:forEach>
      </div>

      <div class="column" id="Done">
         <h1>Done</h1>
         <c:forEach items="${TodoList}" var="todo">
            <c:if test="${todo.do_Status == '완료' and todo.userId == todo.profileId}">
               <div class="list-group-item" draggable="true">
                  <form action="todoDel.do" method="post">
                     ${todo.content} ${todo.todoIdx} <br> ${todo.do_startDate} ~
                     ${todo.do_endDate} <br> ${todo.do_startTime} ~
                     ${todo.do_endTime} 
                     유저아이디 : ${todo.userId} 프로파일 : ${todo.profileId}
                     <input type="hidden" id="status" value="완료">
                     <input type="hidden" name="todoTitle" value="${todo.todoTitle}">
                     <input type="hidden" id="todoIdx" value="${todo.todoIdx}">
                     <input type="hidden" name="txt" value="${todo.content}">
                     <input type="submit" value="삭제">
                  </form>
               </div>
            </c:if>
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
    
     <!-- 추가한  스크립트  -->
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
   <script src="assets/js/dragAble.js"></script>
   <script>
   $(document).ready(function() {
       // 페이지가 로드되면 실행될 코드
       $('.list-group-item').show(); // list-group-item 클래스를 가진 모든 요소를 표시

       // select 요소를 가져와서 첫 번째 옵션을 선택
       $('#todoTitle').val($('#todoTitle option:first').val());

       // select 요소가 화면에 보이도록 CSS 속성을 설정
       $('#todoTitle').css('display', 'block');
   });
  
   // 드래그할때마다 DB에 현황을 전달하여 업데이트 하는 기능
  $(".list-group-item").on("dragend",function(){
     
     let nowStatus = $(this).find("#status");
     
     let newStatus = "";
     let columnId = $(this).parent().attr("id");
     
     switch (columnId) {
      case "Todo":
          newStatus = "해야 할 일";
          break;
      case "InProgress":
          newStatus = "진행 중";
          break;
      case "Done":
          newStatus = "완료";
          break;
      default:
          newStatus = "알수없음";
  }
     
     nowStatus.val(newStatus);
     
     
     let status = $(this).find("#status").val();
     let todoIdx = $(this).find("#todoIdx").val();
     // 2)input 데이터 불러오고 변수에 저장
     let sendData = {"status":newStatus
                 ,"todoIdx":todoIdx
                    };
     // 3)console에 출력
     
        console.log(sendData);
  // 4) 비동기 통신을 사용하여 Servlet으로 데이터 전송
  $.ajax({
     // 보내줄 url 
     url : "todoAjax",
     // 보내줄 data
     data : sendData,
     // 전송방식 지정
     type : 'get',
     // 데이터타입
     dataType:'json',
     // 성공했을 때 실행할 함수 지정
     success : (res) => {
        console.log("데이터 전송 성공!");
        console.log("받아온 데이터 >> ", res);
     },
     // 실패했을 때 실행할 함수 지정
     error : () => {
        console.log("데이터 전송 실패!");
     }
     
  })
  
  })
  


$(document).ready(function(){
   // select 요소의 변경 이벤트를 감지합니다.
   
   $('#todoTitle').change(function(){
       // 선택된 옵션의 값을 가져옵니다.
       var selectedOption = $(this).val();
       
       // 모든 TodoList 아이템을 숨깁니다.
       $('.list-group-item').hide();
       
       // 각 컬럼에 있는 TodoList 아이템을 확인하며 선택한 옵션에 해당하는 아이템만 보여줍니다.
       $('div.column').each(function(){
           // 현재 컬럼 내의 모든 TodoList 아이템을 확인합니다.
           $(this).find('.list-group-item').each(function(){
               // TodoList 아이템의 TodoTitle 값을 가져옵니다.
               var todoTitle = $(this).find('input[name="todoTitle"]').val();
               // 선택한 옵션과 TodoList 아이템의 TodoTitle을 비교하여 일치하는 경우 해당 아이템을 보여줍니다.
               if (todoTitle === selectedOption) {
                   $(this).show();
               }
           });
       });
   });
});
// 잘모르겠음 뭐엿지
$(document).ready(function() {
    $('div.column .list-group-item').each(function() {
        var todoTitle = $(this).find('input[name="todoTitle"]').val();
        var firstHide = $('#firstHide').val();
        console.log(firstHide)
        if (todoTitle !== firstHide) {
            $(this).hide();
        }
    });
});

// option 선택시 보여지는 제목, 변경할때 보내는 내부의 값을 변경
function changeValue() {
    var selectElement = document.getElementById("todoTitle");
    var selectedText = selectElement.options[selectElement.selectedIndex].text;
    console.log(selectedText);
    // firstHide 요소의 value 값을 선택된 옵션의 값으로 변경
    document.getElementById("firstHide").value = selectedText;
    // 사용자에게 보여지는 걸 변경
    document.getElementById("showHide").placeholder = selectedText;
}




   </script>
   <!-- 스크립트 끝 -->

</body>

</html>