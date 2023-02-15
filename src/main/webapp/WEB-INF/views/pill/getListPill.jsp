<%@page import="com.liolik.project.dto.PillDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

CODE / NAME / COMPANY / PRICE <br>
<%
	String pillCodeEdit = (String)request.getAttribute("pillCodeEdit");
	Object o = request.getAttribute("list");
	List<PillDto> list = (List<PillDto>)o; 
	for(int i=0;i<list.size();i++){
		
		String pillCode = list.get(i).getPILLCODE();
		String pillName = list.get(i).getPILLNAME();
		String company = list.get(i).getCOMPANY();
		int price = list.get(i).getPRICE();

		// 수정 ////
		if(pillCode.equals(pillCodeEdit)){
%>
			<form action="/pill/editPill" method="post">
			<%=pillCode%>
			<input type="hidden" name="PILLCODE" value="<%=pillCode %>">
			<input type="text" name="PILLNAME" value="<%=pillName %>">
			<input type="text" name="COMPANY" value="<%=company %>">
			<input type="number" name="PRICE" value="<%=price %>">
			<input type="submit" value="수정">
			<button type="button" onclick="location.href='/pill/getListPill'">취소</button>
		</form>
<%
		}
		else{ 	// 일반출력 ////
%>		
		<%=pillCode %>	
		<a href="/pill/readPill?pillCode=<%=pillCode %>"><%=pillName %></a>
		<%=company %>	
		<%=price %>	
		<button type="button" onclick="location.href='/pill/getListPill?pillCodeEdit=<%=pillCode%>'">수정</button>
		<button type="button" onclick="location.href='/pill/deletePill?pillCode=<%=pillCode%>'">삭제</button>
		<br>
<%		}
	}
		// 입력 ////
%>
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