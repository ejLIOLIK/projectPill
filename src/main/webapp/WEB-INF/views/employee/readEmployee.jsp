<%@ page import="com.liolik.project.dto.EmployeeDto" %>
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

CODE: ${read.ECODE} <br> 
NAME: ${read.ENAME} <br> 
RANK: ${read.ERANK} <br> 
TEAM: ${read.ETEAM} <br> 

<c:if test="${read.ETEAM eq '영업팀'}">
<br>
<c:forEach var="customerList" items="${list}">
${customerList.STATE}
${customerList.CCODE}
${customerList.CNAME}
${customerList.TEL}
(${customerList.ADRESS_NUMBER})
${customerList.ADRESS_DORO}
${customerList.BALANCE}
${customerList.MEMO} <br>
</c:forEach>
</c:if>

<a href="/employee/editEmployee?employeeCode=${read.ECODE}"> 수정 </a><br>
<a href="/employee/deleteEmployee?employeeCode=${read.ECODE}"> 삭제 </a><br>
<a href="/employee/getListEmployee"> 조회 </a>

</body>
</html>