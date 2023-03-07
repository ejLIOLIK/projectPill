<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="TopHeader.jsp" %>

			<%-- 로그인 여부 체크 후 다르게 띄울 예정 --%>
				<h1 class="major"> Pill Project </h1> 
				<span class="image fit"><img src="/resources/images/pic04.jpg" alt="" /></span>
				<p> (로그인 정보) 님, </br>
				좋은 하루 보내세요. </p>

	<%@include file = "BottomFooter.jsp" %>
	
</body>
</html>
