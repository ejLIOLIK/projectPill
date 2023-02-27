<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	NAME / COMPANY / PRICE
	<form action="/pill/writePill" method="post">
		<input type="text" name="PILLNAME" required="required">
		<input type="text" name="CAPACITY">
		<input type="text" name="COMPANY" required="required">
		<input type="number" name="PRICE" required="required">
		<input type="submit" value="등록">
	</form>

</body>
</html>