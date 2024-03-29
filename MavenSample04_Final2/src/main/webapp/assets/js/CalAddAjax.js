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
        console.log(calData);
        console.log(calTitle);
    });

              
              
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
          navLinks: false, // can click day/week names to navigate views
          editable: true,
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
              
              if (info.event.end) { // end 데이터가 있는 이벤트를 클릭했을 때
              
                  // 공백
  
              } else if (info.event.title) {
                  
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
                  square.innerHTML= '공모전제목 :<br>2024년 스마트인재개발원 어플 서비스 공모전<br>기간 :<br>2024년 3월 29일 ~ 2024년 4월 15일'; // 텍스트 추가 
                  square.setAttribute('id', 'tooltip'); // div에 id 추가
                  document.body.appendChild(square);
  
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
            if (info.event.end) { // end 데이터가 있는 이벤트를 클릭했을 때
                openModal(info.event); // 모달을 열 때 이벤트 정보를 전달합니다.
            } else if (info.event.title) { // 'Birthday Party' 이벤트를 클릭했을 때
                window.open('https://www.naver.com/', '_blank', 'width=1200,height=800');
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

            // 첫 번째 옵션 선택
            $("#todoTitle").val($("#todoTitle option:first").val());

            // handleSelect 함수 호출하여 초기 데이터 로드
            handleSelect($("#todoTitle"));
        });

        function openModal(event) {
            // 모달 창을 생성합니다.
            var modal = document.createElement('div');
            modal.classList.add('modal');

            // 모달 창 내용을 설정합니다.
            modal.innerHTML = ` 
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="viewModalLabel">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> <span id="eventDate">2024년 03월 26일 09:00 ~ 2024년 03월 27일 17:45</span><br>
                        <input type="hidden" id="id" value="0">
                        <input type="hidden" id="mode" value="write">
                    </h4>
                </div>
                <div class="modal-body" id="viewModalBody">${event.title}</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="deleteBtn">Delete</button>
                    <button type="button" class="btn btn-primary" id="editBtn">Edit</button>
                    <button type="button" class="btn btn-secondary" id="close">close</button>
                </div>
            </div>
            `
            // 페이지에 모달 창을 추가합니다.
            document.body.appendChild(modal);
            
            // 닫기 버튼을 클릭하면 모달 창이 닫히도록 설정합니다.
            var closeButton = modal.querySelector('#close');
            closeButton.addEventListener('click', function() {
                modal.remove();
            });

            var editButton = modal.querySelector('#editBtn');
            editButton.addEventListener('click', function() {
                openEditModal();
            });

            var deleteButton = modal.querySelector('#deleteBtn');
            deleteButton.addEventListener('click', function() {
                // 삭제 동작을 수행하는 함수를 호출합니다.
                deleteEvent();
            });
           
        }

        function openEditModal() {
            // 이전에 열려있는 모달을 닫습니다.
            var modal = document.querySelector('.modal');
            if (modal) {
                modal.remove();
            }

            // 새로운 모달 창을 생성합니다.
            var editModal = document.createElement('div');
            editModal.classList.add('modal');

            // 모달 창 내용을 설정합니다.
            editModal.innerHTML = `
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Schedule</h5>
                    </div>
                    <form action="editTodo.do" method="post">
                    Title: <input type="text" placeholder="제목을 입력해주세요" id="yourTitle" name="yourTitle">
                    &nbsp;
                    간편선택: <select class="ourSelect" id="todoTitle">
                    <option>직접입력</option>
                    </select>
                                <br>
                                <br>                        
                            Content:<br>
                            <textarea placeholder="일정 이름" name="content" rows="2" cols="50" style="resize: none;"></textarea><br><br>
                            Status: <select name="do_Status">
                                <option value="해야 할 일">해야 할 일</option>
                                <option value="진행 중">진행 중</option>
                                <option value="완료">완료</option>
                            </select><br><br>
                            startDate: <input type="date" name="do_startDate">
                            <input type="time" name="do_startTime"><br><br>
                            endDate: <input type="date" name="do_endDate">
                            <input type="time" name="do_endTime"><br><br>
                        <div class="modal-footer">
                            <button type="button" id="close" class="btn btn-secondary">Close</button>
                            <input type="submit" class="btn btn-primary" value="Save">
                        </div>
                    </form>
                </div>
            `;

            // 페이지에 모달 창을 추가합니다.
            document.body.appendChild(editModal);

            // 닫기 버튼을 클릭하면 모달 창이 닫히도록 설정합니다.
            var closeButton = editModal.querySelector('#close');
            closeButton.addEventListener('click', function() {
                editModal.remove();
            });
        }

        
        
    });    
    
    