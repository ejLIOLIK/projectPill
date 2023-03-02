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

<form action="/register/getEmployeeCode" method="get">
<input type="search" name="employeeName">
<input type="submit" name="searchSubmit" value="검색">
</form>

<c:forEach var="EmployeeList" items="${list}">
<%-- ID 대신 CLASS 사용 --%>
${EmployeeList.ECODE } <a href="#" class="REGISTER" data-ecode="${EmployeeList.ECODE}"> ${EmployeeList.ENAME } </a> ${EmployeeList.ERANK } <br>
</c:forEach> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".REGISTER").click(function(event){
		$(opener.document).find("#ECODE").val($(this).data("ecode"));
		$(opener.document).find("#EPW").focus();
		window.close();
	});

	<%-- 포커싱이 유지되는 경우 팝업창 브라우저를 닫았을 경우 계속해서 팝업이 발생함. 이에 대한 처리. --%>
	$(window).on("beforeunload", function() { 
		$(opener.document).find("#EPW").focus();
	});
});
</script>
</body>
</html>