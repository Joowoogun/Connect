// 삭제 버튼 클릭 이벤트
$(document).on("click", "#caltodoUpdate", function() {
	caltodoUpdateclick($(this));
});

function caltodoUpdateclick() {
	var fixid = $('input[id="eventId"]').val();
	var fixcontent = $('textarea[name="fixcontent"]').val(); // 내용
	var fixdo_Status = $('select[name="fixdo_Status"]').val(); // 상태
	var fixdo_startDate = $('input[name="fixdo_startDate"]').val(); // 시작 날짜
	var fixdo_endDate = $('input[name="fixdo_endDate"]').val(); // 종료 날짜

	console.log(fixid)
	console.log(fixcontent)
	console.log(fixdo_Status)
	console.log(fixdo_startDate)
	console.log(fixdo_endDate)
	var eventData = {
		id: fixid, // info.event.id 에 대한 정보가 어디서 올지 명확하지 않아서 추가 설명이 필요합니다.
		content: fixcontent,
		do_Status: fixdo_Status,
		do_startDate: fixdo_startDate,
		do_endDate: fixdo_endDate
	};

	$.ajax({
		url: 'todoAjax', // 수정을 처리할 서버의 URL
		method: 'POST', // POST 방식으로 전송
		data: eventData, // 수정된 정보 전송
		success: function(response) {
			console.log('수정이 성공적으로 완료되었습니다.');
			console.log(response); // 서버로부터의 응답 확인
			// 수정된 이벤트를 캘린더에 반영
			calendar.refetchEvents();
		},
		error: function() {
			console.error("데이터 전송 실패");
		}
	});
};

function editModal(event) {
	var editModal = document.createElement('div');
	editModal.classList.add('modal');

	// 모달 창 내용을 설정합니다.
	editModal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Schedule</h5>
                </div>
                <div>
                		<input type="hidden" id="eventId" value="${event.id}">
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
	
	// 닫기 버튼을 클릭하면 모달 창이 닫히도록 설정합니다.
	var closeButton = editModal.querySelector('#close');
	closeButton.addEventListener('click', function() {
		editModal.remove();
	});
}

function openEditModal() {
	var closeButton = editModal.querySelector('#close');
	closeButton.addEventListener('click', function() {
		editModal.remove();
	});
	
	// 페이지에 모달 창을 추가합니다.
	document.body.appendChild(editModal);

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
		openEditModal(event);
	});

	var deleteButton = modal.querySelector('#deleteBtn');
	deleteButton.addEventListener('click', function() {
		// 삭제 동작을 수행하는 함수를 호출합니다.
		deleteEvent();
	});
}


