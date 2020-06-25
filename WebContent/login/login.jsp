<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form{
	width: 400px;
	height: 100px;
	margin: 10px auto;
	text-align: center;
}

.simpleForm{
	text-align:center;
}

</style>
</head>
<body>
	<article class="simpleForm">
	<form name="frmLogin" method="post" action="login_ok.gg">
		<legend style="margin-top: 50px;font-size: x-large;font-family: none;">로그인</legend>
		<fieldset style="margin-top: 50px;border-color: #6db92a;">
			<div>
				<label for="userid" class="label" style="margin-left: 15px;">아이디</label>
				<input type = "text" name = "userid" id = "userid" value = "userid">
			</div>
			<div>
				<label for="pwd" class="label">비밀번호</label>
				<input type="password" name="pwd" id="pwd">
			</div>
			<br>
			<div class="align_center">
				<input type="checkbox" name="saveId" id="chkId"	checked="checked">
				<label for="chkId">아이디 저장하기</label>
			</div>			
				<input type="submit" value="로그인">
		</fieldset>
	</form>
</article>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>