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
				
<!-- 	<a href="/customer/setListCustomer">데이터 불러오기</a><br><br> -->

				<h1 class="major">거래처 목록</h1>
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th style="width: 30px;">코드</th>
								<th>분류</th>
								<th>상호명</th>
								<th>담당</th>
								<th style="width: 300px;">주소</th>
								<th>연락처</th>
								<th style="width: 200px;">메모</th>
								<th style="width: 120px;">대금</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="customerList" items="${list}" begin="${page.begin}" end="${page.end}"> 
							<tr>
								<td>${customerList.CCODE}</td>
								<td>${customerList.STATE}</td>
								<td><a href = "/customer/readCustomer?customerCode=${customerList.CCODE}">${customerList.CNAME} </a></td>
								<td><a href="/employee/readEmployee?employeeCode=${customerList.EMPLOYEE_CODE}">${customerList.EMPLOYEE_NAME} </a></td>
								<td>(${customerList.ADRESS_NUMBER})${customerList.ADRESS_DORO}<br>
								${customerList.ADRESS_DETAIL}</td>
								<td>${customerList.TEL}</td>
								<td>${customerList.MEMO}</td>
								<td>${customerList.BALANCE}</td>
							</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<td colspan="7"></td>
							<td><div style="text-align:right"><button id="buttonWrite">등록</button></div></td>
						</tfoot>
					</table>
				</div>					
	
	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/customer/getListCustomer?curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>
	
	<%@include file = "../BottomFooter.jsp" %>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#buttonWrite").on("click",function(){
		location.replace("/customer/writeCustomer");
	});
});
</script>
</body>
</html>