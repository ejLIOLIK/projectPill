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
			
					<div class="split style1">
						<section>
							<form id="REGISTER_FORM">
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
									<%-- 비밀번호 확인. autocomplete="off" 로 자동완성 끄기. --%>
									<label for="message">비밀번호 재확인</label>
									<input type="password" id="EPW2" required="required" autocomplete="off">
								</div>
								<div class="field">
									<%-- SIGN --%>
									<input type="submit" class="button primary" value="SIGN">
								</div>
							</div>
							</form>
						</section>
						<section>
							<ul class="contact">
								<li>
								<h3>※ 직원코드가 없는 경우</h3>
								<span>사내 인사담당자에게 문의하세요</span>
								</li>
							</ul>
						</section>
					</div>

	<%@include file = "../BottomFooter.jsp" %>

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
	
	$("#REGISTER_FORM").submit(function(event){
		event.preventDefault();
		
		if($("#EPW").val() === $("#EPW2").val()){
			
			$.ajax({
				url:'/register/sign',
				type:'post',
				dataType : 'json',
				data:{
					ECODE : $("#ECODE").val(),
					<%-- 암호화한 패스워드 넘김 --%>
					PW : encryptRSA($('#EPW').val())},
				success: function(data){
					<%-- ajax 비동기방식이므로 성공시 경로 지정 필요함 --%>
					var message = data.message;
					alert(message);
					
					location.replace("/register/login");
				},
				error : function( jqXHR, textStatus, errorThrown ) {
					alert( jqXHR.status ); 
					alert( jqXHR.statusText ); 
					alert( jqXHR.responseText );
					alert( jqXHR.readyState ); 
				}
			});
		}
		else{
			alert("sign Fail. PW error.");
		}
	});
});
</script>
</body>
</html>