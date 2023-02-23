<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	STATE / NAME / EMPLOYEE ADRESS
	<form action="/customer/editCustomer" method="post">
		<input type="hidden" name="CCODE" value="${read.CCODE}">

		<select name="STATE"> 
			<option value="${read.STATE}" selected="selected">${read.STATE}</option>
				<c:choose> <%-- select창 --%>
				<c:when test="${read.STATE eq '매입'}"> <option value="매출">매출</option> </c:when> 
				<c:when test="${read.STATE eq '매출'}"> <option value="매입">매입</option> </c:when>
				</c:choose>
		</select>
		<input type="text" name="CNAME" value="${read.CNAME}">
		
		<select name="EMPLOYEE_NAME" id="EMPLOYEE_NAME"> <%-- 영업담당자 select창을 위해 Employee를 get --%> 
		<%-- selected 먼저 출력하고 나머지 조건문으로 출력 --%>
			<option value="${read.EMPLOYEE_NAME}" selected="selected">${read.EMPLOYEE_CODE} ${read.EMPLOYEE_NAME} ${read.EMPLOYEE_RANK}</option>
			<c:forEach var="employeeList" items="${list}"> 
				<c:if test="${read.EMPLOYEE_CODE ne employeeList.ECODE}"> 
					<option value="${employeeList.ENAME}">${employeeList.ECODE} ${employeeList.ENAME} ${employeeList.ERANK}</option>
				</c:if>
			</c:forEach>
		</select>
		
		<%-- 제이쿼리에서 데이터 전송 처리 --%>
		<input type="hidden" name="EMPLOYEE_CODE" value ="">
		<input type="hidden" name="EMPLOYEE_RANK" valse ="">
		
		<br>
		ADRESS
		<br>
		<input type="text" name="ADRESS_NUMBER" id="idPostCode" placeholder="우편번호" value="${read.ADRESS_NUMBER}">
		<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="ADRESS_DORO" id="idRoadAddress" placeholder="도로명주소" value="${read.ADRESS_DORO}">
		<input type="text" name="ADRESS_JIBEON" id="idJibeonAdress" placeholder="지번주소" value="${read.ADRESS_JIBEON}">
		<span id="guide" style="color:#999; display:none"></span>
		<input type="text" name="ADRESS_DETAIL" id="idDetailAddress" placeholder="상세주소" value="${read.ADRESS_DETAIL}">
		<input type="text" name="ADRESS_MEMO" id="idExtraAddress" placeholder="참고항목" value="${read.ADRESS_MEMO}">
		<div id="MAP" style="width:300px;height:300px;margin-top:10px; display:none"></div>

		<br>
		TEL / MEMO / BALANCE
		<br>

		<input type="text" name="TEL" value="${read.TEL}">
		<input type="text" name="MEMO" value="${read.MEMO}">
		<input type="number" name="BALANCE"  value="${read.BALANCE}">
		<input type="submit" value="수정">
	</form>

	<%-- 카카오 주소검색 API --%>
	<%-- 자바스크립트는 출력 속도를 위해 jsp 하단에 위치 시킴. --%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bfea434b034f9af2b5fce2524e795ea&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script>
		
    $(document).ready(function(){
    	
    	var data = $("#EMPLOYEE_NAME option:checked").text(); <%-- ex)1 홍길동 사원 --%>
    	var dataSplit = data.split(" "); <%-- 공백 잘라서 각각 input --%>
    	
    	$('input[name=EMPLOYEE_CODE]').attr('value',dataSplit[0]);
 	  	$('input[name=EMPLOYEE_RANK]').attr('value',dataSplit[2]);
    	
    });
    
    $("select[id=EMPLOYEE_NAME]").change(function(){
    	
    	var data = $("select[id=EMPLOYEE_NAME] option:selected").text(); <%-- ex)1 홍길동 사원 --%>
    	var dataSplit = data.split(" "); <%-- 공백 잘라서 각각 input --%>
 	  	
 	  	$('input[name=EMPLOYEE_CODE]').attr('value',dataSplit[0]);
 	  	$('input[name=EMPLOYEE_RANK]').attr('value',dataSplit[2]);
    });
	
		var mapContainer = document.getElementById('MAP'), <%-- 지도 표시 DIV --%>
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
		
		<%-- 기존 지도 출력 --%>
		<%-- 주소, 이름 --%>
		var mapAdress = document.querySelector('#idRoadAddress').value;
	
		<%-- 주소 정보 검색 --%>
		geocoder.addressSearch(mapAdress, function(results, status) {
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

	</script>

</body>
</html>