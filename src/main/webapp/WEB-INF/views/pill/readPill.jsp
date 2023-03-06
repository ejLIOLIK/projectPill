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

CODE: ${read.PILLCODE}<br>
NAME: ${read.PILLNAME}<br>
CAPACITY: ${read.CAPACITY}<br>
COMPANY: ${read.COMPANY}<br>
PRICE: ${read.PRICE}<br>

<br>
<a href="/pill/editPill?pillCode=${read.PILLCODE}"> 수정 </a><br>
<a href="/pill/deletePill?pillCode=${read.PILLCODE}"> 삭제 </a><br>
<a href="/pill/getListPill"> 조회 </a>

<br><br>
<c:forEach var="productList" items="${list}"> 
${productList.PCODE}
<a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a>
${productList.CAPACITY}	
${productList.AMOUNT}	
${productList.UNIT}	
${read.PRICE}
${productList.PRICE}	
${productList.STOCK}
<br>
</c:forEach>

</body>
</html>