<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=01">1월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=02">2월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=03">3월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=04">4월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=05">5월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=06">6월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=07">7월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=08">8월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=09">9월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=10">10월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=11">11월</a>
	<a href="/main/list?userid=<sec:authentication property="principal.username" />&type=mm&contentdate=12">12월</a>
</body>
</html>