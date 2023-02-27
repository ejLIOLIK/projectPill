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
ADRESS: (${read.ADRESS_NUMBER}) 
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
var mapContainer = document.getElementById('MAP'), <%-- 지도 표시 DIV --%>
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), <%-- 지도 좌표 --%>
        level: 4 <%-- 지도 확대 레벨 --%>
    };  
    <%-- 지도 객체 --%>
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	<%-- 주소, 좌표 변환 객체 --%>
	var geocoder = new kakao.maps.services.Geocoder();
	<%-- 주소, 이름 --%>
	var mapAdress = document.querySelector('#MAP_ADRESS').value;
	var mapName = document.querySelector('#MAP_NAME').value;

	<%-- 좌표 검색 --%>
	geocoder.addressSearch(mapAdress, function(result, status) {

	<%-- 정상처리 --%> 
    if (status === kakao.maps.services.Status.OK) {

    	<%-- 좌표 받아서 --%>
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	<%-- 마커 객체 --%>
    	var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
    	
        <%-- 인포윈도우 : 장소 이름 표시함 (거래처명) --%>
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+mapName+'</div>'
        });
        infowindow.open(map, marker);

        <%-- 지도 중심 이동 --%>
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>