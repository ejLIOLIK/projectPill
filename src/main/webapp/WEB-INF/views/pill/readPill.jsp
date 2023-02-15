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

CODE: <%=pillCode %><br>
NAME: <%=pillName %><br>
COMPANY: <%=company %><br>
PRICE: <%=price %><br>

<a href="/pill/editPill?pillCode=<%=pillCode%>"> 수정 </a><br>
<a href="/pill/deletePill?pillCode=<%=pillCode%>"> 삭제 </a><br>
<a href="/pill/getListPill"> 조회 </a>

</body>
</html>