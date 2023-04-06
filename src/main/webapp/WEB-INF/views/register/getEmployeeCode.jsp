<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
<section id="main" class="wrapper">
<div class="inner">

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/register/getEmployeeCode">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>
	
	<div style="text-align: right"><form action="/register/getEmployeeCode" method="get">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="text" width="50px" name="employeeName"><br>
		<input type="submit" name="searchSubmit" class="button small" value="검색">
	</form></div>

<ul class="alt">
<c:forEach var="EmployeeList" items="${list}" begin="${page.begin}" end="${page.end}">
	<li>
	<%-- ID 대신 CLASS 사용 --%>
	${EmployeeList.ECODE } <a href="#" class="REGISTER" data-ecode="${EmployeeList.ECODE}"> ${EmployeeList.ENAME } </a> ${EmployeeList.ERANK }
	</li>
	</c:forEach>
</ul>

	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/register/getEmployeeCode?employeeName=${employeeName}&curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>
	
</div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".REGISTER").click(function(event){
		$(opener.document).find("#ECODE").val($(this).data("ecode"));
		$(opener.document).find("#EPW").focus();
		window.close();
	});

	<%-- 포커싱이 유지되는 경우 팝업창 브라우저를 닫았을 경우 계속해서 팝업이 발생함. 이에 대한 처리. --%>
	$(window).on("beforeunload", function() { 
		$(opener.document).find("#EPW").focus();
	});
});

</script>
<%-- 템플릿 assets --%>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</body>
</html>