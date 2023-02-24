<%@page import="com.liolik.project.dto.ProductDto"%>
<%@page import="java.util.List"%>
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

CODE / NAME / CAPACITY / AMOUNT / PRICE / STOCK <br>

	<c:forEach var="productList" items="${list}"> 
		<c:choose> 
			<c:when test = "${productCodeEdit eq productList.PCODE}"> <%-- 수정 시 리스트와 같은 화면에서 수정 되도록 --%>
				<form action="/product/editProduct" method="post">
				<input type="hidden" name="PILLCODE" value="${productList.PILLCODE}">
				<input type="hidden" name="PCODE" value="${productList.PCODE}">
				<input type="hidden" name="PNAME" value="${productList.PNAME}">
				${productList.PCODE}
				<a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a>
				<input type="text" name="CAPACITY" value="${productList.CAPACITY}">
				<input type="text" name="AMOUNT" value="${productList.AMOUNT}">
				<input type="text" name="PRICE" value="${productList.PRICE}">
				<input type="number" name="STOCK" value="${productList.STOCK}">
				<input type="submit" value="수정">
				<button type="button" onclick="location.href='/product/getListProduct'">취소</button>
				</form>
			</c:when>
			<c:otherwise> 
				${productList.PCODE}
				<a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a>
				${productList.CAPACITY}	
				${productList.AMOUNT}	
				${productList.PRICE}	
				${productList.STOCK}	
				<button type="button" onclick="location.href='/product/getListProduct?ProductCodeEdit=${productList.PCODE}'"> 수정 </button>
				<button type="button" onclick="location.href='/product/deleteProduct?productCode=${productList.PCODE}'"> 삭제 </button>
				<br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<!-- 		입력 -->
<!-- 		<br> -->
<!-- 		NAME / COMPANY / PRICE -->
<!-- 		<form action="/pill/writePill" method="post"> -->
<!-- 		<input type="text" name="PILLNAME"> -->
<!-- 		<input type="text" name="COMPANY"> -->
<!-- 		<input type="number" name="PRICE"> -->
<!-- 		<input type="submit" value="등록"> -->
<!-- 	</form>	 -->

</body>
</html>