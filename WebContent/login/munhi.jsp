<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p{
	text-align:center;
    margin-top: 50px;
	}
	fieldset {
	  min-width: 0;
	  padding: .35em .625em .75em;
	  margin: 0 2px;
	  margin-top: 30px;
	  border:1px solid silver;
	  border-radius: 0.5em;
	  border-color: #6db92a;
	  background-color:white;
	}
	label{
	font-size:13px;
	}

</style>
</head>
<body>
	<fieldset style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px;">
		<h2 style="margin-top: 30px; margin-bottom: 0px; margin-left: 20px;">아이디·비밀번호찾기</h2>
		<p><iframe src="provision.html" width="600" height="250"></iframe></p>
		<div style="text-align: left; margin-left: 30px;border-left-width: 30px;padding-left: 10px;margin-bottom: 5px;">
			<input type="checkbox" name="chkAgree2" id="chkAgree2">
			<label for="chkAgree2">개인정보 수집 및 이용 동의(미구현)</label>
		</div>
	<fieldset style="margin-left: 180px; margin-right: 180px;">
		<div style="text-align:center">
			<div>
				<br>
				<input type="radio" name="x" value="휴대폰">휴대폰 인증
				<input type="radio" name="x" value="아이핀">아이핀 인증
				<br><br>
			</div>
			<div>
		        <input type="button" value="비밀번호 찾기" style="margin-bottom: 20px;">
			</div>
		</div>
	</fieldset>
			<br>
	</fieldset>
	
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>