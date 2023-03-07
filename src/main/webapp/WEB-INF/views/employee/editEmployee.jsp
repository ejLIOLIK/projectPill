<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<div class="split style1">
	<section>
		<form action="/employee/editEmployee" method="post">
		<div class="fields">
			<input type="hidden" name="ECODE" value="${read.ECODE}">
			<div class="field">
				<label for="message">NAME</label>
				<input type="text" name="ENAME" value="${read.ENAME}">
			</div>
			<div class="field">
				<label for="message">RANK</label>
				<select name="ERANK" id="ERANK">
					<option value="사원">사원</option>
					<option value="대리">대리</option>
					<option value="과장">과장</option>
					<option value="이사">이사</option>
				</select>
			</div>
			<div class="field">
				<label for="message">TEAM</label>
				<select name="ETEAM" id="ETEAM"> 
					<option value="영업팀">영업팀</option>
					<option value="관리팀">관리팀</option>
					<option value="회계팀">회계팀</option>
				</select>
			</div>
			<div class="field">
				<input type="submit" class="button primary" value="수정">
			</div>
		</div>
		</form>
	</section>
	<section>
		<ul class="contact">
			<li>
			<h3>※ 주의</h3>
			<span>인가되지 않은<br>직원 정보를<br>수정하지 마세요.</span>
			</li>
		</ul>
	</section>
	</div>
	
	<%@include file = "../BottomFooter.jsp" %>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#ETEAM option[value="${read.ETEAM}"]').prop('selected', true);
	$('#ERANK option[value="${read.ERANK}"]').prop('selected', true);
});
</script>
</body>
</html>