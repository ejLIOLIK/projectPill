<%@ page import="com.liolik.project.module.getApiDateModule" %>
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
<section id="main" class="wrapper">
<div class="inner">

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/register/getEmployeeCode">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>

<%-- API 파라미터 특성상 시도 입력 없이 시군구 검색할 경우 검색결과가 정확하게 출력되지 않음 --%>
<%-- 시도 필수 --%>

	<div style="text-align: right"><form id="searchAPI">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="text" name="sidoAPI" id="sidoAPI" placeholder="시도" req><br>
		<input type="text" name="sigunguAPI" id="sigunguAPI" placeholder="시군구"><br>
		<input type="text" name="nameAPI" id="nameAPI" placeholder="이름"><br>
		<input type="submit" class="button primary small" value="검색"><br>
	</form></div>
	
	<ul class="alt">
	<c:forEach var="Data" items="${list}" begin="${page.begin}" end="${page.end}">
	<li>
	<a href="#" class="ApiData" data-api='{"CNAME":"${Data.CNAME}","ADRESS_NUMBER":"${Data.ADRESS_NUMBER}","ADRESS_DORO":"${Data.ADRESS_DORO}","ADRESS_DETAIL":"${Data.ADRESS_DETAIL}","ADRESS_MEMO":"${Data.ADRESS_MEMO}","TEL":"${Data.TEL}","MEMO":"${Data.MEMO}"}'> 
	${Data.CNAME} ${Data.ADRESS_DORO} ${Data.TEL}</a> <br>
	</li>
	</c:forEach>
	</ul>
	
	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/customer/getCustomerApiData?${searchUrl}&curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>
	
</div>
</section>
	
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
<%-- 템플릿 assets --%>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</body>
</html>