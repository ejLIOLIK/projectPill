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

날짜 분류 거래처이름 제품이름 수량 가격 토탈 <br>
<c:forEach var="aList" items="${list}"> 
${aList.TDATE} ${aList.STATE} ${aList.CCODE}/${aList.CUSTOMER} ${aList.PCODE}/${aList.PRODUCT} ${aList.STOCK}개 ${aList.PRICE}원 ${aList.TOTAL}원<br>
</c:forEach>

<form id = "accountForm" action="/account/write" method="get">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="date" id="TDATE" name="TDATE">

<select id="STATE" name="STATE" >
<option selected disabled>분류</option>
<option value="매입">매입</option>
<option value="매출">매출</option>
<option value="정산">정산</option>
</select>

<select id="CUSTOMER" name="CUSTOMER"> 
<option selected disabled>거래처</option>
<c:forEach var="customerList" items="${customerList}"> 
<option value="${customerList.CNAME}">${customerList.CCODE} ${customerList.CNAME} ${customerList.BALANCE}원</option>
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

<input type="submit" value="입력">
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var blStock = "false";
	
	$('#TDATE').val(new Date().toISOString().slice(0, 10));
	
	$('#STATE').change(function(){
		<!-- 정산 시 다른 입력창 다 비활성화, PRODUCT정보 0으로 통일하고 -->
		<!-- TOTAL에 정산금액 입력할 수 있도록 처리 -->
    	if($('#STATE').val()=="정산"){
    		$('#PRODUCT').attr("disabled", true);
    		$('#STOCK').attr("readonly", true);
    		$('#TOTAL').attr("readonly", false);
    		
    		$('#PCODE').attr('value','0');
    		$('#PRICE').attr('value','0');
    		$('#STOCK').attr('value','0');
    		
    		blStock="true";
    	}
    	else{
    		$('#PRODUCT').attr("disabled", false);
    		$('#STOCK').attr("readonly", false);
    		$('#TOTAL').attr("readonly", true);
    		
    		blStock="false";
    	}
   	});

	$('#CUSTOMER').change(function(){
    	var data = $("select[id=CUSTOMER] option:selected").text(); 
    	var dataSplit = data.split(" "); <%-- 공백 잘라서 input --%>
 	  	$('#CCODE').attr('value',dataSplit[0]);
 	  	
 	  	<!-- 정산 시 BALANCE 값 활용 -->
 	  	if($('#STATE').val()=="정산"){
 	  		$('#STOCK_before').attr('value',dataSplit[2].replace("원",""));
 	  	}
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

		<!-- 재고 수량보다 많은 수량 매출 입력 시 -->
		if($('#STATE').val()=="매출" && ($('#STOCK_before').val() - $('#STOCK').val()) < 0){ 
			$('#STOCK').css('color', 'red');
			blStock = "false";
			console.log(blStock);
		}
		else{
			$('#STOCK').css('color', 'black');
			blStock = "true";
			console.log(blStock);
		}
	});
	
	$('#accountForm').submit(function(event){
		if(blStock=="false"){
			event.preventDefault();
			alert('재고가 부족합니다.');
			$("#STOCK").focus();
		}
	});

});
</script>
</body>
</html>