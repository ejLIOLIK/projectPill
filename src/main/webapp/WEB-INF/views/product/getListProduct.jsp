<%@page import="com.liolik.project.dto.ProductDto"%>
<%@page import="java.util.List"%>
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
<form id="pageInfo" method="get" action="/product/getListProduct">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>

CODE / NAME / CAPACITY / AMOUNT / UNIT / PRICE / STOCK <br>

	<c:forEach var="productList" items="${list}" begin="${page.begin}" end="${page.end}"> 
		<c:choose> 
			<c:when test = "${productCodeEdit eq productList.PCODE}"> <%-- 수정 시 리스트와 같은 화면에서 수정 되도록 --%>
				<!-- 		수정 -->
				<form action="/product/editProduct" method="post">
				<input type="text" name="PILLCODE" value="${productList.PILLCODE}" style="width:30px" id="PILLCODE_EDIT" readonly>
				<input type="text" name="PCODE" value="${productList.PCODE}" readonly>
				<input type="text" name="PNAME" value="${productList.PNAME}" readonly id="PNAME_EDIT">
				<input type="text" name="CAPACITY" value="${productList.CAPACITY}" readonly id="CAPACITY_EDIT">
				<input type="number" name="AMOUNT" value="${productList.AMOUNT}" id="AMOUNT_EDIT">
				<input type="text" name="UNIT" value="${productList.UNIT}">
				<input type="number" value="${pillPrice}" style="width:50px" id="PILL_PRICE_EDIT" readonly>
				<input type="number" name="PRICE" value="${productList.PRICE}" readonly id="PRODUCT_PRICE_EDIT">
				<input type="number" name="STOCK" value="${productList.STOCK}" style="width:50px">
				<input type="submit" value="수정">
				<button type="button" onclick="location.href='/product/getListProduct'">취소</button>
				</form>
			</c:when>
			<c:otherwise> 
				${productList.PCODE}
				<a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a>
				${productList.CAPACITY}	
				${productList.AMOUNT}	
				${productList.UNIT}	
				${pillPrice}
				${productList.PRICE}	
				${productList.STOCK}	
				<button type="button" onclick="location.href='/product/getListProduct?ProductCodeEdit=${productList.PCODE}'"> 수정 </button>
				<button type="button" onclick="location.href='/product/deleteProduct?productCode=${productList.PCODE}'"> 삭제 </button>
				<br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		<br>
		
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
			 <a href="/product/getListProduct?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a>
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
		
<!-- 		입력 -->
PILLCODE / NAME / CAPACITY / AMOUNT / UNIT / PRICE / STOCK 
		<form action="/product/writeProduct" method="post">
		<input type="text" name="PILLCODE" id="PILLCODE" style="width:30px" readonly>
		<input type="text" name="PNAME" id="PNAME">
		<input type="text" name="CAPACITY" id="CAPACITY" readonly>
		<input type="number" name="AMOUNT" id="AMOUNT">
		<input type="text" name="UNIT">
		<input type="number" id="PILL_PRICE" style="width:50px" readonly>
		<input type="number" name="PRICE" id="PRODUCT_PRICE" style="width:50px" readonly>
		<input type="number" name="STOCK" value="0" style="width:50px" >
		<input type="submit" value="등록">
	</form>	

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$("input[id='PNAME']").on("focusin", function() {
			window.open("/product/getProductName","getProductName","width=400,height=500");
			openWin.document.getElementById("AMOUNT").value = document.getElementById("AMOUNT").value;
	 	});
	
		$("input[id='PNAME_EDIT']").on("focusin", function() {
			var productName = document.getElementById("PNAME_EDIT").value;
			window.open("/product/getProductName?blEdit=true&productName="+productName,"getProductName","width=400,height=500");
			openWin.document.getElementById("AMOUNT").value = document.getElementById("AMOUNT_EDIT").value;
	 	});
		
		$("input[id='AMOUNT'], input[id='PILL_PRICE']").on("change", function() {
			document.getElementById("PRODUCT_PRICE").value = document.getElementById("PILL_PRICE").value * document.getElementById("AMOUNT").value;	
	  	});
		
		$("input[id='AMOUNT_EDIT'], input[id='PILL_PRICE_EDIT']").on("change", function() {
			document.getElementById("PRODUCT_PRICE_EDIT").value = document.getElementById("PILL_PRICE_EDIT").value * document.getElementById("AMOUNT_EDIT").value;	
	  	});
		
		<%-- 페이징블락 버튼 함수 --%>
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