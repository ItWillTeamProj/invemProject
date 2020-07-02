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
	margin: 160px auto;
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
			if($("#name").val() == ''){
				alert("이름을 입력하셔야 합니다.");
				$("#name").focus();
				return false;
			}
		});
	});
</script>
<article>
<div class="title">
		<h2>아이디 찾기</h2>
	</div>
	<form action="<%=request.getContextPath()%>/login/searchId.gg"
		name="frm" method="post">
		<fieldset
			style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px; ">
			<div style="width: 80%; margin: 0 auto; margin-top: 70px">
				<input class="form-control form-control-lg" type="text" 
				placeholder="이름을 입력하세요" name="name" id="name">
			</div>
			<div style="text-align: center; margin: 50px 0;">
				<input class="btn btn-primary btn-lg" type="submit" value="아이디 찾기" id="search">
			</div>
		</fieldset>
	</form>
</article>

<%@ include file="../inc/bottom.jsp"%>