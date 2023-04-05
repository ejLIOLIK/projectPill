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
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" id="RSAModulus" name="RSAModulus" value="${publicKeyModulus}" />
	<input type="hidden" id="RSAExponent" name="RSAExponent" value="${publicKeyExponent}" />
</form>

					<div class="split style1">
						<section>
							<form id="LOGIN_FORM" action="/loginAction" method="post">
							<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
								<button class="button primary" id="loginButton">LOGIN</button>
								</div>
							</div>
							</form>
						</section>
						<section>
							<ul class="contact">
								<li>
								<div id="deniedMsg" style="display:none;"> 								
								<h3> 로그인 후 이용하세요 </h3> 
								</div>
								</li>
							</ul>
						</section>
					</div>

	<%@include file = "../BottomFooter.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var denied = "${denied}";
	
	if(denied == "true"){
		$('#deniedMsg').css("display","block");
	}
	
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
	
	$("#loginButton").on("click", function(event){
		event.preventDefault();
		<%-- 암호화한 패스워드 넘김 --%>
		$('#EPW').val(encryptRSA($('#EPW').val()));
		
		//ECODE만 먼저 post로 컨트롤러에 한 번 넘겨줌
		$.ajax({
			url:'/register/login',
			type:'post',
			data:{
				ECODE : $("#ECODE").val(),
				"${_csrf.parameterName}" : "${_csrf.token}"
			},
			success: function(){
				$("#LOGIN_FORM").submit();
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
</body>
</html>