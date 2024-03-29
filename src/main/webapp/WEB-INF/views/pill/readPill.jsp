<%@page import="com.liolik.project.dto.PillDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<ul>
	<li>코드: ${read.PILLCODE}</li>
	<li>약품명: ${read.PILLNAME}</li>
	<li>용량: ${read.CAPACITY}</li>
	<li>회사: ${read.COMPANY}</li>
	<li>약가: ${read.PRICE}</li>
	</ul>

	<div style="text-align:right">
		<button class="button primary" id="buttonList">목록</button>
	</div>

<hr>
제품

<pre><div class="table-wrapper">
	<table>
		<thead>
			<tr>
				<th>코드</th>
				<th>제품명</th>
				<th>용량</th>
				<th>규격</th>
				<th>단위</th>
				<th>약가</th>
				<th>제품가</th>
				<th>재고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productList" items="${list}">
			<tr>
				<td>${productList.PCODE}</td>
				<td><a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a></td>
				<td>${productList.CAPACITY}	</td>
				<td>${productList.AMOUNT}</td>
				<td>${productList.UNIT}	</td>
				<td>${read.PRICE}</td>
				<td>${productList.PRICE}</td>
				<td>${productList.STOCK}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div></pre>

	<%@include file = "../BottomFooter.jsp" %>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#buttonList").on("click",function(){
		location.replace("/pill/getListPill");
	});
});
</script>
</body>
</html>