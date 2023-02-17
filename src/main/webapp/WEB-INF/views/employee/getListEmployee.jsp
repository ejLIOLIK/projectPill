<%@page import="com.liolik.project.dto.EmployeeDto"%>
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

	<c:forEach var="employeeList" items="${list}"> 
		${employeeList.ECODE}
		<a href="/employee/readEmployee?employeeCode=${employeeList.ECODE}">${employeeList.ENAME} </a>
		${employeeList.ERANK}
		${employeeList.ETEAM}
		<br>
	</c:forEach>
	
	<a href="/employee/writeEmployee"> 등록 </a><br>

</body>
</html>