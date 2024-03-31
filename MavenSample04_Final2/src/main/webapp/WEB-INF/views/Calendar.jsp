<%@page import="java.util.List"%>
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

<!-- 캘린더 js + 함수 + css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='assets/js/index.globalfront.js'	></script>
<script src="assets/js/CalShowAjax.js"></script>


<script>



function handleFirstOption(firstOption) {
    // 현재 선택된 옵션 제거
    $('#todoTitle option:selected').remove();
    // 남은 옵션 중 첫 번째 옵션 선택
    let newOption = `<option value="${firstOption}">${firstOption}</option>`;
    $('#todoTitle').prepend(newOption);
    $('#todoTitle').val(firstOption);
}

function selectOption(optionValue) {
	  // optionValue는 선택할 옵션의 값입니다.
	  
	  // #todoTitle 셀렉터에서 해당 옵션을 선택합니다.
	  $('#todoTitle').val(optionValue);
	  
	  // change 이벤트를 강제로 트리거합니다.
	  $('#todoTitle').trigger('change');
	}


let calendar;

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('ourfullcalendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
        customButtons: {
        myCustomButton: {
        text: '일정 추가',
        click: function() {
          // 모달 창을 생성합니다.
          var modal = document.createElement('div');
          modal.classList.add('modal');
          
          // 모달 창 내용을 설정합니다.
          modal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Schedule</h5>
                </div>
                <div>
                <div class="modal-body" id="ourmodalBody">
                    Title: <input type="text" placeholder="제목을 입력해주세요" id="addYourTitle" name="addYourTitle">
                        &nbsp;
                        간편선택 : <select class="ourSelect" name="addTodoTitle" id="addTodoTitle">
                        <option>직접입력</option>
                        <c:forEach items="${calTitle}" var="ct">
                            <option>${ct}</option>
                        </c:forEach>
               </select>
                        <br>
                        <br>                        
                    Content:<br>
                    <textarea name="addContent" rows="2" cols="50" style="resize: none;"></textarea><br><br>
                    Status: <select name="addStatus">
                        <option value="해야 할 일">해야 할 일</option>
                        <option value="진행 중">진행 중</option>
                        <option value="완료">완료</option>
                    </select><br><br>
                    startDate: <input type="date" name="addStartDate">
                    <input type="time" name="addStartTime"><br><br>
                    endDate: <input type="date" name="addEndDate">
                    <input type="time" name="addEndTime"><br><br>
                                                
                    <div class="modal-footer">
                        <button type="button" id="close" class="btn btn-secondary">Close</button>
                        <input type="button" class="btn btn-primary" id="addcalBtn" value="Create">
                    </div>
                    </div>
                </div>                             
            </div>
          `;
          
          // 페이지에 모달 창을 추가합니다.
          document.body.appendChild(modal);
          
          var addcalButton = modal.querySelector('#addcalBtn');
addcalButton.addEventListener('click', function() {
    let addTodoTitle = $(this).closest(".modal-body").find("#addTodoTitle").val()
    let addYourTitle = $(this).closest(".modal-body").find("#addYourTitle").val()
    let addContent = $(this).closest(".modal-body").find("[name='addContent']").val()
    let addStatus = $(this).closest(".modal-body").find("[name='addStatus']").val()
    let addStartDate = $(this).closest(".modal-body").find("[name='addStartDate']").val()
    let addStartTime = $(this).closest(".modal-body").find("[name='addStartTime']").val()
    let addEndDate = $(this).closest(".modal-body").find("[name='addEndDate']").val()
    let addEndTime = $(this).closest(".modal-body").find("[name='addEndTime']").val()
    console.log(addContent)

    let addList = {
        "addTodoTitle": addTodoTitle,
        "addYourTitle": addYourTitle,
        "addContent": addContent,
        "addStatus": addStatus,
        "addStartDate": addStartDate,
        "addStartTime": addStartTime,
        "addEndDate": addEndDate,
        "addEndTime": addEndTime
    }
    console.log(addList);
    
	let addTitle = document.getElementById("todoTitle");
    
	$.ajax({
	    url: "todoaddAjax",
	    data: addList,
	    type: 'get',
	    success: (res) => {
	        let newOption = new Option(res);
	        addTitle.add(newOption);
	        selectOption(res); // res를 넘겨야 합니다.
	        modal.remove();
	    },
	    error: () => {
	        console.error("Todo 추가중 오류발생.");
	    }
	});	
	})
          // 닫기 버튼을 클릭하면 모달 창이 닫히도록 설정합니다.
          var closeButton = modal.querySelector('#close');
          closeButton.addEventListener('click', function() {
            modal.remove();
          });
        }
      }
    },
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'myCustomButton'
      },
      initialDate: '2024-03-28',
      nextDayThreshold: '00:00:00',
      navLinks: false, // can click day/week names to navigate views
      editable: true,
      allday: false,
      dayMaxEvents: true, // allow "more" link when too many events
      locale: 'ko',
      
      
      eventResize : function( info ) {
        	var start = info.event.start;
		    var formattedStartDate = start.getFullYear() + '-' + ('0' + (start.getMonth() + 1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2);
		    console.log("클릭한 이벤트의 시작 날짜:", formattedStartDate);
		    
		    var end = info.event.end;
		    end.setDate(end.getDate() - 1);
		    var formattedEndDate = end.getFullYear() + '-' + ('0' + (end.getMonth() + 1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2);
		    console.log("클릭한 이벤트의 종료 날짜:", formattedEndDate);
        	let sendData = {
    				"do_startDate" : formattedStartDate,
    				"do_endDate" : formattedEndDate,
    				"todoIdx" : info.event.id
    				};
    		// 3) console에 출력하기
    			console.log(sendData)
    		// 4) 비동기통신을 사용하여 Servlet으로 데이터 전송
    			$.ajax({
    			// 보내줄 url : 서블릿쪽 맵핑값
    			url: "todoAjax",
    			// 보내줄 data : 객체형태로 보냄
    			data : sendData,
    			// 전송방식 지정
    			type : "get",
    			// 결과값 자료형 지정 <---------------------------------- json 
    			dataType : 'json',
    			// 성공했을 떄 실행할 함수 지정
    			success : (res)=>{
    				console.log("데이터 전송 성공!");
    				console.log("받아온 데이터 >> ",res);
    			},
    			// 실패했을 떄 실행할 함수 지정
    			error : ()=>{
    				console.log("데이터 전송 실패");
    			}			
    			
    			})
    		
        },
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log("이벤트가 추가되었습니다.");
        },
        eventChange: function(info) { // 이벤트가 수정되면 발생하는 이벤트
          console.log("이벤트가 수정되었습니다.");
        },
        // 드래그앤드롭을 통해 DB 날짜값 변경
        eventDrop : function(info) {
        	var start = info.event.start;
		    var formattedStartDate = start.getFullYear() + '-' + ('0' + (start.getMonth() + 1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2);
		    console.log("클릭한 이벤트의 시작 날짜:", formattedStartDate);
		    
		    var end = info.event.end;
		    end.setDate(end.getDate() - 1);
		    var formattedEndDate = end.getFullYear() + '-' + ('0' + (end.getMonth() + 1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2);
		    console.log("클릭한 이벤트의 종료 날짜:", formattedEndDate);
        	let sendData = {
    				"do_startDate" : formattedStartDate,
    				"do_endDate" : formattedEndDate,
    				"todoIdx" : info.event.id
    				};
    		// 3) console에 출력하기
    			console.log(sendData)
    		// 4) 비동기통신을 사용하여 Servlet으로 데이터 전송
    			$.ajax({
    			// 보내줄 url : 서블릿쪽 맵핑값
    			url: "todoAjax",
    			// 보내줄 data : 객체형태로 보냄
    			data : sendData,
    			// 전송방식 지정
    			type : "get",
    			// 결과값 자료형 지정 <---------------------------------- json 
    			dataType : 'json',
    			// 성공했을 떄 실행할 함수 지정
    			success : (res)=>{
    				console.log("데이터 전송 성공!");
    				console.log("받아온 데이터 >> ",res);
    			},
    			// 실패했을 떄 실행할 함수 지정
    			error : ()=>{
    				console.log("데이터 전송 실패");
    			}			
    			
    			})
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log("이벤트가 삭제되었습니다.");
        },
      eventMouseEnter: function(info) {
          //url 들어가면 바꿔야함.
          if (info.event._def.groupId) { // end 데이터가 있는 이벤트를 클릭했을 때
        	  console.log("인포에뭐가들어있나~",info);
              // 마우스를 요소 위로 가져다 놓았을 때 정사각형 div를 생성하여 배치
              var square = document.createElement('div');
              square.style.width = '320px';
              square.style.zIndex = '9999';
              square.style.height = '120px';
              square.style.backgroundColor = '#ffffe1';
              square.style.border = '1px solid black'; // 1px 두께의 검은색 테두리 설정
              square.style.boxShadow = '2px 2px 4px rgba(0, 0, 0, 0.5)'; // 오른쪽으로 2px, 아래쪽으로 2px의 그림자를 적용하고, 크기는 4px, 검은색, 투명도는 0.5
              square.style.position = 'absolute';
              square.style.top = info.el.getBoundingClientRect().top + 'px';
              square.style.left = (info.el.getBoundingClientRect().right + 5) + 'px'; // 요소 오른쪽에 배치하고 5px 여백 추가
              square.style.display = 'flex'; // 정사각형 내부 요소를 가로로 정렬하기 위해 flex 사용
              square.style.alignItems = 'flex-start'; // 정사각형 내부 요소를 위에부터 작성하기위해
              square.style.color = 'black';
              square.style.fontSize = '13px'; // 텍스트 크기 설정
              square.style.fontWeight = '700';
              square.style.padding = '10px'; // 위쪽으로 5px의 여백 설정
              square.innerHTML = "공모전 제목:<br>'" + info.event.title + "'<br>기간:<br>'" + info.event.startStr + "'~'" + info.event.endStr + "'";
              square.setAttribute('id', 'tooltip'); // div에 id 추가
              document.body.appendChild(square);

          } else if (info.event.title) {
              
				console.log("뭐 시발")
          }

  },
  eventMouseLeave: function(info) {
      // 마우스가 요소를 벗어나면 생성된 정사각형 div를 제거
      var square = document.getElementById('tooltip'); // id를 이용하여 정사각형 div를 가져옴
      if (square) {
          document.body.removeChild(square);
      }
  },
      eventClick: function(info) {
    	  // url 넣으면 바꿔야함.
    	  console.log(info.event);
        if (info.event._def.groupId) { // end 데이터가 있는 이벤트를 클릭했을 때
        	console.log("ㅋㅋ 원래있었어 ㅋㅋ")
        	window.open(info.event._def.groupId, '_blank', 'width=800,height=600');
        } else if (info.event.end) { // 'Birthday Party' 이벤트를 클릭했을 때
            openModal(info.event);
            return false;
        }
        },
      events: [
      ]
    });

    calendar.render();

    $(document).ready(function() {
        function handleSelect(Select) {
            let select = Select.val();
            let send = {"select": select};

            $.ajax({
                url: "todoSelectAjax",
                data: send,
                type: 'get',
                dataType: 'json',
                success: function(res) {
                    calendar.removeAllEvents();
                    for (let i = 0; i < res.length; i++) {
                        let data = {
                            title: res[i].content,
                            start: res[i].do_startDate,
                            end: res[i].do_endDate,
                            id: res[i].todoIdx,
                            sourceId: res[i].todoTitle,
                            display: 'block'
                        };
                        calendar.addEvent(data);
                    }

                    // 두 번째 AJAX 호출 수행
                    handleScrapSelect(Select);
                },
                error: function() {
                    console.error("셀렉트 변경중 오류발생.");
                }
            });
        }

        $("#todoTitle").on("change", function() {
            handleSelect($(this));
        });

        function handleScrapSelect(Select) {
            let select = Select.val();
            let send1 = {"select": select};

            $.ajax({
                url: "calScrapAjax",
                data: send1,
                type: 'get',
                dataType: 'json',
                success: function(res1) {
                    for (let i = 0; i < res1.length; i++) {
                        let data1 = {
                            title: res1[i].conName,
                            start: res1[i].conStartDate,
                            end: res1[i].conEndDate,
                            id: res1[i].conIdx,
                            groupId: res1[i].conHomepage,
                            display: 'list-item'
                        };
                        calendar.addEvent(data1);
                    }
                },
                error: function() {
                    console.error("셀렉트 변경중 오류발생.");
                }
            });
        }

        // 첫 번째 옵션 선택
        $("#todoTitle").val($("#todoTitle option:first").val());

        // handleSelect 함수 호출하여 초기 데이터 로드
        handleSelect($("#todoTitle"));
        
        
    });
});
</script>
<style>
/* 모달 스타일 */
.modal {
	display: block; /* 모달을 보이도록 설정 */
	position: fixed; /* 화면 기준으로 고정 */
	z-index: 9999; /* 다른 요소들보다 위에 위치하도록 설정 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto; /* 모달 창 밖에 스크롤이 있을 경우 스크롤 허용 */
	background-color: rgba(0, 0, 0, 0.4); /* 배경에 어둡게 처리 */
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 모달이 화면 중앙에 위치하도록 설정 */
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	color: black;
	font-weight: 600;
	font-size: 17px;
}

.modal-content form {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 20px;
}

#ourfullcalendar {
	max-width: 1200px;
	margin: 0 auto;
	color: black;
	background-color: white;
	padding: 20px;
}

#ourfullcalendar a {
	color: black;
}
</style>

</head>

<body>
	<%
MemberVO mvo = (MemberVO) session.getAttribute("profile");
%>

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
			<a href="index.html" class="brand-logo"> <img class="logo-abbr"
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
										<input class="form-control" type="search" placeholder="Contest Search"
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="Scrap.html" role="button"> <!-- data-toggle="dropdown" -->
									<img class="scrapright" src="assets/images/allpagescrap.png"
									height="10px" width="10px"> <!--  <div class="pulse-css"></div> -->
							</a>

								<div>
									<!-- 프로필 닉네임 -->
									<span style="color: #593BDB; font-weight: 700;">${profile.userId}</span>
								</div>
								</li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<img class="mdi mdi-account"
                           src="assets/images/memberprofileimg/1.png" width="30px"
                           height="30px" style="border-radius: 15px; margin-right: 10px;">
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="./app-profile.html" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">Profile </span>
									</a> <a href="./email-inbox.html" class="dropdown-item"> <i
										class="icon-envelope-open"></i> <span class="ml-2">Inbox
									</span>
									</a> <a href="./page-login.html" class="dropdown-item"> <i
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
			<!-- row -->

			<div class="ourSelect" style="margin-right: 220px;">
				<select class="ourSelect" id="todoTitle">
					<c:forEach items="${calTitle}" var="ct">
						<option>${ct}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div align="center">
				<div id='ourfullcalendar'></div>
				
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