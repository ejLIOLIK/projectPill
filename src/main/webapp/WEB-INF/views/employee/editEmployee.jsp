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