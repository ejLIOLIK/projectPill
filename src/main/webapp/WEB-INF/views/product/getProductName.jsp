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

<form action="/product/getProductName" method="get">
<input type="hidden" name="blEdit" id="blEdit" value="${blEdit}">
<input type="search" name="productName" value="${productName}">
<input type="submit" name="searchSubmit" value="검색">
</form>

CODE / NAME / CAPACITY / COMPANY / PRICE <br>
<c:forEach var="pillList" items="${list}"> 
<a href="#" onclick="javascript:setProductData('${pillList.PILLCODE}', '${pillList.PILLNAME}', '${pillList.CAPACITY}', '${pillList.PRICE}')"> 
${pillList.PILLCODE} ${pillList.PILLNAME} ${pillList.CAPACITY} ${pillList.COMPANY} ${pillList.PRICE} </a><br>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function setProductData(PILLCODE, PNAME, CAPACITY, PRICE) {
		
		if("${blEdit}"!="" && "${blEdit}"=="true"){
			opener.document.getElementById("PILLCODE_EDIT").value = PILLCODE;
			opener.document.getElementById("PNAME_EDIT").value = PNAME;
			opener.document.getElementById("PILL_PRICE_EDIT").value = PRICE;
			opener.document.getElementById("CAPACITY_EDIT").value = CAPACITY;
			opener.document.getElementById("AMOUNT_EDIT").focus();
		}
		else{	
			opener.document.getElementById("PILLCODE").value = PILLCODE;
			opener.document.getElementById("PNAME").value = PNAME;
			opener.document.getElementById("PILL_PRICE").value = PRICE;
			opener.document.getElementById("CAPACITY").value = CAPACITY;
			opener.document.getElementById("AMOUNT").focus();
		}
		window.close();
	};
	
	<%-- 포커싱이 유지되는 경우 팝업창 브라우저를 닫았을 경우 계속해서 팝업이 발생함. 이에 대한 처리. --%>
	$(window).on("beforeunload", function() { 
		opener.document.getElementById("PILLCODE").focus(); 
	}) 
	
	
	</script>

</body>
</html>