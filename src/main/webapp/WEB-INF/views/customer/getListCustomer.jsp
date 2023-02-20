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
<!--  담당직원 / 주소(API주소) / 연락처 / 메모 / 잔금 (디폴트 0) -->
CODE / NAME / EMPLOYEE / VALANCE / ADRESS / TEL / MEMO <br>

	<c:forEach var="customerList" items="${list}"> 
	${customerList.CCODE}
	${customerList.STATE}
	${customerList.CNAME}
	${customerList.EMPLOYEE}
<%-- 	${customerList.ADRESS} --%>
<%-- 	${customerList.ADRESS_DETAIL} --%>
	(${customerList.ADRESS_NUMBER})
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