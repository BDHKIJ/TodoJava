<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>일정기입</h2>
	<form class="main" action="/main/register" method="POST">
		<input type="hidden" name="type" value="${dvo.type}" />
		<input type="hidden" name="userid" value="${dvo.userid}" />
		<table border="1">
			<tr>
				<td>날짜</td>
				<td><input type="date" name="contentdate" required /></td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type="time" name="starttime" > ~ <input type="time" name="endtime" >
				</td>
			</tr>
			<tr>
				<td>일정</td>
				<td><textarea name="contenttext"></textarea></td>
			</tr>
			<tr>
				<td>참고이미지</td>
				<td><input type="file" name="uploadFile"  /></td>
			</tr>
			<tr id="uploadresult">
				<td>이미지 확인</td>
			</tr>
			
			<tr>
				<td>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="sub" type="submit">일정추가</button></td>
				<td><button type="reset">취소</button></td>
			</tr>
		</table>
	</form>
<script>
	$(document).ready(function(){
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
		$("input[name=contentdate]").val(new Date().toISOString().slice(0,10));
		$("input[type='file']").change(function(){
			let formData = new FormData();
			let inputFile = $("input[name=uploadFile]");
			let files = inputFile[0].files;
			for(let i=0;i<files.length;i++){
				formData.append("uploadFile",files[i]);
			}
			$.ajax({
				url: "/image/uploadimage",
				processData: false,
				contentType: false,
				data: formData,
				type: "POST",
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				dataType: 'json',
				success : function(result){
					console.log(result);
					checkimage(result);
					showimage(result);
				}
			})
		})
		function showimage(result){
			if(!result || result.length==0){ return; }
			let show = $("#uploadresult");
			let str = "";
			$(result).each(function(i,obj){
				let path = encodeURIComponent(obj.uploadpath+"\\"+obj.filename);
				str = "<tb id='dt' data-path='"+obj.uploadpath+"' data-filename='"+path+"'><div><img src='/image/display?filename="+path+"' /><button class='btn' data-file=\'"+path+"'\ data-type='image'>삭제</button></div></td>"
			})
			show.append(str);
		}
		$("#uploadresult").on("click","button",function(e){
			e.preventDefault();
			console.log("삭제");
			let targetFile = $(this).data("file");
			let type = $(this).data("type");
			let target = $(this).closest("div");
			$.ajax({
				url: '/image/deleteFile',
				data: {fileName: targetFile, type: type},
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				dataType: 'text',
				type: 'POST',
				success: function(result){
					alert(result);
				}
			})
			target.remove();
		})
		$(".sub").on("click",function(e){
			e.preventDefault();
			let str = "";
			let td = $("#uploadresult #dt");
			str += "<input type='hidden' name='contfile' value='"+td.data("filename")+"' />"
			let formObj = $("form.main");
			formObj.append(str).submit();
		})
		function checkimage(result){
			if(!result.check){
				alert("이미지 파일만 업로드 가능합니다.");
				location.href="/main/register";
			}
		}
	})
</script>
</body>
</html>