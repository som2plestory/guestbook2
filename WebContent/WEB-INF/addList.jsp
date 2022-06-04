<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%
	List<GuestbookVo> guestList = (List<GuestbookVo>)request.getAttribute("guestList");
%>

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

	<% 
		for(GuestbookVo guestVo :guestList){
	%>
			<table  border="1" width="500px">
				<tr>
					<td width="30"><%=guestVo.getNo() %></td>
					<td width="267"><%=guestVo.getName() %></td>
					<td width="165"><%=guestVo.getRegDate() %></td>
					<td width="38"><a href="/guestbook2/gbc?action=deleteform&no=<%=guestVo.getNo() %>">삭제</a></td>
				</tr>
				<tr>
					<td colspan="4"><%=guestVo.getContent() %></td>
				</tr>
			</table>
		    <br/>
	<% 
		}
	%>
</body>
</html>