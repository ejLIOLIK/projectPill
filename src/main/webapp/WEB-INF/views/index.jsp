<%-- 템플릿 라이센스 --%>
<%-- Hyperspace by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
	<body class="is-preload">

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
							<li><a href="#intro">Pill Project</a></li>
							<li><a href="#one">시작하기</a></li>
							<li><a href="#two">기능 안내</a></li>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
				<!-- Main -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>Pill Project</h1>
							<p>의약품 유통 관리업무를 위한 웹페이지, Pill Project입니다. <br />
							개발 정보 <a href="https://phase-catboat-489.notion.site/projectPill-37e959384367410692705a6350c33548" target="_blank">더 알아보기</a>.</p>
							<ul class="actions">
								<li><a href="#one" class="button scrolly">시작하기</a></li>
							</ul>
						</div>
					</section>

				<!-- One -->
				<!-- Login / Register -->
					<section id="one" class="wrapper style2 spotlights">
						<section>
							<a href="#" class="image"><img src="/resources/images/pic01.jpg" alt="" data-position="center center" /></a>
							<div class="content">
								<div class="inner">
									<h2>HOME</h2>
									<p>로그인 없이 시작합니다</p>
									<ul class="actions">
										<li><a href="/home" class="button">홈으로</a></li>
									</ul>
								</div>
							</div>
						</section>
						<section>
							<a href="#" class="image"><img src="/resources/images/pic02.jpg" alt="" data-position="top center" /></a>
							<div class="content">
								<div class="inner">
									<h2>LOGIN</h2>
									<p>이미 계정이 있다면 로그인하세요</p>
									<ul class="actions">
										<li><a href="/register/login" class="button">로그인</a></li>
									</ul>
								</div>
							</div>
						</section>
						<section>
							<a href="#" class="image"><img src="/resources/images/pic03.jpg" alt="" data-position="25% 25%" /></a>
							<div class="content">
								<div class="inner">
									<h2>REGISTER</h2>
									<p>신규 직원이라면 등록하세요<br>직원정보가 조회되지 않는다면 관리자에게 문의하세요.</p>
									<ul class="actions">
										<li><a href="/register/sign" class="button">등록</a></li>
									</ul>
								</div>
							</div>
						</section>
					</section>

				<!-- Two -->
				<!-- How to Use -->
					<section id="two" class="wrapper style3 fade-up">
						<div class="inner">
							<h2>기능 안내</h2>
							<p>Pill Project는 <br/>약품, 제품, 직원, 거래처, 매입 매출, 업무 체크리스트, 약품 폐기 내역 등 의약품 유통에 필요한 다양한 정보를 입력하고 관리할 수 있습니다</p>
							<div class="features">
								<section>
									<span class="icon solid major fa-code"></span>
									<h3>약품, 제품, 직원, 거래처, 매입매출 CRUD</h3>
									<p>필요에 따라 다른 형태의 게시판,<br>한 번의 데이터 수정으로 연동된 데이터들이 함께 수정됩니다.</p>
								</section>
								<section>
									<span class="icon solid major fa-lock"></span>
									<h3>RSA / HASH</h3>
									<p>직원 등록, 로그인 시 RSA / HASH 보안기능을 사용합니다.</p>
								</section>
								<section>
									<span class="icon solid major fa-cog"></span>
									<h3>공공API 데이터 검색</h3>
									<p>공공데이터 포탈이 제공하는 약국 데이터를 가져올 수 있습니다.</p>
								</section>
								<section>
									<span class="icon solid major fa-desktop"></span>
									<h3>지도 정보 제공</h3>
									<p>카카도 지도 API를 이용해 시각적인 위치 정보를 제공합니다. <br>
									다음 주소 검색 API를 이용해 보다 정확한 거래처 주소 정보를 확인할 수 있습니다. </p>
								</section>
								<section>
									<span class="icon solid major fa-link"></span>
									<h3>접근 제어</h3>
									<p>로그인 없이 이용권한이 없는 데이터에 접근할 때,
									해당 페이지 접근이 거부되고<br>
									자동으로 로그인 창으로 이동됩니다.</p>
								</section>
								<section>
									<span class="icon major fa-gem"></span>
									<h3>CSRF 보안</h3>
									<p>스프링 시큐리티를 이용,<br>페이지 이동시 CSRF 공격을 방어합니다.</p>
								</section>
							</div>
							<ul class="actions">
								<li><a href="https://phase-catboat-489.notion.site/projectPill-37e959384367410692705a6350c33548" target="_blank" class="button">Learn more</a></li>
								<%-- 링크 수정 예정 --%>
							</ul>
						</div>
					</section>

	<%@include file = "BottomFooter.jsp" %>
	
</body>
</html>