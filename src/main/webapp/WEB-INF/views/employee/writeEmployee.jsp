<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	NAME / RANK / TEAM
	<form action="/employee/writeEmployee" method="post">
		<input type="text" name="ENAME" required="required">
<!-- 	<input type="text" name="ERANK"> -->
		<select name="ERANK"> 
			<option value="사원">사원</option>
			<option value="대리">대리</option>
			<option value="과장">과장</option>
		</select>
<!-- 	input type="text" name="ETEAM"> -->
		<select name="ETEAM"> 
			<option value="영업팀">영업팀</option>
			<option value="관리팀">관리팀</option>
			<option value="회계팀">회계팀</option>
		</select>
		<input type="submit" value="등록">
	</form>

</body>
</html>