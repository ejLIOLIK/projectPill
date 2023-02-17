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

CODE: ${read.PILLCODE}<br>
NAME: ${read.PILLNAME}<br>
COMPANY: ${read.COMPANY}<br>
PRICE: ${read.PRICE}<br>

<a href="/pill/editPill?pillCode=${read.PILLCODE}"> 수정 </a><br>
<a href="/pill/deletePill?pillCode=${read.PILLCODE}"> 삭제 </a><br>
<a href="/pill/getListPill"> 조회 </a>

</body>
</html>