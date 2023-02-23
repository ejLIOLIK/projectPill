<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

STATE: ${read.STATE} <br> 
NAME: ${read.CNAME} <br> 
EMPLOYEE: ${read.EMPLOYEE_NAME} <br> 
STATE: (${read.ADRESS_NUMBER}) 
 ${read.ADRESS_DORO} ${read.ADRESS_DETAIL} <br> 
 ${read.ADRESS_JIBEON} <br> 
 ${read.ADRESS_MEMO} <br> 
<input type="hidden" id="MAP_NAME" value="${read.CNAME}">
<input type="hidden" id="MAP_ADRESS" value="${read.ADRESS_DORO}">
<div id="MAP" style="width:350px;height:350px;"></div>
TEL: ${read.TEL} <br> 
MEMO: ${read.MEMO} <br> 
BALANCE: ${read.BALANCE} <br> 

<a href="/customer/editCustomer?customerCode=${read.CCODE}"> 수정 </a><br>
<a href="/customer/deleteCustomer?customerCode=${read.CCODE}"> 삭제 </a><br>
<a href="/customer/getListCustomer"> 조회 </a>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bfea434b034f9af2b5fce2524e795ea&libraries=services"></script>
<script>
var mapContainer = document.getElementById('MAP'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var mapAdress = document.querySelector('#MAP_ADRESS').value;
var mapName = document.querySelector('#MAP_NAME').value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(mapAdress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+mapName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>