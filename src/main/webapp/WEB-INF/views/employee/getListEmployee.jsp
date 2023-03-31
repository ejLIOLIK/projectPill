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
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

				<%-- 페이지 정보 날리기 --%>
				<form id="pageInfo" method="get" action="/customer/getListCustomer">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
				  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
				</form>
				
					<h1 class="major">직원 목록</h1>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>CODE</th>
									<th>NAME</th>
									<th>COMPANY</th>
									<th>PRICE</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="employeeList" items="${list}" begin="${page.begin}" end="${page.end}"> 
								<tr>
									<td>${employeeList.ECODE}</td>
									<td><a href="/employee/readEmployee?employeeCode=${employeeList.ECODE}">${employeeList.ENAME} </a></td>
									<td>${employeeList.ERANK}</td>
									<td>${employeeList.ETEAM}</td>
								</tr>
							</c:forEach>
							</tbody>
							<tfoot>
								<td colspan="3"></td>
								<td><div style="text-align:right"><button id="buttonWrite">등록</button></div></td>
							</tfoot>
						</table>
					</div>
	
	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/employee/getListEmployee?curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>

	<%@include file = "../BottomFooter.jsp" %>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#buttonWrite").on("click",function(){
		location.replace("/employee/writeEmployee");
	});
});
</script>

</body>
</html>