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
	<h4><c:out value="${viewdate}" /></h4>
			<c:choose>
			<c:when test="${empty list}">
				<ul>
					<li>일정이 없습니다.</li>
				</ul>
			</c:when>
			<c:otherwise>
			<c:forEach items="${list}" var="board">
				<ul>
					<li>시간 <c:out value="${board.starttime}" /> ~ <c:out value="${board.endtime}"/></li>
					<li>일정 : <c:out value="${board.contenttext}" /></li>
					<li>
					참고 이미지
					<c:choose>
						<c:when test="${board.contfile eq null}">
							<p>X</p>
						</c:when>
						<c:otherwise>
							<img src="/image/display?filename=${board.contfile}">
						</c:otherwise>
					</c:choose>
					</li>
					<li>
					<form action="./remove"  method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="userid" value="${dvo.userid}" />
						<input type="hidden" name="type" value="semd" />
						<input type="hidden" name="contentdate" value="${dvo.contentdate}" />
						<input type="hidden" name="starttime" value="${board.starttime}" />
						<input type="hidden" name="endtime" value="${board.endtime}" />
						<input type="hidden" name="contfile" value="${board.contfile}" />
						<button type="submit">삭제</button>
					</form>
					</li>
				</ul>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			<form action="./remove" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="userid" value="${dvo.userid}" />
				<input type="hidden" name="type" value="${dvo.type}" />
				<input type="hidden" name="contentdate" value="${dvo.contentdate}" />
				<button type="submit">모두삭제</button>
			</form>
</body>
</html>