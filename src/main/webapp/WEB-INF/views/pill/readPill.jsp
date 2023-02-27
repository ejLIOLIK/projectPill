<%@page import="com.liolik.project.dto.PillDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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