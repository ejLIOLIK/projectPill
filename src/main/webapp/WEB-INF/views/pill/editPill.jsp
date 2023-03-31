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
	
	<div class="split style1">
		<section>
			<form action="/pill/editPill" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="fields">
				<input type="hidden" name="PILLCODE" value="${read.PILLCODE}">
				<div class="field">
					<label for="message">NAME</label>
					<input type="text" name="PILLNAME" value="${read.PILLNAME}">
				</div>
				<div class="field">
					<label for="message">CAPACITY</label>
					<input type="text" name="CAPACITY" value="${read.CAPACITY}">
				</div>
				<div class="field">
					<label for="message">COMPANY</label>
					<input type="text" name="COMPANY" value="${read.COMPANY}">
				</div>
				<div class="field">
					<label for="message">PRICE</label>
					<input type="text" pattern="[0-9]+" name="PRICE" value="${read.PRICE}">
				</div>
				<div class="field">
					<input type="submit" class="button primary" value="수정">
				</div>
			</div>		
		</form>
		</section>
		<section>
			<ul class="contact">
				<li>
				<h3>※ 주의</h3>
				<span>수정시 동일 제품 데이터가<br>함께 수정됩니다.</span>
				</li>
			</ul>							
		</section>
	</div>
	
	<%@include file = "../BottomFooter.jsp" %>
</body>
</html>