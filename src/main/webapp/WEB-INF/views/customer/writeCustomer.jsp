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

	STATE / NAME / EMPLOYEE / ADRESS / TEL / MEMO / BALANCE
	<form action="/customer/writeCustomer" method="post">
		<select name="STATE"> 
			<option value="매입">매입</option>
			<option value="매출">매출</option>
		</select>
		<input type="text" name="CNAME">
		<select name="EMPLOYEE">
			<option value=""></option>
			<c:forEach var="employeeList" items="${list}"> 
				<option value="${employeeList.ENAME}">${employeeList.ENAME} ${employeeList.ERANK}</option>
			</c:forEach>
		</select>
<!-- 		 API-->
		<input type="text" id="ID_ADRESS" name="ADRESS" placeholder="주소">
		<input type="text" id="ID_ADRESS_DETAIL" name="ADRESS_DETAIL" placeholder="상세주소">		
<!-- 		 API-->
		<input type="text" name="TEL">
		<input type="text" name="MEMO">
		<input type="number" name="BALANCE" value="0">
		<input type="submit" value="등록">
	</form>
	
	

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("ID_ADRESS").addEventListener("click", function(){ //주소 팝업
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("ID_ADRESS").value = data.roadAddress; 
            }
        }).open();
    });
}
</script>
</html>