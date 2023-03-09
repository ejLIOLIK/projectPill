<%@ page import="com.liolik.project.module.getApiDateModule" %>
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

<%-- API 파라미터 특성상 시도 입력 없이 시군구 검색할 경우 검색결과가 정확하게 출력되지 않음 --%>
<%-- CSS 시 시군구 검색을 위해서는 시도를 먼저 입력하라는 안내문 입력할 것 --%>

	<form id="searchAPI">
		<input type="text" name="sidoAPI" id="sidoAPI" placeholder="시도"><br>
		<input type="text" name="sigunguAPI" id="sigunguAPI" placeholder="시군구"><br>
		<input type="text" name="nameAPI" id="nameAPI" placeholder="이름"><br>
		<input type="submit" class="button primary small" value="검색"><br>
	</form>
	
	<c:forEach var="Data" items="${list}">
	<a href="#" class="ApiData" data-api='{"CNAME":"${Data.CNAME}","ADRESS_NUMBER":"${Data.ADRESS_NUMBER}","ADRESS_DORO":"${Data.ADRESS_DORO}","ADRESS_DETAIL":"${Data.ADRESS_DETAIL}","ADRESS_MEMO":"${Data.ADRESS_MEMO}","TEL":"${Data.TEL}","MEMO":"${Data.MEMO}"}'> 
<%-- 	<a href="#" class="ApiData" data-api='{"CNAME":"${Data.CNAME}","idPostCode":"${Data.ADRESS_NUMBER}"}'>  --%>
	${Data.CNAME} ${Data.ADRESS_DORO} ${Data.TEL}</a> <br>
	</c:forEach>${Data}
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#searchAPI").submit(function(event){
		event.preventDefault();
		
		var sido = encodeURIComponent($("#sidoAPI").val());
		var sigungu = encodeURIComponent($("#sigunguAPI").val());
		var name = encodeURIComponent($("#nameAPI").val());
		
		location.replace("/customer/getCustomerApiData?sido="+sido+"&sigungu="+sigungu+"&name="+name);
	});
	
	$(".ApiData").click(function(event){
		event.preventDefault();
		var data = $(this).data("api");
		$(opener.document).find("#CNAME").val(data.CNAME);
		$(opener.document).find("#idPostCode").val(data.ADRESS_NUMBER);
		$(opener.document).find("#idRoadAddress").val(data.ADRESS_DORO);
		$(opener.document).find("#idDetailAddress").val(data.ADRESS_DETAIL);
		$(opener.document).find("#idExtraAddress").val(data.ADRESS_MEMO);
		$(opener.document).find("#TEL").val(data.TEL);
		$(opener.document).find("#MEMO").val(data.MEMO);
		window.close();
	});
});

</script>

</body>
</html>