<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.smhrd.model.TodolistVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	  <meta charset='utf-8' />
	  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
	  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	  <!-- jquery CDN -->
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	  <!-- fullcalendar CDN -->
	  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	  <!-- fullcalendar 언어 CDN -->
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	  <script src="assets/js/TodoModal.js"></script>
	<style>
	  /* body 스타일 */
	  html, body {
	    overflow: hidden;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
	  .fc-header-toolbar {
	    padding-top: 1em;
	    padding-left: 1em;
	    padding-right: 1em;
	  }
	</style>
	</head>
	<body style="padding:30px;">
	  <!-- calendar 태그 -->
	  <div id='calendar-container'>
	  <select class="ourSelect" id="todoTitle">
            <c:forEach items="${calTitle}" var="ct">
                  <option>${ct}</option>
              </c:forEach>
         </select>
	  </div>
	  <div id="calendar"></div>
	  
	  <script>
	  
	  let calendar;
	  
	  (function(){
	    $(function(){
	      // calendar element 취득
	      var calendarEl = $('#calendar')[0];
	      // full-calendar 생성하기
	      calendar = new FullCalendar.Calendar(calendarEl, {
	        height: '700px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        slotMinTime: '00:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
	        customButtons: {
	            myCustomButton: {
	              text: '일정추가',
	              click: function() {
	                alert('clicked the custom button!');
	              }
	            }
	          },
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'myCustomButton'
	        },
	        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	        editable: true, // 수정 가능?
	        selectable: false, // 달력 일자 드래그 설정가능
	        nowIndicator: true, // 현재 시간 마크
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	        locale: 'ko', // 한국어 설정
	        
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
	        eventClick: function(info) {
	        	// 모달창 띄우기
	        	console.log(info)
	        	console.log(info.event.id)
	        	console.log(info.event.title)
	        	console.log(info.event.startStr)
	        	console.log(info.event.endStr)
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
	        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	          var title = prompt('Event Title:');
	          if (title) {
	            calendar.addEvent({
	              title: title,
	              start: arg.start,
	              end: arg.end,
	              allDay: arg.allDay
	            })
	          }
	        },
	        // 
	        events: []
	      });
	      // 캘린더 랜더링
	      calendar.render();
	    });
	  })();
	  
	  // 셀렉터의 값이 변경될 때마다 handleSelect 함수를 호출
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
                        start: res1[i].conEndDate,
                        end: res1[i].conEndDate,
                        id: res1[i].conIdx,
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
});


	</script>
	</body>
	</html>