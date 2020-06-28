<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<%
	//쿠키 정보 읽어오기
	String ckUserid = "";

	Cookie[] ckArr = request.getCookies();
	if (ckArr != null) {
		for (int i = 0; i < ckArr.length; i++) {
			String cName = ckArr[i].getName();
			if (cName.equals("ck_userid")) {
				ckUserid = ckArr[i].getValue();
				break;
			}
		}
	}
%>

<script type="text/javascript">
	$(function() {
		$('form[name=frmLogin]').submit(function() {
			if ($('#userid').val().length < 1) {
				alert('아이디를 입력하세요');
				$('#userid').focus();
				event.preventDefault();
			} else if ($('#pwd').val().length < 1) {
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}
		});
	});
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-repeat: no-repeat;
	background-image:
		url('<%=request.getContextPath()%>/images/backimage.jpg');
	background-color: white;
	background-attachment: fixed;
}

form {
	width: 400px;
	height: 100px;
	margin: 10px auto;
	text-align: center;
}
</style>
</head>
<body>
	<fieldset
		style="text-align: center; margin-top: 30px; margin-bottom: 30px; margin-left: 30px; margin-right: 30px; border-radius: 0.5em; border-color: #6db92a; background-color: white;">
		<div
			style="margin-left: 30px; border-left-width: 30px; padding-left: 10px; margin-bottom: 5px;">
			<form name="frmLogin" method="post"
				action="<%=request.getContextPath()%>/login/login_ok.gg">
				<label style="font-size: x-large; margin-right: 40px;">로그인</label>
		</div>
		<fieldset
			style="margin-top: 30px; margin-left: 120px; margin-right: 120px; border-radius: 0.5em; border-color: #6db92a; background-color: white;">
			<div>
				<br> <label for="userid" class="label"
					style="margin-right: 16px;">아이디</label> <input type="text"
					name="userid" id="userid" value="<%=ckUserid%>">
			</div>
			<div>
				<label for="pwd" class="label">비밀번호</label> <input type="password"
					name="pwd" id="pwd">
			</div>

			<div class="align_center">
				<input type="checkbox" name="saveId" id="chkId"
					<%if (ckUserid != null && !ckUserid.isEmpty()) {%>
					checked="checked">
				<%
					}
				%>
				<label for="chkId" style="font-size: 12px;">아이디 저장하기</label><br>
				<input type="submit" value="로그인">
				</form>
		</fieldset>
		<br>
	</fieldset>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>