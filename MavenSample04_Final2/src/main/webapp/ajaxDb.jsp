<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TodoList</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".draggable").on("dragstart", function (event) {
                event.originalEvent.dataTransfer.setData("text/plain", event.target.id);
            });

            $(".droppable").on("dragover", function (event) {
                event.preventDefault();
            });

            $(".droppable").on("drop", function (event) {
                event.preventDefault();
                var todoId = event.originalEvent.dataTransfer.getData("text/plain");
                var todoStatus = "진행중"; // 변경된 상태
                $.ajax({
                    url: "updateTodoStatus.php",
                    method: "POST",
                    data: { id: todoId, status: todoStatus },
                    success: function (response) {
                        // 업데이트가 성공하면 UI를 업데이트하거나 다른 작업을 수행할 수 있음
                        $("#" + todoId).appendTo($(this));
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="draggable" id="todo1" draggable="true">할일1</div>
    <div class="draggable" id="todo2" draggable="true">할일2</div>

    <div class="droppable">
        진행중
    </div>
</body>
</html>