<%@ page import="com.liolik.project.dto.EmployeeDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

CODE: ${read.ECODE} <br> 
NAME: ${read.ENAME} <br> 
RANK: ${read.ERANK} <br> 
TEAM: ${read.ETEAM} <br> 

<a href="/employee/editEmployee?employeeCode=${read.ECODE}"> 수정 </a><br>
<a href="/employee/deleteEmployee?employeeCode=${read.ECODE}"> 삭제 </a><br>
<a href="/employee/getListEmployee"> 조회 </a>

</body>
</html>