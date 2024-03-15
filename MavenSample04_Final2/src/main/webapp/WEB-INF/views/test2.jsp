<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js" 
			integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w==" 
			crossorigin="anonymous" 
			referrerpolicy="no-referrer">
	</script>
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            const columns = document.querySelectorAll(".column");
            columns.forEach((column) => {
                new Sortable(column, {
                    group: "shared",
                    animation: 150,
                    ghostClass: "blue-background-class"
                });
            });
        });
    </script>
	<style>
		.container {
    		font-family: "Trebuchet MS", sans-serif;
    		display: flex;
    		gap: 30px;
   			 }
    	.column {
    		flex-basis: 20%;
    		background: #ddd;
    		min-height: 90vh;
    		padding: 5px;
    		border-radius: 10px;
    		}
   		 .column h1 {
   			text-align: center;
    		font-size: 22px;
    		}
    	.list-group-item {
    		background: #fff;
   			margin: 20px;
   			padding: 20px;
    		border-radius: 5px;
    		cursor: pointer;
    		}
	</style>
<body>

	<%
	 String work = (String)request.getAttribute("work");
	%>
	
	
	<h1>테스트 1번 입니다.</h1>
	<form action="test2" method="post">
		<input type="text" name="work" placeholder="할일을 작성해주세요.">
		<input type="submit" value="제출">
		<input type="button" value="생성" onclick="create()">
	</form>
			<script>	
			/* 할일  */
				function create() {
				var child = document.geaddressementById("insertmemo")				
   			 	var newItem = document.createElement("div");
    			newItem.className = "list-group-item";  			 
   			 	newItem.setAttribute("draggable", "true"); 
    			newItem.innerText = "${work}";
				child.appendChild(newItem)
				}
			</script>
			
    <div class="container">
        <div class="column" id="insertmemo">
            <h1>1</h1>
                <div class="list-group-item" draggable="true">Wash Clothes</div>
                <div class="list-group-item" draggable="true">Take a stroll outside</div>
                <div class="list-group-item" draggable="true">Design Thumbnail</div>
                <div class="list-group-item" draggable="true">Attend Meeting</div>
                <div class="list-group-item" draggable="true">Fix workshop</div>
                <div class="list-group-item" draggable="true">Visit the zoo</div>
        </div>

        <div class="column">
            <h1>2</h1>
            	<div class="list-group-item" draggable="true">Visit the zoo</div>
        </div>
        <div class="column">
            <h1>3</h1>
        </div>
    </div>
		
	
    
		
	
	
</body>
</html>