<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="get">
		<input type="hidden" name="action" value="add">
		<table border="1" width="500px">
			<tr>
				<td><label for="input-gname">이름</label></td>
				<td><input type="text" id="input-gname" name="name"></td>
				<td><label for="input-gpw">비밀번호</label></td>
				<td><input type="password" id="input-gpw" name="password"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content" cols="66" rows="5"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button type="submit">등록</button></td>
			</tr>
		</table>
	</form>
	<br/>
	<table  border="1" width="500px">
		<c:forEach items="${guestList}" var="guestVo" varStatus="status">
			<tr>
				<td width="30">${guestVo.no }</td>
				<td width="267">${guestVo.name }</td>
				<td width="165">${guestVo.regDate }</td>
				<td width="38"><a href="/guestbook2/gbc?action=deleteform&no=${guestVo.no }">삭제</a></td>
			</tr>
			<tr>
				<td colspan="4">${guestVo.content }</td>
			</tr>
		</c:forEach>
	</table>
    <br/>
</body>
</html>