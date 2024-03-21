<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String[] todoTitles = request.getParameterValues("todoTitle");
	%>
	<h2>Add New ToDo</h2>
	<form action="addTodo.do" method="post">
	<input type="text" placeholder="제목을 입력해주세요" name="yourTitle">
		간편선택 : <select name="todoTitle">
		<option>직접입력</option>
        <% for (String title : todoTitles) { %>
            <option><%= title %></option>
        <% } %>
        
    </select>
		<br>
		 Content:
		<input type="text" name="content"><br> Status: <select
			name="do_Status">
			<option value="해야 할 일">해야 할 일</option>
			<option value="진행 중">진행 중</option>
			<option value="완료">완료</option>
		</select><br> startDate: <input type="date" name="do_startDate"><input
			type="time" name="do_startTime"><br>endDate:
		<input type="date" name="do_endDate"><input type="time"
			name="do_endTime"><br> <input type="submit" value="Add">
	</form>

</body>
</html>