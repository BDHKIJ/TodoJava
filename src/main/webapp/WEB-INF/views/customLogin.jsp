<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<p><c:out value="${error}" /></p>
	<p><c:out value="${logout}" /></p>
	<form action="/login" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>로그인유지</td>
				<td><input type="checkbox" name="remember-me" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인" /></td>
				<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
			</tr>
		</table>
	</form>
</body>
</html>