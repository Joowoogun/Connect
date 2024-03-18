<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>드래그 앤 드롭</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .draggable {
            width: 100px;
            height: 100px;
            background-color: #ccc;
            margin: 10px;
            cursor: move;
        }
        .droppable {
            width: 200px;
            height: 200px;
            background-color: #f0f0f0;
            margin: 10px;
        }
    </style>
    <script>
        $(document).ready(function() {
            $(".draggable").draggable({
                revert: true
            });

            $(".droppable").droppable({
                drop: function(event, ui) {
                    var draggableId = ui.draggable.attr("id");
                    var droppableId = $(this).attr("id");
                    
                    // 드롭한 요소의 status 확인
                    var draggableStatus = $("#" + draggableId).data("status");
                    var droppableStatus = $("#" + droppableId).data("status");
                    
                    if (draggableStatus === "해야할 일" && droppableStatus === "진행 중") {
                        // 드래그1을 드래그2 쪽으로 이동하여 드랍
                        $("#" + draggableId).appendTo("#" + droppableId);
                        
                        // status 변경
                        $("#" + draggableId).data("status", "진행 중");
                        console.log(draggableId + "의 status가 변경되었습니다.");
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div id="draggable1" class="draggable" data-status="해야할 일">드래그1</div>
    <div id="draggable2" class="draggable" data-status="진행 중">드래그2</div>
    <div id="droppable1" class="droppable" data-status="해야할 일">여기에 드롭하세요</div>
    <div id="droppable2" class="droppable" data-status="진행 중">여기에 드롭하세요</div>
</body>
</html>
