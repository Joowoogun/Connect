$(document).ready(function() {
    // 셀렉터의 값이 변경될 때마다 handleSelect 함수를 호출
    $("#todoTitle").on("change", function() {
        handleSelect($(this));
    });
    handleSelect($("#todoTitle"));

    function handleSelect(Select) {
        // 현재 셀렉터에 선택한 정보를 변수에 저장
        let select = Select.val();
        let send = {"select": select};
        console.log(select);
        // firstTitle 요소의 value 값을 선택된 옵션의 값으로 변경
        $("#firstTitle").val(select);
        // 사용자에게 보여지는 걸 변경
        $("#showHide").attr("placeholder", select);

        $.ajax({
            url: "todoSelectAjax",
            data: send,
            type: 'get',
            dataType: 'json',
            success: function(res) {
                $(".ourcolumn .list-group-item").remove();
                console.log(res[0].content);
                console.log("셀렉트 변경 성공.");

                for (let i = 0; i < res.length; i++) {
                    console.log(res[i].content);

                    let drag =
                        `
                    <div class="list-group-item" draggable="true">
                    <h2><input type="text" name="content" id="todoContent" value="${res[i].content}"></h2>
                    <h5>${res[i].do_startDate}~${res[i].do_endDate}</h5>
                    <input type="hidden" id="status" value="${res[i].do_Status}">
                    <input type="hidden" id="delTodoTitle" name="todoTitle" value="${res[i].todoTitle}">
                    <input type="image" class="deletebutton" value="비동기삭제" src="assets/images/tododelete.png" width="15px" height="15px">
                    <input type="hidden" name="todoId" id="todoIdx" value="${res[i].todoIdx}">
                    </div>
                       `;
                    if (res[i].do_Status == "해야 할 일") {
                        $("#Todo").append(drag);
                    } else if (res[i].do_Status == "진행 중") {
                        $("#InProgress").append(drag);
                    } else {
                        $("#Done").append(drag);
                    }
                }

                if ($('.ourcontainer .list-group-item').length === 0) {
                    handleFirstOption(select);
                }
            },
            error: function() {
                console.error("셀렉트 변경중 오류발생.");
            }
        });
    }

    function handleFirstOption(firstOption) {
        // 현재 선택된 옵션 제거
        $('#todoTitle option:selected').remove();
        // 남은 옵션 중 첫 번째 옵션 선택
        let newOption = `<option value="${firstOption}">${firstOption}</option>`;
        $('#todoTitle').prepend(newOption);
        $('#todoTitle').val(firstOption);
    }
});


