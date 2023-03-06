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
	
<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
				
				<%-- 페이지 정보 날리기 --%>
				<form id="pageInfo" method="get" action="/customer/getListCustomer">
				  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
				  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
				</form>
				
<a href="/customer/setListCustomder">데이터 불러오기</a><br><br>
				<h1 class="major">A Generic Page</h1>
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>CODE</th>
								<th>STATE</th>
								<th>NAME</th>
								<th>EMPLOYEE</th>
								<th>ADRESS</th>
								<th>TEL</th>
								<th>MEMO</th>
								<th>VALANCE</th>
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
	
				<%-- 페이징 --%>
				<div style="text-align:center">
				<c:choose>
					<c:when test="${page.blBeforeBlock}">
						<button type="button" id="buttonbefore" class="button primary small" >이전</button>
					</c:when>
					<c:otherwise> <button type="button" class="button primary small" disabled>이전</button>	</c:otherwise>
				</c:choose>
				<c:forEach var="pagenum" begin="${page.beginBlock}" end="${page.endBlock}">
					<c:choose>
				    	<c:when test="${pagenum eq page.curPage}">
				   		${pagenum}
				    	</c:when>
				    	<c:otherwise>
						 <span><a href="/customer/getListCustomer?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a></span>
				  		</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page.blAfterBlock}">
						<button type="button" id="buttonAfter" class="button primary small" >다음</button>
					</c:when>
					<c:otherwise> <button type="button" class="button primary small" disabled>다음</button>	</c:otherwise>
				</c:choose>
				<br>
				</div>
	
			</div>
		</section>
	</div>

<!-- Footer -->
	<footer id="footer" class="wrapper alt">
		<div class="inner">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>
	
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
	$("#buttonWrite").on("click",function(){
		location.replace("/customer/writeCustomer");
	});
});
</script>
</body>
</html>