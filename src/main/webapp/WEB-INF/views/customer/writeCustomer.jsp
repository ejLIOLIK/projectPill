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
	
	<button id="getCustomerAPI" class="button primary small">약국정보 가져오기</button>
	<br>
	<br>
	
	<div class="split style1">
		<section>
			<form action="/customer/writeCustomer" method="post">
			<div class="fields">
				<div class="field">
					<label for="message">STATE</label>
					<select name="STATE"> 
						<option value="매입">매입</option>
						<option value="매출">매출</option>
					</select>
				</div>
				<div class="field">
					<label for="message">NAME</label>
					<input type="text" name="CNAME" id="CNAME">
				</div>
				<div class="field">
					<label for="message">EMPLOYEE</label>
					<select name="EMPLOYEE_NAME" id="EMPLOYEE_NAME" required="required"><%-- 영업담당자 select창을 위해 Employee를 get --%> 
						<option selected="selected" value="" >영업담당자</option>
						<c:forEach var="employeeList" items="${list}"> 
							<option value="${employeeList.ENAME}">${employeeList.ECODE} ${employeeList.ENAME} ${employeeList.ERANK}</option>
						</c:forEach>
					</select>
					<%-- 제이쿼리에서 데이터 전송 처리 --%>
					<input type="hidden" name="EMPLOYEE_CODE" value ="">
					<input type="hidden" name="EMPLOYEE_RANK" valse ="">
				</div>
				<div class="field">
					<label for="message">ADRESS</label>
					<input type="text" name="ADRESS_NUMBER" id="idPostCode" placeholder="우편번호">
					<div style="text-align:right"><input type="button" class="button primary small" onclick="DaumPostcode()" value="우편번호 찾기"></div>
					<input type="text" name="ADRESS_DORO" id="idRoadAddress" placeholder="도로명주소">
					<input type="text" name="ADRESS_JIBEON" id="idJibeonAdress" placeholder="지번주소">
					<span id="guide" style="color:#999; display:none"></span>
					<input type="text" name="ADRESS_DETAIL" id="idDetailAddress" placeholder="상세주소">
					<input type="text" name="ADRESS_MEMO" id="idExtraAddress" placeholder="참고항목">
					<div id="idMap" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				</div>
				<div class="field">
					<label for="message">TEL</label>
					<input type="text" name="TEL" id="TEL">
				</div>
				<div class="field">
					<label for="message">MEMO</label>
					<input type="text" name="MEMO" id="MEMO">
				</div>
				<div class="field">
					<label for="message">BALANCE</label>
					<input type="text" pattern="[0-9]+" name="BALANCE" value="0">
				</div>
				<div class="field">
					<div style="text-align:right"><input type="submit" class="button primary" value="등록"></div>
				</div>
			</div>
			</form>
		</section>
		<section>
			<ul class="contact">
				<li>
				<h3>※ 주의</h3>
				<span>거래처 등록 시 영업담당자 문의 필<br></span>
				</li>
			</ul>
		</section>
		
	</div>
	
	<%@include file = "../BottomFooter.jsp" %>
	
	<%-- 카카오 주소검색 API --%>
	<%-- 자바스크립트는 출력 속도를 위해 jsp 하단에 위치 시킴. --%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bfea434b034f9af2b5fce2524e795ea&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script>
	
	$(document).ready(function() {
	
	  	$('#getCustomerAPI').click(function() {
			window.open("/customer/getCustomerApiData","getCustomerApiData","width=400,height=550")
		});
	
    	$("select[id=EMPLOYEE_NAME]").change(function(){
    	
    	var data = $("select[id=EMPLOYEE_NAME] option:selected").text(); <%-- ex)1 홍길동 사원 --%>
    	var dataSplit = data.split(" "); <%-- 공백 잘라서 각각 input --%>
 	  	
 	  	$('input[name=EMPLOYEE_CODE]').attr('value',dataSplit[0]);
 	  	$('input[name=EMPLOYEE_RANK]').attr('value',dataSplit[2]);
    	});
	
		var mapContainer = document.getElementById('idMap'), <%-- 지도 표시 DIV --%>
		mapOption = {
		    center: new daum.maps.LatLng(37.537187, 127.005476), <%-- 지도 좌표 --%>
		    level: 5 <%-- 지도 확대 레벨 --%>
		};
		<%-- 지도 객체 --%>
		var map = new daum.maps.Map(mapContainer, mapOption);
		<%-- 주소, 좌표 변환 객체 --%>
		var geocoder = new daum.maps.services.Geocoder();
		<%-- 마커 객체 --%>
		var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
		});
	
	    function DaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	<%-- 팝업 시 검색결과 --%>
	
	                var roadAddr = data.roadAddress; <%-- 도로명주소 --%>
	                var extraRoadAddr = ''; <%-- 참고항목 --%>
	
	                <%-- 법정동명 있는 경우에만 --%>
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                <%-- 건물명, 공동주택 있는 경우에만 --%>
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                <%-- 참고항목 + 괄호 --%>
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                <%-- 필드에 입력 --%>
	                document.getElementById('idPostCode').value = data.zonecode;
	                document.getElementById("idRoadAddress").value = roadAddr;
	                document.getElementById("idJibeonAdress").value = data.jibunAddress;
	                
	                if(roadAddr !== ''){
	                    document.getElementById("idExtraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("idExtraAddress").value = '';
	                }
	                
	                var guideTextBox = document.getElementById("guide");
	                
	                <%-- 사용자가 사용안함 선택 시 예상 주소 출력 --%>
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	                
	                <%-- 상세 정보 검색 --%>
	                geocoder.addressSearch(data.address, function(results, status) {
	                	<%-- 정상처리 --%>
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; <%-- 첫번째 결과 값 --%>
	
	                        <%-- 좌표 받아서 --%>
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        <%-- 지도 출력 --%>
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        <%-- 지도 중심 이동 --%>
	                        map.setCenter(coords);
	                        <%-- 마커 위치 --%>
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	});
	</script>

</body>
</html>