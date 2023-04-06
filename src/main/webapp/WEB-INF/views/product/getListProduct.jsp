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
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>
				
				<%-- 페이지 정보 날리기 --%>
				<form id="pageInfo" method="get" action="/product/getListProduct">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
				  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
				</form>
				
					<h1 class="major">제품 목록</h1>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th style="width: 50px;">코드</th>
										<th>제품명</th>
										<th>용량</th>
										<th>규격</th>
										<th>단위</th>
										<th>약가</th>
										<th>제품가</th>
										<th>재고</th>
										<th> </th>
										<th> </th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="productList" items="${list}" begin="${page.begin}" end="${page.end}"> 
									<c:choose> 
									<c:when test = "${productCodeEdit eq productList.PCODE}"> <%-- 수정 시 리스트와 같은 화면에서 수정 되도록 --%>
									<form action="/product/editProduct" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<tr>
										<input type="hidden" name="PILLCODE" value="${productList.PILLCODE}" id="PILLCODE_EDIT">
										<input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
										<input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">										
										<td><input type="text" style="width: 30px;" name="PCODE" value="${productList.PCODE}" readonly></td>
										<td><input type="text" name="PNAME" value="${productList.PNAME}" readonly id="PNAME_EDIT"></td>
										<td><input type="text" name="CAPACITY" value="${productList.CAPACITY}" readonly id="CAPACITY_EDIT"></td>
										<td><input type="text" pattern="[0-9]+" name="AMOUNT" value="${productList.AMOUNT}" id="AMOUNT_EDIT"></td>
										<td><input type="text" name="UNIT" value="${productList.UNIT}"></td>
										<td><input type="text" style="width: 140px;" pattern="[0-9]+" value="${pillPrice}" style="width:50px" id="PILL_PRICE_EDIT" readonly></td>
										<td><input type="text" style="width: 140px;" pattern="[0-9]+" name="PRICE" value="${productList.PRICE}" readonly id="PRODUCT_PRICE_EDIT"></td>
										<td><input type="text" pattern="[0-9]+" name="STOCK" value="${productList.STOCK}"></td>
										<td><input type="submit" class="button small" value="수정"></td>
										<td><button type="button" class="button small" onclick="location.href='/product/getListProduct'">취소</button></td>
									</tr>
									</form>
									</c:when>
									<c:otherwise> 
									<tr>
										<td>${productList.PCODE}</td>
										<td><a href="/product/readProduct?productCode=${productList.PCODE}">${productList.PNAME}</a></td>
										<td>${productList.CAPACITY}	</td>
										<td>${productList.AMOUNT}</td>
										<td>${productList.UNIT}	</td>
										<td> - </td>
										<td>${productList.PRICE}</td>
										<td>${productList.STOCK}</td>
										<td><button type="button" class="button small" onclick="location.href='/product/getListProduct?ProductCodeEdit=${productList.PCODE}&curPage=${page.curPage}&curPageBlock=${page.curPageBlock}'"> 수정 </button></td>
										<td><button type="button" class="button small" onclick="location.href='/product/deleteProduct?productCode=${productList.PCODE}&curPage=${page.curPage}&curPageBlock=${page.curPageBlock}'"> 삭제 </button></td>
									</tr>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								</tbody>
								<tfoot>
									<tr>
									<form action="/product/writeProduct" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<td style="padding:10px"><input type="text" name="PILLCODE" id="PILLCODE" readonly></td>
										<td><input type="text" name="PNAME" id="PNAME"></td>
										<td><input type="text" name="CAPACITY" id="CAPACITY" readonly></td>
										<td><input type="text" pattern="[0-9]+" name="AMOUNT" id="AMOUNT"></td>
										<td><input type="text" name="UNIT"></td>
										<td><input type="text" pattern="[0-9]+" id="PILL_PRICE" readonly></td>
										<td><input type="text" pattern="[0-9]+" name="PRICE" id="PRODUCT_PRICE" readonly></td>
										<td><input type="text" pattern="[0-9]+" name="STOCK" value="0"></td>
										<td><input type="submit" value="등록"></td>
										<td> </td>
									</form>	
									</tr>
								</tfoot>
							</table>
						</div>		

	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/product/getListProduct?curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>
	
	<%@include file = "../BottomFooter.jsp" %>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$("input[id='PNAME']").on("focusin", function() {
			window.open("/product/getProductName","getProductName","width=500,height=700");
			openWin.document.getElementById("AMOUNT").value = document.getElementById("AMOUNT").value;
	 	});
	
		$("input[id='PNAME_EDIT']").on("focusin", function() {
			var productName = document.getElementById("PNAME_EDIT").value;
			window.open("/product/getProductName?blEdit=true&productName="+productName,"getProductName","width=500,height=700");
			openWin.document.getElementById("AMOUNT").value = document.getElementById("AMOUNT_EDIT").value;
	 	});
		
		$("input[id='AMOUNT'], input[id='PILL_PRICE']").on("change", function() {
			document.getElementById("PRODUCT_PRICE").value = document.getElementById("PILL_PRICE").value * document.getElementById("AMOUNT").value;	
	  	});
		
		$("input[id='AMOUNT_EDIT'], input[id='PILL_PRICE_EDIT']").on("change", function() {
			document.getElementById("PRODUCT_PRICE_EDIT").value = document.getElementById("PILL_PRICE_EDIT").value * document.getElementById("AMOUNT_EDIT").value;	
	  	});
	});
	
	</script>
</body>
</html>