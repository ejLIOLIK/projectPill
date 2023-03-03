<%@page import="com.liolik.project.dto.PillDto"%>
<%@page import="java.util.List"%>
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
<form id="pageInfo" method="get" action="/pill/getListPill">
  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
</form>

CODE / NAME / COMPANY / PRICE <br>

	<c:forEach var="pillList" items="${list}" begin="${page.begin}" end="${page.end}"> 
		<c:choose> 
			<c:when test = "${pillCodeEdit eq pillList.PILLCODE}"> <%-- 수정 시 리스트와 같은 화면에서 수정 되도록 --%>
				<form action="/pill/editPill" method="post">
				${pillList.PILLCODE}
				<input type="hidden" name="PILLCODE" value="${pillList.PILLCODE}">
				<input type="text" name="PILLNAME" value="${pillList.PILLNAME}">
				<input type="text" name="CAPACITY" value="${pillList.CAPACITY}">
				<input type="text" name="COMPANY" value="${pillList.COMPANY}">
				<input type="number" name="PRICE" value="${pillList.PRICE}">
				<input type="submit" value="수정">
				<button type="button" onclick="location.href='/pill/getListPill'">취소</button>
				</form>
			</c:when>
			<c:otherwise> 
				${pillList.PILLCODE}
				<a href="/pill/readPill?pillCode=${pillList.PILLCODE}">${pillList.PILLNAME}</a>
				${pillList.CAPACITY}	
				${pillList.COMPANY}	
				${pillList.PRICE}	
				<button type="button" onclick="location.href='/pill/getListPill?pillCodeEdit=${pillList.PILLCODE}'"> 수정 </button>
				<button type="button" onclick="location.href='/pill/deletePill?pillCode=${pillList.PILLCODE}'"> 삭제 </button>
				<br>
			</c:otherwise>
		</c:choose>
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
			 <a href="/pill/getListPill?curPage=${pagenum}&curPageBlock=${page.curPageBlock}"> ${pagenum} </a>
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
	
<!-- 		입력 -->
		<br>
		NAME / COMPANY / PRICE
		<form action="/pill/writePill" method="post">
		<input type="text" name="PILLNAME">
		<input type="text" name="CAPACITY">
		<input type="text" name="COMPANY">
		<input type="number" name="PRICE">
		<input type="submit" value="등록">
	</form>

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