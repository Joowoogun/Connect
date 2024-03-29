<%@page import="java.util.List"%>
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
<link rel="icon" type="image/png" sizes="16x16"   href="assets/images/finalimglogo.png">
<link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/dragdrop.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js" integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="assets/js/ourprogressbarjs.js"></script>

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
            src="assets/images/logo-text.png" alt=""> <img
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
                              <input class="form-control" type="search" placeholder="Search"
                                 aria-label="Search">
                           </form>
                        </div>
                     </div>
                  </div>

                  <ul class="navbar-nav header-right">
                     <li class="nav-item dropdown notification_dropdown"><a
                        class="nav-link" href="goScrap.do" role="button"> <img
                           class="scrapright" src="assets/images/allpagescrap.png"
                           height="10px" width="10px">
                     </a>

                        <div>
                           <span style="color: #593BDB; font-weight: 700;">${profile.userId}님</span>
                        </div></li>
                     <li class="nav-item dropdown header-profile"><a
                        class="nav-link" href="#" role="button" data-toggle="dropdown">
                           <img class="mdi mdi-account"
                           src="assets/images/memberprofileimg/1.png" width="30px"
                           height="30px" style="border-radius: 15px; margin-right: 10px;">
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
               <li class="nav-label first">MENU</li> <
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
            <li><a href="gopage-lock-screen.do">Lock Screen</a></li> -->
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
         <div class="ourtodotitle">
            <strong>
               <form action="todoChageTitle.do" method="post">
                  <h2>
                     <input id="showHide" name="title" type="text"
                        placeholder="${TodoTitle}" style="border: none;">
                  </h2>
                  <input id="firstTitle" name="titleName" type="hidden"
                     value="${TodoTitle}"> <input type="hidden" type="submit"
                     value="나는 투명이다~">
               </form>
            </strong>
         </div>
         <div class="testblockinline">
            <div id="ourprogressbarjs">
               <svg viewBox="0 0 100 4" preserveAspectRatio="none"
                  style="width: 100%; height: 100%;">
                            <path d="M 0,2 L 100,2" stroke="#eee"
                     stroke-width="2" fill-opacity="0">
                
                            </path>
                            <path d="M 0,2 L 100,2" stroke="#5d5d5d" id="todoProgress"
                     stroke-width="4" fill-opacity="0"
                     style="stroke-dasharray: 50, 100; stroke-dashoffset: 0;">
                
                            </path>
                        </svg>
               <div class="progressbar-text"
                  style="color: rgb(153, 153, 153); position: absolute; right: 0px; top: 30px; padding: 0px; margin: 0px;">100%</div>
            </div>

            <div class="todoinputimg">
               <input type="image" src="assets/images/todoplusimg.png"
                  width="60px" height="60px" id="modalOpener">

               <div class="modal fade" id="exampleModalpopover">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title">Add New ToDo</h5>
                           <button type="button" class="close" data-dismiss="modal">
                              <span>&times;</span>
                           </button>
                        </div>
                        <div class="modal-body" id="ourmodalBody">
                              Title: <input type="text" placeholder="제목을 입력해주세요" id="addYourTitle"> 
                                       &nbsp; 간편선택 : 
                                    <select id="addTodoTitle">
                                 <c:forEach items="${TodoOption}" var="title">
                                    <option>${title}</option>
                                 </c:forEach>
                                 <option>직접입력</option>
                                 </select> <br> <br> Content:
                              <textarea id="addContent" rows="2" cols="50"
                                 style="resize: none;"></textarea>
                              <br> <br> Status: <select id="addStatus">
                                 <option value="해야 할 일">해야 할 일</option>
                                 <option value="진행 중">진행 중</option>
                                 <option value="완료">완료</option>
                              </select><br> <br> startDate: 
                              <input type="date" id="addStartDate"> 
                              <input type="time" id="addStartTime"><br> <br> endDate: 
                              <input type="date" id="addEndDate"> 
                              <input type="time" id="addEndTime"><br> <br>

                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Close</button>
                                 <!-- <button type="button" class="btn btn-primary">Add ToDo</button> -->
                                 <input type="button" class="btn btn-primary" id="addTodoBtn"value="Add ToDo">
                              </div>
                        </div>
                     </div>

                  </div>
               </div>
            </div>
            <div class="ourselectBox">
            <select class="ourSelect" id="todoTitle">
                  <c:forEach items="${TodoOption}" var="title">
                     <option>${title}</option>
                  </c:forEach>
            </select>
            </div>
            <!--  </form> -->


         </div>
         <h1>${todoTitle}</h1>
         <div class="ourcontainer">
            <div class="ourcolumn" id="Todo">
               <h1>Todo</h1>
               <c:forEach items="${TodoList}" var="todo">
                  <c:if test="${todo.do_Status == '해야 할 일' and todo.todoTitle == TodoTitle}">
                     <div class="list-group-item" draggable="true">
                        <h2><input type="text" name="content" id="todoContent" value="${todo.content}"></h2>
                        <h5>${todo.do_startDate}~${todo.do_endDate}</h5>
                        <input type="hidden" id="status" value="해야 할 일"> 
                        <input type="hidden" id="delTodoTitle" name="todoTitle" value="${todo.todoTitle}"> 
                        <input type="image"   class="deletebutton" value="비동기삭제" src="assets/images/tododelete.png" width="15px" height="15px">
                        <input type="hidden" name="todoId" id="todoIdx"   value="${todo.todoIdx}">
                     </div>
                  </c:if>

               </c:forEach>
            </div>

            <div class="ourcolumn" id="InProgress">
               <h1>InProgress</h1>
               <c:forEach items="${TodoList}" var="todo">
                  <c:if test="${todo.do_Status == '진행 중' and todo.todoTitle == TodoTitle}">
                     <div class="list-group-item" draggable="true">
                        <h2><input type="text" name="content" id="todoContent" value="${todo.content}"></h2>
                        <h5>${todo.do_startDate}~${todo.do_endDate}</h5>
                        <input type="hidden" id="status" value="진행 중"> 
                        <input type="hidden" id="delTodoTitle" name="todoTitle" value="${todo.todoTitle}"> 
                        <input type="image"   class="deletebutton" value="비동기삭제" src="assets/images/tododelete.png" width="15px" height="15px">
                        <input type="hidden" name="todoId" id="todoIdx"   value="${todo.todoIdx}">
                     </div>
                  </c:if>
               </c:forEach>
            </div>

            <div class="ourcolumn" id="Done">
               <h1>Done</h1>
               <c:forEach items="${TodoList}" var="todo">
                  <c:if test="${todo.do_Status == '완료' and todo.todoTitle == TodoTitle}">
                     <div class="list-group-item" draggable="true">
                        <h2><input type="text" name="content" id="todoContent" value="${todo.content}"></h2>
                        <h5>${todo.do_startDate}~${todo.do_endDate}</h5>
                        <input type="hidden" id="status" value="완료">
                        <input type="hidden" id="delTodoTitle" name="todoTitle" value="${todo.todoTitle}"> 
                        <input type="image"   class="deletebutton" value="비동기삭제" src="assets/images/tododelete.png" width="15px" height="15px">
                        <input type="hidden" name="todoId" id="todoIdx"   value="${todo.todoIdx}">
                     </div>
                  </c:if>
               </c:forEach>
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
                  Copyright © Designed &amp; Developed by <a href="#"
                     target="_blank">Quixkit</a> 2019
               </p>
               <p>
                  Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
               </p>
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
      
      
      <script src="assets/js/Tododragdrop.js"></script>
      <script src="assets/js/TodoSelectTodoTitle.js"></script>
      <script src="assets/js/TododragEdit.js"></script>
      <script src="assets/js/TodoDragAjax.js"></script>
      <script src="assets/js/TodoDel.js"></script>
      <script src="assets/js/TodoAddAjax.js"></script>
      <script src="assets/js/TodoModal.js"></script>
      <script src="assets/js/TodoProgressbar.js"></script>
      

// 보여지는 최대 글자수 설정
var h2Element = document.querySelector('.ourcolumn h2');
var maxLength = 20; // 최대 글자 수

if (h2Element.textContent.length > maxLength) {
  h2Element.textContent = h2Element.textContent.substring(0, maxLength) + '...';
}

   </script>

      <!-- 스크립트 끝 -->
</body>

</html>