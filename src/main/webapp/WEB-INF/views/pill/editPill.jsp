<%@page import="com.liolik.project.dto.PillDto"%>
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

	CODE / NAME / COMPANY / PRICE
	<form action="/pill/editPill" method="post">
		${read.PILLCODE}
		<input type="hidden" name="PILLCODE" value="${read.PILLCODE}">
		<input type="text" name="PILLNAME" value="${read.PILLNAME}">
		<input type="text" name="CAPACITY" value="${read.CAPACITY}">
		<input type="text" name="COMPANY" value="${read.COMPANY}">
		<input type="number" name="PRICE" value="${read.PRICE}">
		<input type="submit" value="수정">
	</form>
</body>
</html>