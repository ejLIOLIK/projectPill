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

	<ul>
	<li>CODE: ${read.ECODE} </li> 
	<li>NAME: ${read.ENAME} </li>
	<li>RANK: ${read.ERANK} </li> 
	<li>TEAM: ${read.ETEAM} </li>
	</ul>
	
	<div style="text-align:right">
		<button class="button primary" id="buttonEdit">수정</button>
		<button class="button primary" id="buttonDelete">삭제</button> 
		<button class="button primary" id="buttonList">목록</button>
	</div>
	

	<c:if test="${read.ETEAM eq '영업팀'}">
	
		<br>
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>STATE</th>
						<th>CODE</th>
						<th>NAME</th>
						<th>TEL</th>
						<th>ADRESS</th>
						<th>BALANCE</th>
						<th>MEMO</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="customerList" items="${list}" begin="${page.begin}" end="${page.end}">
					<tr>
						<td>${customerList.STATE}</td>
						<td>${customerList.CCODE}</td>
						<td>${customerList.CNAME}</td>
						<td>${customerList.TEL}</td>
						<td>(${customerList.ADRESS_NUMBER})${customerList.ADRESS_DORO}
						<td>${customerList.BALANCE}</td>
						<td>${customerList.MEMO}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<jsp:include page="../Paging.jsp">
			<jsp:param name="pageUrlParam" value="/employee/readEmployee?curPageBlock=${page.curPageBlock}&employeeCode=${read.ECODE}&curPage="/>
		</jsp:include>

	</c:if>

	<%@include file = "../BottomFooter.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#buttonEdit").on("click",function(){
		location.replace("/employee/editEmployee?employeeCode=${read.ECODE}");
	});
	$("#buttonDelete").on("click",function(){
		location.replace("/employee/deleteEmployee?employeeCode=${read.ECODE}");
	});
	$("#buttonList").on("click",function(){
		location.replace("/employee/getListEmployee");
	});
});
</script>

</body>
</html>