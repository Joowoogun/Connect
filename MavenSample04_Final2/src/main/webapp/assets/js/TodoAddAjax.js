function selectOption(optionValue) {
  // optionValue는 선택할 옵션의 값입니다.
  
  // #todoTitle 셀렉터에서 해당 옵션을 선택합니다.
  $('#todoTitle').val(optionValue);
  
  // change 이벤트를 강제로 트리거합니다.
  $('#todoTitle').trigger('change');
}



// addTodo 비동기 이벤트 메소드	
	// 추가할때 필요한 정보들을 변수에 저장하고 객체 형태로 변환
	$('#addTodoBtn').on("click",function(){
		let addTodoTitle = $(this).closest(".modal-body").find("#addTodoTitle").val()
		let addYourTitle = $(this).closest(".modal-body").find("#addYourTitle").val()
		let addContent = $(this).closest(".modal-body").find("#addContent").val()
		let addStatus = $(this).closest(".modal-body").find("#addStatus").val()
		let addStartDate = $(this).closest(".modal-body").find("#addStartDate").val()
		let addStartTime = $(this).closest(".modal-body").find("#addStartTime").val()
		let addEndDate = $(this).closest(".modal-body").find("#addEndDate").val()
		let addEndTime = $(this).closest(".modal-body").find("#addEndTime").val()
		
		let addList = {"addTodoTitle" : addTodoTitle,
						"addYourTitle" : addYourTitle,
						"addContent" : addContent,
						"addStatus" : addStatus,
						"addStartDate" : addStartDate,
						"addStartTime" : addStartTime,
						"addEndDate" : addEndDate,
						"addEndTime" : addEndTime
						}
		console.log(addList);
		
		// 성공시 메인 타이틀 변경하기위해 변수에 담아두기
		let nowTitle = document.getElementById("showHide");
		let addTitle = document.getElementById("addTodoTitle");
		
		// ajax 작동
		$.ajax({
			url : "todoaddAjax",
			data : addList,
			type: 'get',
			success : (res) =>  {
				   let ress = new Option(res);
	               addTitle.add(ress);
	               nowTitle.placeholder = res;
	               let newOptionHtml = `<option>${res}</option>`;
	               $("#todoTitle").append(newOptionHtml);
	               selectOption(res);
	              
	        },
	        error : () => {
	               console.error("Todo 추가중 오류발생.");
	        }
		})
		
	})