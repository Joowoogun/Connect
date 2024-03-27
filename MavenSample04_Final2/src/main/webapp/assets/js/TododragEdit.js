	$(document).ready(function() {
    // 삭제 버튼 클릭 이벤트
    $(document).on("keyup", "#todoContent", function() {
        handleKeyup($(this));
    });

    function handleKeyup(todoEdit) {
        // 키를 누르고 땔때마다 변경되는 밸류값을 저장
        let txt = todoEdit.val();
        // 부모태그를 통해서 바깥태그의 idx 값을 가져오기
        let idx = todoEdit.closest('.list-group-item').find("#todoIdx").val();
        // 변수에 묶어서 보내기위해 담기
        let Edit = {"content": txt, "idx": idx};

        $.ajax({
            url: "todoContentEdit",
            data: Edit,
            type: 'get',
            success: function() {
                console.log("변경사항 적용.");
            },
            error: function() {
                console.error("변경중 오류발생.");
            }
        });
    };
});
