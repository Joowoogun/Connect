// 드래그할때마다 DB에 현황을 전달하여 업데이트 하는 기능
  $(document).ready(function() {
    // 기존에 있는 요소에 대한 dragend 이벤트 등록
    $(".list-group-item").on("dragend", function() {
        handleDragEnd($(this));
    });

    // 새로 추가된 요소에 대한 dragend 이벤트를 document 전체에 등록
    $(document).on("dragend", ".list-group-item", function() {
        handleDragEnd($(this));
    });

    function handleDragEnd(item) {
        let nowStatus = item.find("#status");
        let newStatus = "";
        let columnId = item.parent().attr("id");

        switch (columnId) {
            case "Todo":
                newStatus = "해야 할 일";
                break;
            case "InProgress":
                newStatus = "진행 중";
                break;
            case "Done":
                newStatus = "완료";
                break;
            default:
                newStatus = "알수없음";
        }

        nowStatus.val(newStatus);

        let todoIdx = item.find("#todoIdx").val();
        let sendData = {
            "status": newStatus,
            "todoIdx": todoIdx
        };

        

        $.ajax({
            url: "todoAjax",
            data: sendData,
            type: 'get',
            dataType: 'json',
            success: function(res) {
                console.log("드래그 연동 성공");
            },
            error: function() {
                console.log("데이터 전송 실패!");
            }
        });
    }
});