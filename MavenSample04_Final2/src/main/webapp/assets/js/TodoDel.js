function selectOption(optionValue) {
  // optionValue는 선택할 옵션의 값입니다.
  
  // #todoTitle 셀렉터에서 해당 옵션을 선택합니다.
  $('#todoTitle').val(optionValue);
  
  // change 이벤트를 강제로 트리거합니다.
  $('#todoTitle').trigger('change');
}



$(document).ready(function() {
    // 삭제 버튼 클릭 이벤트
    $(document).on("click", ".deletebutton", function() {
        handleDelete($(this));
    });

    function handleDelete(deleteButton) {
        let Idx = deleteButton.siblings("#todoIdx").val();
        let todoTitle = deleteButton.siblings("#delTodoTitle").val();
        let delInfo = {"tododelIdx": Idx};
        let $listItem = deleteButton.closest('.list-group-item');
        let nowselected =  $('#todoTitle option:selected');
        let nowTitle = document.getElementById("showHide");
        $.ajax({
            url: "tododelAjax", // 실제 서버 요청 URL로 변경해야 합니다.
            data: delInfo,
            type: 'post',
            success: function() {
                $listItem.remove();
                console.log("삭제완료.");
                if ($('.ourcontainer .list-group-item').length === 0) {
                    // 현재 선택된 옵션 제거
                    nowselected.remove();
                    // 남은 옵션 중 첫 번째 옵션 선택
                    let firstOption = $('#todoTitle option:first-child').val();
                    nowTitle.placeholder = firstOption;
                    console.log(firstOption);
                    selectOption(firstOption);
                }
            },
            error: function() {
                console.error("삭제중 오류발생.");
            }
        });
    }
});
