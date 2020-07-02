<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<style type="text/css">
p {
	text-align: center;
	margin-top: 50px;
}

fieldset {
	clear: both;
	min-width: 0;
	padding: .35em .625em .75em;
	margin: 0 2px;
	margin-top: 30px;
	border: 1px solid silver;
	border-radius: 0.5em;
	border-color: #6db92a;
	background-color: white;
	background-image: url('<%=request.getContextPath()%>/images/back3.png')
}

form {
	width: 600px;
	margin: 100px auto;
}
input.form-control.form-control-lg {
    height: 60px;
    border-radius: 10px;
    font-size: 2em;
    text-align: center;
}

</style>
<script type="text/javascript">
	$(function() {
		$("form[name=frm]").submit(function() {
			if($("#id").val() == ''){
				alert("아이디를 입력하셔야 합니다.");
				$("#id").focus();
				return false;
			}
			if($("#date").val() == ''){
				alert("생년월일을 입력하셔야 합니다.");
				$("#date").focus();
				return false;
			}
			if($("#date").val().length != 8){
				alert("생년월일을 정확히 입력하세요");
				$("#date").val('');
				$("#date").focus();
				return false;
			}
			if($("#date").val().indexOf('-') != 2) {
				alert("생년월일을 정확히 입력하세요");
				$("#date").val('');
				$("#date").focus();
				return false;
			}
		});
	});
</script>
<article>
<div class="title">
		<h2>비밀번호 찾기</h2>
	</div>
	<form action="<%=request.getContextPath()%>/login/searchPwd.gg"
		name="frm" method="post">
		<fieldset
			style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px; ">
			<div style="width: 80%; margin: 0 auto; margin-top: 70px">
				<input class="form-control form-control-lg" type="text" 
				placeholder="아이디" name="id" id="id"><br>
				<input class="form-control form-control-lg" type="text" 
				placeholder="생년월일(YY-MM-DD)" name="date" id="date" maxlength="8">
			</div>
			<div style="text-align: center; margin: 50px 0;">
				<input class="btn btn-primary btn-lg" type="submit" value="비밀번호 찾기" id="search">
			</div>
		</fieldset>
	</form>
</article>

<%@ include file="../inc/bottom.jsp"%>