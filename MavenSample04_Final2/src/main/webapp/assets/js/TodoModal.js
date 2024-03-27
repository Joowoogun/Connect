// 모달 오픈 이벤트 펑션
$('#modalOpener').on("click", function() {
    let value = $('#exampleModalpopover');
	value.modal('show');
	});
$('#addTodoBtn').on("click", function() {
    let values = $('#exampleModalpopover');
    let a =$("#addStartDate");
    let b =$("#addStartTime");
    let c =$("#addEndDate");
    let d =$("#addEndTime");
    
    if (a == "" || b == "" || c == "" || d == "") {
    	alert("누락된 값이 있습니다.")
	} else {
    	values.modal('hide');
	}
	});
