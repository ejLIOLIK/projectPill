<%@page import="com.liolik.project.dto.PillDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	PillDto read = (PillDto)request.getAttribute("pillCode");

	String pillCode = read.getPILLCODE();
	String pillName = read.getPILLNAME();
	String company = read.getCOMPANY();
	int price = read.getPRICE();
	//String img = read.getIMG();
%>	

	CODE / NAME / COMPANY / PRICE
	<form action="/pill/editPill" method="post">
		<%=pillCode%>
		<input type="hidden" name="PILLCODE" value="<%=pillCode %>">
		<input type="text" name="PILLNAME" value="<%=pillName %>">
		<input type="text" name="COMPANY" value="<%=company %>">
		<input type="number" name="PRICE" value="<%=price %>">
		<input type="submit" value="수정">
	</form>
</body>
</html>