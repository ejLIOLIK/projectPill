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
<form id="pageInfo" method="get" action="/product/getProductName">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
  <input type="hidden" name="blEdit" id="blEdit" value="${blEdit}">
</form>

	<div style="text-align: right"><form action="/product/getProductName" method="get">
		<input type="hidden" name="blEdit" id="blEdit" value="${blEdit}">
<input type="text" name="productName" value="${productName}"> <br>
<input type="submit" name="searchSubmit" value="검색">
	</form></div>
	
	CODE  NAME  CAPACITY  COMPANY  PRICE 
	
<ul class="alt">
<c:forEach var="pillList" items="${list}" begin="${page.begin}" end="${page.end}">
	<li>
	<a href="#" onclick="javascript:setProductData('${pillList.PILLCODE}', '${pillList.PILLNAME}', '${pillList.CAPACITY}', '${pillList.PRICE}')"> 
${pillList.PILLCODE} ${pillList.PILLNAME} ${pillList.CAPACITY} ${pillList.COMPANY} ${pillList.PRICE}원 </a>
	</li>
	</c:forEach>
</ul>

	<%-- 페이징 --%>
	<div style="text-align:center">
	<c:choose>
		<c:when test="${page.blBeforeBlock}">
			<button type="button" id="buttonbefore" class="button small" >이전</button>
		</c:when>
		<c:otherwise> <button type="button" disabled class="button small" >이전</button>	</c:otherwise>
	</c:choose>
	<c:forEach var="pagenum" begin="${page.beginBlock}" end="${page.endBlock}">
		<c:choose>
	    	<c:when test="${pagenum eq page.curPage}">
	   		${pagenum}
	    	</c:when>
	    	<c:otherwise>
			 <span><a href="/product/getProductName?curPage=${pagenum}&curPageBlock=${page.curPageBlock}&blEdit=${blEdit}&productName=${productName}"> ${pagenum} </a></span>
	  		</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${page.blAfterBlock}">
			<button type="button" id="buttonAfter" class="button small" >다음</button>
		</c:when>
		<c:otherwise> <button type="button" class="button small" disabled>다음</button>	</c:otherwise>
	</c:choose>
	<br>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	function setProductData(PILLCODE, PNAME, CAPACITY, PRICE) {
		<%--차후 가독성을 위해 제이쿼리로 수정--%>
		if("${blEdit}"!="" && "${blEdit}"=="true"){
			opener.document.getElementById("PILLCODE_EDIT").value = PILLCODE;
			opener.document.getElementById("PNAME_EDIT").value = PNAME;
			opener.document.getElementById("PILL_PRICE_EDIT").value = PRICE;
			opener.document.getElementById("CAPACITY_EDIT").value = CAPACITY;
			opener.document.getElementById("PRODUCT_PRICE_EDIT").value = PRICE * opener.document.getElementById("AMOUNT_EDIT").value;
			$(opener.document).find("#AMOUNT_EDIT").focus();
		}
		else{	
			opener.document.getElementById("PILLCODE").value = PILLCODE;
			opener.document.getElementById("PNAME").value = PNAME;
			opener.document.getElementById("PILL_PRICE").value = PRICE;
			opener.document.getElementById("CAPACITY").value = CAPACITY;
			opener.document.getElementById("PRODUCT_PRICE").value = PRICE * opener.document.getElementById("AMOUNT").value;
			$(opener.document).find("#AMOUNT").focus();
		}
		window.close();
	};
	
	<%-- 포커싱이 유지되는 경우 팝업창 브라우저를 닫았을 경우 계속해서 팝업이 발생함. 이에 대한 처리. --%>
	$(window).on("beforeunload", function() { 
		$(opener.document).find("#PILLCODE").focus(); 
	});
	
	$(document).ready(function() {
		$("#buttonbefore").on("click",function(){
			var curPageBlock = parseInt($('#curPageBlock').val()) - 1;
	        $('#curPageBlock').val(curPageBlock);
		    $('#pageInfo').submit();
			console.log("function : buttonbefore");
		});
		$("#buttonAfter").on("click",function(){
			var curPageBlock = parseInt($('#curPageBlock').val()) + 1;
	        $('#curPageBlock').val(curPageBlock);
		    $('#pageInfo').submit();
			console.log("function : buttonAfter");
		});
	});
	</script>

</body>
</html>