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
	<li>CODE: ${read.PILLCODE}</li>
	<li>NAME: ${read.PILLNAME}</li>
	<li>CAPACITY: ${read.CAPACITY}</li>
	<li>COMPANY: ${read.COMPANY}</li>
	<li>PRICE: ${read.PRICE}</li>
	</ul>

	<div style="text-align:right">
		<button class="button primary" id="buttonEdit">수정</button>
		<button class="button primary" id="buttonDelete">삭제</button> 
		<button class="button primary" id="buttonList">목록</button>
	</div>

<hr>
제품

<pre><div class="table-wrapper">
	<table>
		<thead>
			<tr>
				<th>CODE</th>
				<th>NAME</th>
				<th>CAPACITY</th>
				<th>AMOUNT</th>
				<th>UNIT</th>
				<th>PILL PRICE</th>
				<th>PRODUCT PRICE</th>
				<th>STOCK</th>
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
	$("#buttonEdit").on("click",function(){
		location.replace("/pill/editPill?pillCode=${read.PILLCODE}");
	});
	$("#buttonDelete").on("click",function(){
		location.replace("/pill/deletePill?pillCode=${read.PILLCODE}");
	});
	$("#buttonList").on("click",function(){
		location.replace("/pill/getListPill");
	});
});
</script>
</body>
</html>