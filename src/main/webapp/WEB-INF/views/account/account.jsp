<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

<form id = "viewDateForm" action="/account/account" method="get">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input style="color:purple;" type="date" id="viewDate" name="viewDate" value="${viewDate}">
<input type="submit" value="보기">
</form>

<h1 class="major">약품 목록</h1>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>날짜</th>
									<th>분류</th>
									<th>거래처이름</th>
									<th>제품이름</th>
									<th>수량</th>
									<th>재고</th>
									<th>가격</th>
									<th>합계</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="aList" items="${list}"> 
									<tr>
										<td></td>
										<td>${aList.STATE}</td>
										<td>${aList.CCODE}/${aList.CUSTOMER}</td>
										
										<c:choose>
										<c:when test="${aList.STATE eq '정산'}">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>${aList.TOTAL}원</td>
										</c:when>
										<c:otherwise> 
											<td>${aList.PCODE}/${aList.PRODUCT}</td>
											<td>${aList.STOCK}개</td>
											<td></td>
											<td>${aList.PRICE}원</td>
											<td>${aList.TOTAL}원</td>
										</c:otherwise>
										</c:choose>
										
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
								<form id="accountForm" action="/account/write" method="get">
								<input type="hidden" id="CCODE" name="CCODE">
								<input type="hidden" id="PCODE" name="PCODE">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<td> <input style="color:purple; width: 150px;" type="date" id="TDATE" name="TDATE" value="${viewDate}"> </td>
									<td>
										<select style="width: auto;" id="STATE" name="STATE">
										<option value="매입">매입</option>
										<option value="매출" selected="selected">매출</option>
										<option value="정산">정산</option>
										</select>
									</td>
									<td>
										<select style="width: 220px;" id="CUSTOMER" name="CUSTOMER"> 
										<option selected disabled>거래처</option>
										<c:forEach var="customerList" items="${customerList}"> 
										<option value="${customerList.CNAME}">${customerList.CCODE} ${customerList.CNAME} ${customerList.BALANCE}원</option>
										</c:forEach>
										</select>
									</td>
									<td>
										<select style="width: 220px;" id="PRODUCT" name="PRODUCT"> 
										<option selected disabled>제품명</option>
										<c:forEach var="productList" items="${productList}"> 
										<option value="${productList.PNAME}">${productList.PCODE} ${productList.PNAME} ${productList.PRICE}원 ${productList.STOCK}개</option>
										</c:forEach>
										</select>
									</td>
									<td><input style="width: 100px;" type="text" pattern="[0-9]+" id="STOCK" name="STOCK"></td>
									<td><input style="width: 100px;" type="text" pattern="[0-9]+" id="STOCK_before" readonly="readonly"></td>
									<td><input style="width: 100px;" type="text" pattern="[0-9]+" id="PRICE" name="PRICE" readonly="readonly"></td>
									<td><input style="width: 100px;" type="text" pattern="[0-9]+" id="TOTAL" name="TOTAL" readonly="readonly"></td>
									<td><input class="button small" type="submit" value="입력"></td>
								</form>
								</tr>
							</tfoot>
						</table>
					</div>

	<%@include file = "../BottomFooter.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var blStock = "false";
	
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
		}
		else{
			$('#STOCK').css('color', 'green');
			blStock = "true";
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