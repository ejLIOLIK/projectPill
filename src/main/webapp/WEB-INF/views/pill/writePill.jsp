<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

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