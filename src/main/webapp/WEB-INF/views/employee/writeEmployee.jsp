<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	NAME / RANK / TEAM
	<form action="/employee/writeEmployee" method="post">
		<input type="text" name="ENAME">
		<input type="text" name="ERANK">
		<input type="text" name="ETEAM">
		<input type="submit" value="등록">
	</form>

</body>
</html>