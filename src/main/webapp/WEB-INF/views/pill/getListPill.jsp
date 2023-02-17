<%@page import="com.liolik.project.dto.PillDto"%>
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

CODE / NAME / COMPANY / PRICE <br>

	<c:forEach var="pillList" items="${list}"> 
		<c:choose> 
			<c:when test = "${pillCodeEdit eq pillList.PILLCODE}">
				<form action="/pill/editPill" method="post">
				${pillList.POLLCODE}
				<input type="hidden" name="PILLCODE" value="${pillList.POLLCODE}">
				<input type="text" name="PILLNAME" value="${pillList.PILLNAME}">
				<input type="text" name="COMPANY" value="${pillList.COMPANY}">
				<input type="number" name="PRICE" value="${pillList.PRICE}">
				<input type="submit" value="수정">
				<button type="button" onclick="location.href='/pill/getListPill'">취소</button>
				</form>
			</c:when>
			<c:otherwise> 
				${pillList.PILLCODE}
				<a href="/pill/readPill?pillCode=${pillList.PILLCODE}">${pillList.PILLNAME}</a>
				${pillList.COMPANY}	
				${pillList.PRICE}	
				<button type="button" onclick="location.href='/pill/getListPill?pillCodeEdit=${pillList.PILLCODE}'"> 수정 </button>
				<button type="button" onclick="location.href='/pill/deletePill?pillCode=${pillList.PILLCODE}'"> 삭제 </button>
				<br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<!-- 		입력 -->
		<br>
		NAME / COMPANY / PRICE
		<form action="/pill/writePill" method="post">
		<input type="text" name="PILLNAME">
		<input type="text" name="COMPANY">
		<input type="number" name="PRICE">
		<input type="submit" value="등록">
	</form>

</body>
</html>