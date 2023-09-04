<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="./index.jsp" />
	<div>
		<h2>${dvo.contentdate}월</h2>
	</div>
	<div id="se">
		<input type="hidden" name="userid2" value="${dvo.userid}" />
		<input type="hidden" name="type2" value="ymd"/>
		<input type="date" name="contentdate2"/>
		<button onclick="sech()">검색</button>
		<ul id="st">
			
		</ul>
	</div>
	<table border="1">
		<tbody>
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}01">1</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}02">2</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}03">3</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}04">4</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}05">5</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}06">6</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}07">7</a><div></div></td>
			</tr>
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}08">8</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}09">9</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}10">10</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}11">11</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}12">12</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}13">13</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}14">14</a><div></div></td>
			</tr>
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}15">15</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}16">16</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}17">17</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}18">18</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}19">19</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}20">20</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}21">21</a><div></div></td>
			</tr>
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}22">22</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}23">23</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}24">24</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}25">25</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}26">26</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}27">27</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}28">28</a><div></div></td>
			</tr>
			<c:choose>
			<c:when test="${dvo.contentdate eq '04' || dvo.contentdate eq '06' || dvo.contentdate eq '09' || dvo.contentdate eq '11'}">
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}29">29</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}30">30</a><div></div></td>
			</tr>
			</c:when>
			<c:when test="${dvo.contentdate eq '01' || dvo.contentdate eq '03' || dvo.contentdate eq '05' || dvo.contentdate eq '07' || dvo.contentdate eq '08' || dvo.contentdate eq '10' || dvo.contentdate eq '12'}">
			<tr>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}29">29</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}30">30</a><div></div></td>
				<td><a href="/main/view?userid=<sec:authentication property="principal.username" />&type=md&contentdate=${dvo.contentdate}31">31</a><div></div></td>
			</tr>
			</c:when>
			</c:choose>
		</tbody>
	</table>
			<input type="hidden" name="userid" value="${dvo.userid}" />
			<input type="hidden" name="type" value="${dvo.type}" />
			<input type="hidden" name="contentdate" value="${dvo.contentdate}" />
			<form action="./register" method="get">
			<input type="hidden" name="userid" value="${dvo.userid}" />
			<input type="hidden" name="type" value="${dvo.type}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit">일정 작성</button>
			</form>
	<script>
	function sech(){
		let formData = new FormData();
		let userid = $("input[name=userid2]");
		let type = $("input[name=type2]");
		let contentdate = $("input[name=contentdate2]");
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
		formData.append("userid2",userid.val());
		formData.append("type2",type.val());
		formData.append("contentdate2",contentdate.val());
		$.ajax({
			url: "/main/list",
			processData: false,
			contentType: false,
			data: formData,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			type: "POST",
			dataType: 'json',
			success: function(result){
				show2(result);
			}
		})
	}
	function show2(result){
		console.log(result);
		let tragetday = $("tbody td a");
		let content = $("#st");
		let day = String(result.contentdate);
		let txt = String(result.contenttext);
		for(let a=0;a<tragetday.length;a++){
			let tdy = tragetday[a].text;
			for(let b=0;b<result.length;b++){
				let dat = String(result[b].contentdate);
				let day2 = dat.substr(0,10);
				let day = dat.substr(8,2);
				if(day.substr(0,1) === '0'){
					day = day.substr(1);
				}
				let txt = String(result[b].contenttext);
				let stime = String(result[b].starttime);
				let etime = String(result[b].endtime);
				if(tdy == day){
					let str = "<li>날짜: "+day2+" 시간: "+stime+" ~ "+etime+" 일정: "+txt+"</li>";
					st.innerHTML += str;
				}
			}
		}
	}
	$(document).ready(function(){
		let formData = new FormData();
		let userid = $("input[name=userid]");
		let type = $("input[name=type]");
		let contentdate = $("input[name=contentdate]");
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
		formData.append("userid",userid.val());
		formData.append("type",type.val());
		formData.append("contentdate",contentdate.val());
		$.ajax({
			url: "/main/list",
			processData: false,
			contentType: false,
			data: formData,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			type: "POST",
			dataType: 'json',
			success: function(result){
				show(result);
			}
		})
		function show(result){
			console.log(result);
			let tragetday = $("tbody td a");
			let content = $("tbody td div");
			let day = String(result.contentdate);
			let txt = String(result.contenttext);
			for(let a=0;a<tragetday.length;a++){
				let tdy = tragetday[a].text;
				let ct = content[a];
				for(let b=0;b<result.length;b++){
					let dat = String(result[b].contentdate);
					let day = dat.substr(8,2);
					if(day.substr(0,1) === '0'){
						day = day.substr(1);
					}
					let txt = String(result[b].contenttext);
					let stime = String(result[b].starttime);
					let etime = String(result[b].endtime);
					if(tdy == day){
						let str = "<ul><li>시간 "+stime+" ~ "+etime+"</li><li>"+txt+"</li></ul>";
						ct.innerHTML += str;
					}
				}
			}
		}
	})
	</script>
</body>
</html>