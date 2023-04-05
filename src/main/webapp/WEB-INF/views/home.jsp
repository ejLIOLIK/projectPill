<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

				<p>의약품 유통 관리업무를 위한 웹페이지, Pill Project입니다. <br />
				
				<sec:authorize access="isAnonymous()">
				<p> 로그인 전입니다, </br>
				로그인 후 이용하세요. </p>
				</sec:authorize>
				<sec:authorize access="!isAnonymous()">
				<p> <sec:authentication property="principal.ENAME" /> 님, </br>
				좋은 하루 보내세요. </p>
				</sec:authorize>

	<%@include file = "BottomFooter.jsp" %>
	
</body>
</html>
