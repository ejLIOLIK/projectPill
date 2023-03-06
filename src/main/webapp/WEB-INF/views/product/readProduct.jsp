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

CODE: ${read.PCODE}<br>
NAME: ${read.PNAME} ${read.CAPACITY} ${read.AMOUNT} (${read.UNIT})<br>
PILLNAME: ${read.PNAME}<br>
PRICE: ${read.PRICE}<br>
STOCK: ${read.STOCK}<br><br>

* 동일 약품 <br>
<c:forEach var="productList" items="${list}"> 
	<c:if test="${productList.PCODE ne read.PCODE}">
	${productList.PCODE}
	<a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a>
	${productList.PNAME}
	${productList.CAPACITY}	
	${productList.AMOUNT}	
	${productList.UNIT}	
	${productList.PRICE}	
	${productList.STOCK}
	<br>
	</c:if>
</c:forEach>
<br>

<a href="/product/deleteProduct?productCode=${read.PCODE}"> 삭제 </a><br>
<a href="/product/getListProduct"> 조회 </a>

</body>
</html>