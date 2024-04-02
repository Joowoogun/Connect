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


 //////////////////////////////////////////////////////
function openEditModal(eventIdx, eventTitle) {
	var modal = document.querySelector('.modal');
    if (modal) {
        modal.remove();
    }
	console.log("운비확인 >> " , eventIdx, eventTitle);
	// 페이지에 모달 창을 추가합니다.
	////////////////////////////////////////////////
	var editModal = document.createElement('div');
	editModal.classList.add('modal');

	// 모달 창 내용을 설정합니다.
	editModal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Schedule</h5>
                </div>
                <div>
                	<br>	
                	<input type="hidden" id="eventTitle" value="${eventTitle}">
                	<input type="hidden" id="eventId" value="${eventIdx}">
                        Content:<br>
                        <textarea placeholder="일정 이름" name="fixcontent" rows="2" cols="50" style="resize: none;"></textarea><br><br>
                        Status: <select name="fixdo_Status">
                            <option value="해야 할 일">해야 할 일</option>
                            <option value="진행 중">진행 중</option>
                            <option value="완료">완료</option>
                        </select><br><br>
                        startDate: <input type="date" name="fixdo_startDate">
                        <input type="time" name="fixdo_startTime"><br><br>
                        endDate: <input type="date" name="fixdo_endDate">
                        <input type="time" name="fixdo_endTime"><br><br>
                    <div class="modal-footer">
                        <button type="button" id="close" class="btn btn-secondary">Close</button>
                        <input type="button" class="btn btn-primary" id="caltodoUpdate" value="Save">
                    </div>
                </div>
            </div>
        `;
	document.body.appendChild(editModal);
	
	var closeButton = editModal.querySelector('#close');
	closeButton.addEventListener('click', function() {
		editModal.remove();
	});
	
	// 삭제 버튼 클릭 이벤트
$(document).on("click", "#caltodoUpdate", function() {
	caltodoUpdateclick($(this));
});

function caltodoUpdateclick() {
	var fixid = $('input[id="eventId"]').val();
	var fixTitle = $('input[id="eventTitle"]').val();
	var fixcontent = $('textarea[name="fixcontent"]').val(); // 내용
	var fixdo_Status = $('select[name="fixdo_Status"]').val(); // 상태
	var fixdo_startDate = $('input[name="fixdo_startDate"]').val(); // 시작 날짜
	var fixdo_endDate = $('input[name="fixdo_endDate"]').val(); // 종료 날짜
	var fixdo_startTime = $('input[name="fixdo_startTime"]').val();
	var fixdo_endTime = $('input[name="fixdo_endTime"]').val();

	console.log(fixid)
	console.log(fixTitle)
	console.log(fixcontent)
	console.log(fixdo_Status)
	console.log(fixdo_startDate)
	console.log(fixdo_endDate)
	console.log(fixdo_startTime)
	console.log(fixdo_endTime)
	
	var eventData = {
		id: fixid, 
		todoTitle: fixTitle,
		content: fixcontent,
		do_Status: fixdo_Status,
		do_startDate: fixdo_startDate,
		do_endDate: fixdo_endDate,
		do_startTime: fixdo_startTime,
		do_endTime: fixdo_endTime
	};
	
	

	$.ajax({
		url: 'calUpdateAjax', // 수정을 처리할 서버의 URL
		method: 'POST', // POST 방식으로 전송
		data: eventData, // 수정된 정보 전송
		success: function(res) {
			console.log('수정이 성공적으로 완료되었습니다.');
			console.log(res); // 서버로부터의 응답 확인9
			var ress = res.replace(/"/g, ''); // 모든 큰따옴표를 빈 문자열로 대체합니다.
			console.log(ress);
	        selectOption(ress); 
			editModal.remove();
		},
		error: function() {
			console.error("데이터 전송 실패");
		}
	});
};
	
}

function openModal(event) {
	// 모달 창을 생성합니다.
	var modal = document.createElement('div');
	modal.classList.add('modal');

	// 모달 창 내용을 설정합니다.
	modal.innerHTML = ` 
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="viewModalLabel">
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> <span id="eventDate">${event.startStr} ~ ${event.endStr}</span><br>
                    <input type="hidden" id="id" value="0">
                    <input type="hidden" id="mode" value="write">
                </h4>
            </div>
            <div class="modal-body" id="viewModalBody">${event.title}</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="deleteBtn">Delete</button>
                <button type="button" onclick="openEditModal('${event._def.publicId}','${event._def.extendedProps.sourceId}')" class="btn btn-primary" id="editBtn">Edit</button>
                <button type="button" class="btn btn-secondary" id="firstclose">close</button>
            </div>
        </div>
        `
	// 페이지에 모달 창을 추가합니다.
	document.body.appendChild(modal);

	// 닫기 버튼을 클릭하면 모달 창이 닫히도록 설정합니다.
	var firstcloseButton = modal.querySelector('#firstclose');
	firstcloseButton.addEventListener('click', function() {
		modal.remove();
	});
	
	
	// js 익명함수 / 이벤트리스너 or 핸들러 추가할 때 지역변수 범위 
	/*var editButton = modal.querySelector('#editBtn');
	editButton.addEventListener('click', function() {
		openEditModal(event);
	});*/
	let addTitle = document.getElementById("todoTitle");
	
	var deleteButton = modal.querySelector('#deleteBtn');
	deleteButton.addEventListener('click', function() {
		// 삭제 동작을 수행하는 함수를 호출합니다.
		console.log("승우야 나 여깄어")
		var id = event._def.publicId;
		var todoTitle = event._def.extendedProps.sourceId;
		console.log(id);
		let data ={"id":id,
		"todoTitle":todoTitle
		};
		
		$.ajax({
		url: 'calUpdateAjax', // 수정을 처리할 서버의 URL
		method: 'POST', // POST 방식으로 전송
		data: data, // 수정된 정보 전송
		success: function(res) {
			console.log('수정이 성공적으로 완료되었습니다.');
			console.log(res); // 서버로부터의 응답 확인9
			var ress = res.replace(/"/g, ''); // 모든 큰따옴표를 빈 문자열로 대체합니다.
			console.log(ress);
	        selectOption(ress);
	        modal.remove();
		},
		error: function() {
			console.error("데이터 전송 실패");
		}
});
});
}