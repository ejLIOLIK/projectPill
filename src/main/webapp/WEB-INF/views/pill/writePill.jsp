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
		<input type="text" name="PILLNAME">
		<input type="text" name="COMPANY">
		<input type="number" name="PRICE">
		<input type="submit" value="등록">
	</form>

</body>
</html>