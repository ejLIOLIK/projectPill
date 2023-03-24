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

날짜 매입출 거래처이름 제품이름 수량 가격 토탈
<form id = "accountForm">

<input type="date" id="DATE" name="DATE">

<select id="STATE" name="STATE" >
<option selected disabled>매입/매출</option>
<option value="매입">매입</option>
<option value="매출">매출</option>
</select>

<select id="CUSTOMER" name="CUSTOMER"> 
<option selected disabled>거래처</option>
<c:forEach var="customerList" items="${customerList}"> 
<option value="${customerList.CNAME}">${customerList.CCODE} ${customerList.CNAME}</option>
</c:forEach>
</select>

<select id="PRODUCT" name="PRODUCT"> 
<option selected disabled>제품명</option>
<c:forEach var="productList" items="${productList}"> 
<option value="${productList.PNAME}">${productList.PCODE} ${productList.PNAME} ${productList.PRICE}원 ${productList.STOCK}개</option>
</c:forEach>
</select>

<input type="text" id="STOCK" name="STOCK">

<input type="text" id="STOCK_before" readonly="readonly">
<input type="text" id="PRICE" name="PRICE" readonly="readonly">
<input type="text" id="TOTAL" name="TOTAL" readonly="readonly">

<input type="hidden" id="CCODE" name="CCODE">
<input type="hidden" id="PCODE" name="PCODE">
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#DATE').val(new Date().toISOString().slice(0, 10));
	
	$('#CUSTOMER').change(function(){
    	var data = $("select[id=CUSTOMER] option:selected").text(); 
    	var dataSplit = data.split(" "); <%-- 공백 잘라서 input --%>
 	  	$('#CCODE').attr('value',dataSplit[0]);
   	});
   	
	$('#PRODUCT').change(function(){
		var data = $("select[id=PRODUCT] option:selected").text(); 
		var dataSplit = data.split(" "); <%-- 공백 잘라서 input --%>
	  	$('#PCODE').attr('value',dataSplit[0]);
	  	$('#PRICE').attr('value',dataSplit[2].replace("원",""));
	  	$('#STOCK_before').attr('value',dataSplit[3].replace("개",""));
	});
	
	$('#STOCK').change(function(){
		$('#TOTAL').val($('#STOCK').val() * $('#PRICE').val());
	});

});
</script>
</body>
</html>