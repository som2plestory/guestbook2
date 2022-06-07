<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="post">
		<input type="hidden" name="action" value="delete">
		<label for="input-gpw">비밀번호</label>
		<input type="password" id="input-gpw" name="password" value="">
		<button type="submit">확인</button>
		<br>
		<a href="/guestbook2/gbc">메인으로 돌아가기</a>
		<input type="hidden" name="no" value="${Param.no}"><br>
		
	
	</form>

</body>
</html>