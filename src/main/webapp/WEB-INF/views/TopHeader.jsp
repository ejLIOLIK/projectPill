<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
</head>
<body>

	<!-- Header -->
	<header id="header">
		<a href="/" class="title">Pill Project</a>

		<nav>
			<ul>
				<li><a href="/pill/getListPill"> 약품조회 </a></li>
				<li><a href="/product/getListProduct"> 제품조회 </a></li>
				<li><a href="/employee/getListEmployee"> 직원조회 </a></li>
				<li><a href="/customer/getListCustomer"> 거래처조회 </a></li>
				<li><a href="/account/account"> 매입매출 </a></li>
				<sec:authorize access="isAnonymous()">
				<li><a href="/register/login"> 로그인 </a></li>
				<li><a href="/register/sign"> 회원가입 </a></li>
				</sec:authorize>
				<sec:authorize access="!isAnonymous()">
				<li><a href="#" id="logout"> 로그아웃 </a></li>
				</sec:authorize>
			</ul>
		</nav>
	</header>
	
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
				
<form id="logoutForm" action="/logoutAction" method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#logout').on("click", function(event){
		event.preventDefault();
		$('#logoutForm').submit();
	});
});
</script>
</body>
</html>