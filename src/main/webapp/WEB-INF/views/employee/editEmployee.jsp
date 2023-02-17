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
	<form action="/employee/editEmployee" method="post">
		${read.ECODE}
		<input type="hidden" name="ECODE" value="${read.ECODE}">
		<input type="text" name="ENAME" value="${read.ENAME}">
		<input type="text" name="ERANK" value="${read.ERANK}">
		<input type="text" name="ETEAM" value="${read.ETEAM}">
		<input type="submit" value="수정">
	</form>

</body>
</html>