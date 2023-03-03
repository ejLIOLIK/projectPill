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

<%-- 페이지 정보 날리기 --%>
<form id="pageInfo" method="get" action="/register/getEmployeeCode">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>

<form action="/register/getEmployeeCode" method="get">
<input type="search" name="employeeName">
<input type="submit" name="searchSubmit" value="검색">
</form>

<c:forEach var="EmployeeList" items="${list}" begin="${page.begin}" end="${page.end}">
<%-- ID 대신 CLASS 사용 --%>
${EmployeeList.ECODE } <a href="#" class="REGISTER" data-ecode="${EmployeeList.ECODE}"> ${EmployeeList.ENAME } </a> ${EmployeeList.ERANK } <br>
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
			 <a href="/register/getEmployeeCode?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a>
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
	
	<%-- 페이징블락 버튼 함수 --%>
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