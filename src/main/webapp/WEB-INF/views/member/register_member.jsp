<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="/member/register_member" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td colspan="2">
					회원등급 : <select name="auth">
					<option value="ROLE_USER" selected>일반회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">회원가입</button><button type="reset">취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>