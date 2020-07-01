<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
fieldset {
  min-width: 0;
  padding: .35em .625em .75em;
  margin: 0 2px;
  border:1px solid silver;
}
label{
	font-size:13px;
}

</style>
<body>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmAgree]').submit(function(){
			if(!$('#chkAgree1').is(':checked')){
				alert("이용 약관에 동의하셔야 합니다!");
				$('#chkAgree1').focus();
				event.preventDefault();
			}else if(!$('#chkAgree2').is(':checked')){
				alert("개인정보 약관에 동의하셔야 합니다!");
				$('#chkAgree2').focus();
				event.preventDefault();
			} 
		});
	});
</script>


	<article>
		<form name="frmAgree" method="post" action="signup.gg">
		<div style="margin-top: 30px; margin-bottom: 30px; margin-left: 30px; margin-right: 30px;">
		<fieldset style="margin-top: 20px; border-radius: 0.5em;border-color: #6db92a;background-color:white;">
			<h2 style="background-image:url(); margin-top: 30px;margin-left: 20px; margin-top: 30px;margin-left: 20px;">회원 약관</h2>
			<div style="text-align: left; margin-left: 30px;border-left-width: 30px;padding-left: 10px;margin-bottom: 5px;">
				<input type="checkbox" name="chkAgree1" id="chkAgree1">
				<label for="chkAgree1">(필수)인뱀 이용약관</label>	
			</div>
			<p><iframe src="provision.html" width="600" height="250"></iframe></p>
			<div style="text-align: left; margin-left: 30px;border-left-width: 30px;padding-left: 10px;margin-bottom: 5px;">
				<input type="checkbox" name="chkAgree2" id="chkAgree2">
				<label for="chkAgree2">(필수)개인정보 수집 및 이용 동의</label>
		</div>
			<p><iframe src="provision2.html" width="600" height="250"></iframe></p>
				<div style="margin-bottom: 50px;text-align: center; font-size:12px;">
					<input type="submit" value="회원가입"> <input type="reset" value="돌아가기" onclick="history.back(-1);">
				</div>	
			</fieldset>
		</div>
		</form>
	</article>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>