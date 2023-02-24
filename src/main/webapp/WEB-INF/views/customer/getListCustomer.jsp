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
<a href="/customer/setListCustomder">데이터 불러오기</a><br><br>

<!--  담당직원 / 주소(API주소) / 연락처 / 메모 / 잔금 (디폴트 0) -->
CODE / NAME / EMPLOYEE / VALANCE / ADRESS / TEL / MEMO <br>

	
	<c:forEach var="customerList" items="${list}"> 
	${customerList.CCODE}
	${customerList.STATE}
	<a href = "/customer/readCustomer?customerCode=${customerList.CCODE}">
	${customerList.CNAME} 
	</a>
	<a href="/employee/readEmployee?employeeCode=${customerList.EMPLOYEE_CODE}">
	${customerList.EMPLOYEE_NAME} <%-- 이름... --%>
	</a>
	(${customerList.ADRESS_NUMBER}) <%-- (우편번호) --%>
	${customerList.ADRESS_DORO}
	${customerList.ADRESS_DETAIL}
	${customerList.TEL}
	${customerList.MEMO}
	${customerList.BALANCE}
	<br>
	</c:forEach>
	
	<a href="/customer/writeCustomer">등록</a>

</body>
</html>