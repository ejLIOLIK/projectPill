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

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/product/getProductName">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
  <input type="hidden" name="blEdit" id="blEdit" value="${blEdit}">
</form>

<form action="/product/getProductName" method="get">
<input type="hidden" name="blEdit" id="blEdit" value="${blEdit}">
<input type="search" name="productName" value="${productName}">
<input type="submit" name="searchSubmit" value="검색">
</form>

CODE / NAME / CAPACITY / COMPANY / PRICE <br>
<c:forEach var="pillList" items="${list}" begin="${page.begin}" end="${page.end}"> 
<a href="#" onclick="javascript:setProductData('${pillList.PILLCODE}', '${pillList.PILLNAME}', '${pillList.CAPACITY}', '${pillList.PRICE}')"> 
${pillList.PILLCODE} ${pillList.PILLNAME} ${pillList.CAPACITY} ${pillList.COMPANY} ${pillList.PRICE} </a><br>
</c:forEach>

	<%-- 페이징 --%>
	<c:choose>
		<c:when test="${page.blBeforeBlock}">
			<button type="button" id="buttonbefore">이전</button>
		</c:when>
		<c:otherwise> <button type="button" disabled>이전</button>	</c:otherwise>
	</c:choose>
	<c:forEach var="pagenum" begin="${page.beginBlock}" end="${page.endBlock}">
		<c:choose>
	    	<c:when test="${pagenum eq page.curPage}">
	   		${pagenum}
	    	</c:when>
	    	<c:otherwise>
			 <a href="/product/getProductName?curPage=${pagenum}&curPageBlock=${page.curPageBlock}&blEdit=${blEdit}&productName=${productName}"> ${pagenum} </a>
	  		</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${page.blAfterBlock}">
			<button type="button" id="buttonAfter">다음</button>
		</c:when>
		<c:otherwise> <button type="button" disabled>다음</button>	</c:otherwise>
	</c:choose>
	<br>

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