<%@ page import="com.liolik.project.dto.EmployeeDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/employee/readEmployee">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
  <input type="hidden" name="employeeCode" value="${read.ECODE}" id="curPageBlock">
</form>

CODE: ${read.ECODE} <br> 
NAME: ${read.ENAME} <br> 
RANK: ${read.ERANK} <br> 
TEAM: ${read.ETEAM} <br> 

<c:if test="${read.ETEAM eq '영업팀'}">
<br>

<c:forEach var="customerList" items="${list}" begin="${page.begin}" end="${page.end}">
${customerList.STATE}
${customerList.CCODE}
${customerList.CNAME}
${customerList.TEL}
(${customerList.ADRESS_NUMBER})
${customerList.ADRESS_DORO}
${customerList.BALANCE}
${customerList.MEMO} <br>
</c:forEach>

	<%-- 페이징 --%>
	<div style="text-align:center">
	<c:choose>
		<c:when test="${page.blBeforeBlock}">
			<button type="button" id="buttonbefore" class="button small" >이전</button>
		</c:when>
		<c:otherwise> <button type="button" disabled class="button small" >이전</button>	</c:otherwise>
	</c:choose>
	<c:forEach var="pagenum" begin="${page.beginBlock}" end="${page.endBlock}">
		<c:choose>
	    	<c:when test="${pagenum eq page.curPage}">
	   		${pagenum}
	    	</c:when>
	    	<c:otherwise>
			 <span><a href="/register/getEmployeeCode?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a></span>
	  		</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${page.blAfterBlock}">
			<button type="button" id="buttonAfter" class="button small" >다음</button>
		</c:when>
		<c:otherwise> <button type="button" class="button small" disabled>다음</button>	</c:otherwise>
	</c:choose>
	<br>
	</div>

</c:if>

<a href="/employee/editEmployee?employeeCode=${read.ECODE}"> 수정 </a><br>
<a href="/employee/deleteEmployee?employeeCode=${read.ECODE}"> 삭제 </a><br>
<a href="/employee/getListEmployee"> 조회 </a>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<%-- 페이지 정보 수정해서 form submit --%>
$(document).ready(function() {
	$("#buttonbefore").on("click",function(){
		var curPageBlock = parseInt($('#curPageBlock').val()) - 1;
        $('#curPageBlock').val(curPageBlock);
	    $('#pageInfo').submit();
		console.log("function : buttonbefore");
	});
	$("#buttonAfter").on("click",function(){
		var curPageBlock = parseInt($('#curPageBlock').val()) + 1;
        $('#curPageBlock').val(curPageBlock);
	    $('#pageInfo').submit();
		console.log("function : buttonAfter");
	});
});
</script>

</body>
</html>