<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 순서에 따라 오류가 날 수도 있으니 순서 주의 ( 참고 https://hailey0.tistory.com/44 ) -->
<script type="text/javascript" src="/resources/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/resources/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/resources/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/resources/js/rsa/rng.js"></script>

<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>

</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

<!-- RSA 암호화 파라미터 -->
<form name="form_chk" id="form_chk" method="post">
	<input type="hidden" id="RSAModulus" name="RSAModulus" value="${publicKeyModulus}" />
	<input type="hidden" id="RSAExponent" name="RSAExponent" value="${publicKeyExponent}" />
</form>

<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="split style1">
						<section>
							<form id="LOGIN_FORM">
							<div class="fields">
								<div class="field">
									<%-- 코드선택. --%>
									<label for="message">직원코드</label>
									<input type="text" name="ECODE" id="ECODE" required="required">
								</div>
								<div class="field">
									<%-- 비밀번호. autocomplete="off" 로 자동완성 끄기. --%>
									<label for="message">비밀번호</label>
									<input type="password" name="EPW" id="EPW" required="required" autocomplete="off">
								</div>
								<div class="field">
									<input type="submit" class="button primary" value="LOGIN">
								</div>
							</div>
							</form>
						</section>
						<section>
							<ul class="contact">
								<li>
								<h3>※ 비밀번호를 잊으셨나요?</h3>
								<span><a href="#">미구현</a></span>
								</li>
							</ul>
						</section>
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
$(document).ready(function() {
	
	function encryptRSA(plain) { // RSA 암호화 함수
	    var rsa = new RSAKey() // JS Library
	      , rsaPublicKeyModulus = $("#RSAModulus").val()
	      , rsaPpublicKeyExponent = $("#RSAExponent").val();
	      
	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	    return rsa.encrypt(plain);
	}
	
	$("input[id='ECODE']").on("focusin", function(){
		window.open("/register/getEmployeeCode","getEmployeeCode","width=400,height=550")
	});
	
	$("#LOGIN_FORM").submit(function(event){
		event.preventDefault();
		
			$.ajax({
				url:'/register/login',
				type:'post',
				dataType : 'json',
				data:{
					ECODE : $("#ECODE").val(),
					<%-- 암호화한 패스워드 넘김 --%>
					PW : encryptRSA($('#EPW').val())},
				success: function(data){
					var message = data.message;
					alert(message);
					
					location.replace("/register/loginGate");
				},
				error : function( jqXHR, textStatus, errorThrown ) {
					alert( jqXHR.status );
					alert( jqXHR.statusText );
					alert( jqXHR.responseText );
					alert( jqXHR.readyState );
				}
			});
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