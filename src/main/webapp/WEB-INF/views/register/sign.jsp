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

</head>
<body> 

<!-- RSA 암호화 파라미터 -->
<form name="form_chk" id="form_chk" method="post">
	<input type="hidden" id="RSAModulus" name="RSAModulus" value="${publicKeyModulus}" />
	<input type="hidden" id="RSAExponent" name="RSAExponent" value="${publicKeyExponent}" />
</form>
  
<form id="REGISTER_FORM">
<%-- 코드선택. --%>
CODE: <input type="text" name="ECODE" id="ECODE" required="required"> <br>
<%-- 비밀번호. autocomplete="off" 로 자동완성 끄기. --%>
PW: <input type="password" name="EPW" id="EPW" required="required" autocomplete="off"> <br>
<%-- 비밀번호 확인. autocomplete="off" 로 자동완성 끄기. --%>
재입력: <input type="password" id="EPW2" required="required" autocomplete="off"> <br>
<%-- SIGN --%>
<input type="submit" value="SIGN">
</form>

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
		window.open("/register/getEmployeeCode","getEmployeeCode","width=400,height=500")
	});
	
	$("#REGISTER_FORM").submit(function(event){
		event.preventDefault();
		
		if($("#EPW").val() === $("#EPW2").val()){
			
			$.ajax({
				url:'/register/sign',
				type:'post',
// 				dataType:'json',
				data:{
					ECODE : $("#ECODE").val(),
					<%-- 암호화한 패스워드 넘김 --%>
					PW : encryptRSA($('#EPW').val())},
				success: function(data){
					<%-- ajax 비동기방식이므로 성공시 경로 지정 필요함 --%>
					alert("sign.");
					location.replace("/register/login");
				},
				error : function( jqXHR, textStatus, errorThrown ) {
					alert( jqXHR.status ); // 200
					alert( jqXHR.statusText ); // parsererror
					alert( jqXHR.responseText );
					alert( jqXHR.readyState ); // 4
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