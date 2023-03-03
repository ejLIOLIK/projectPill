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

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/customer/getListCustomer">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>

<!--  담당직원 / 주소(API주소) / 연락처 / 메모 / 잔금 (디폴트 0) -->
CODE / NAME / EMPLOYEE / VALANCE / ADRESS / TEL / MEMO <br>
	
	<c:forEach var="customerList" items="${list}" begin="${page.begin}" end="${page.end}"> 
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
			 <a href="/customer/getListCustomer?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a>
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
	
	<a href="/customer/writeCustomer">등록</a>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<%-- 페이지 정보 수정해서 form submit --%>
$(document).ready(function() {
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