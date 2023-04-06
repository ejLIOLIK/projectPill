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

<ul>
<li>분류: ${read.STATE}</li>
<li>상호명: ${read.CNAME}</li>
<li>담당: ${read.EMPLOYEE_NAME}</li>
<li>주소: (${read.ADRESS_NUMBER}) 
 ${read.ADRESS_DORO} ${read.ADRESS_DETAIL} <br> 
 ${read.ADRESS_JIBEON} <br> 
 ${read.ADRESS_MEMO} <br> 
<input type="hidden" id="MAP_NAME" value="${read.CNAME}">
<input type="hidden" id="MAP_ADRESS" value="${read.ADRESS_DORO}">
<div id="MAP" style="width:350px;height:350px;"></div> </li>
<li>연락처: ${read.TEL}</li> 
<li>메모: ${read.MEMO}</li>
<li>대금: ${read.BALANCE}</li> 
</ul>

<div style="text-align:right">
	<button class="button primary" id="buttonEdit">수정</button>
	<button class="button primary" id="buttonDelete">삭제</button> 
	<button class="button primary" id="buttonList">목록</button>
</div>

	<%@include file = "../BottomFooter.jsp" %>

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;color:purple;">'+mapName+'</div>'
        });
        infowindow.open(map, marker);

        <%-- 지도 중심 이동 --%>
        map.setCenter(coords);
    } 
});    
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#buttonEdit").on("click",function(){
		location.replace("/customer/editCustomer?customerCode=${read.CCODE}");
	});
	$("#buttonDelete").on("click",function(){
		location.replace("/customer/deleteCustomer?customerCode=${read.CCODE}");
	});
	$("#buttonList").on("click",function(){
		location.replace("/customer/getListCustomer");
	});
});
</script>
</body>
</html>