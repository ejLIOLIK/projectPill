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
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?version=${System.currentTimeMillis()}" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%@include file ="../TopHeader.jsp" %>

				<%-- 페이지 정보 날리기 --%>
				<form id="pageInfo" method="get" action="/pill/getListPill">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				  <input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
				  <input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
				</form>
				
					<h1 class="major">약품 목록</h1>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th style="width: 30px;">코드</th>
									<th>제품명</th>
									<th>용량</th>
									<th>회사</th>
									<th>제품가</th>
									<th> </th>
									<th> </th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="pillList" items="${list}" begin="${page.begin}" end="${page.end}"> 
									<c:choose> 
										<c:when test = "${pillCodeEdit eq pillList.PILLCODE}"> <%-- 수정 시 리스트와 같은 화면에서 수정 되도록 --%>
											<form action="/pill/editPill" method="post">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<tr>
													<input type="hidden" name="PILLCODE" value="${pillList.PILLCODE}">
													<input type="hidden" name="curPage" value="${page.curPage}" id="curPage">
													<input type="hidden" name="curPageBlock" value="${page.curPageBlock}" id="curPageBlock">
													<td>${pillList.PILLCODE}</td>
													<td><input type="text" name="PILLNAME" value="${pillList.PILLNAME}"></td>
													<td><input type="text" name="CAPACITY" value="${pillList.CAPACITY}"></td>
													<td><input type="text" name="COMPANY" value="${pillList.COMPANY}"></td>
													<td><input type="text" pattern="[0-9]+" name="PRICE" value="${pillList.PRICE}"></td>
													<td><input type="submit" class="button small" value="수정"></td>
													<td><button type="button" class="button small" onclick="location.href='/pill/getListPill'">취소</button></td>
												</tr>
											</form>
										</c:when>
										<c:otherwise> 
												<tr>
													<td>${pillList.PILLCODE}</td>
													<td><a href="/pill/readPill?pillCode=${pillList.PILLCODE}">${pillList.PILLNAME}</a></td>
													<td>${pillList.CAPACITY}</td>
													<td>${pillList.COMPANY}	</td>
													<td>${pillList.PRICE} </td>
													<td><button type="button" class="button small" onclick="location.href='/pill/getListPill?pillCodeEdit=${pillList.PILLCODE}&curPage=${page.curPage}&curPageBlock=${page.curPageBlock}'"> 수정 </button></td>
													<td><button type="button" class="button small" onclick="location.href='/pill/deletePill?pillCode=${pillList.PILLCODE}&curPage=${page.curPage}&curPageBlock=${page.curPageBlock}'"> 삭제 </button></td>
												</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
								<form action="/pill/writePill" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<td></td>
									<td><input type="text" name="PILLNAME"></td>
									<td><input type="text" name="CAPACITY"></td>
									<td><input type="text" name="COMPANY"></td>
									<td><input type="text" pattern="[0-9]+" name="PRICE"></td>
									<td><input type="submit" value="등록"></td>
								</form>
								</tr>
							</tfoot>
						</table>
					</div>
	
	<jsp:include page="../Paging.jsp">
		<jsp:param name="pageUrlParam" value="/pill/getListPill?curPageBlock=${page.curPageBlock}&curPage="/>
	</jsp:include>
	
	<%@include file = "../BottomFooter.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>

</body>
</html>