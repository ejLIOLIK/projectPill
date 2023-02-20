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
	<form action="/customer/writeCustomer" method="post">
		<select name="STATE"> 
			<option value="매입">매입</option>
			<option value="매출">매출</option>
		</select>
		<input type="text" name="CNAME">
		<select name="EMPLOYEE">
			<option value=""></option>
			<c:forEach var="employeeList" items="${list}"> 
				<option value="${employeeList.ENAME}">${employeeList.ENAME} ${employeeList.ERANK}</option>
			</c:forEach>
		</select>
		
		<br>
		ADRESS
		<br>
<!-- 		 API-->
<!-- 		<input type="text" id="ID_ADRESS" name="ADRESS" placeholder="주소"> -->
<!-- 		<input type="text" id="ID_ADRESS_DETAIL" name="ADRESS_DETAIL" placeholder="상세주소">		 -->
<!-- 		 API-->
		<input type="text" name="ADRESS_NUMBER" id="idPostCode" placeholder="우편번호">
		<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="ADRESS_DORO" id="idRoadAddress" placeholder="도로명주소">
		<input type="text" name="ADRESS_JIBEON" id="idJibeonAdress" placeholder="지번주소">
		<span id="guide" style="color:#999; display:none"></span>
		<input type="text" name="ADRESS_DETAIL" id="idDetailAddress" placeholder="상세주소">
		<input type="text" name="ADRESS_MEMO" id="idExtraAddress" placeholder="참고항목">
		<div id="idMap" style="width:300px;height:300px;margin-top:10px;display:none"></div>

		<br>
		TEL / MEMO / BALANCE
		<br>

		<input type="text" name="TEL">
		<input type="text" name="MEMO">
		<input type="number" name="BALANCE" value="0">
		<input type="submit" value="등록">
	</form>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bfea434b034f9af2b5fce2524e795ea&libraries=services"></script>
<script>

	var mapContainer = document.getElementById('idMap'), // 지도를 표시할 div
	mapOption = {
	    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	position: new daum.maps.LatLng(37.537187, 127.005476),
	map: map
	});

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('idPostCode').value = data.zonecode;
                document.getElementById("idRoadAddress").value = roadAddr;
                document.getElementById("idJibeonAdress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("idExtraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("idExtraAddress").value = '';
                }
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
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
                
             	// 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
                
            }
        }).open();
    }
</script>

</html>