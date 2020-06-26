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
	body{
		background-repeat:no-repeat;
		background-image: url('http://upload3.inven.co.kr/upload/2020/06/16/bbs/i13884237924.jpg');
		background-color: white;
		background-attachment: fixed;
	}
	.agree{
		text-align: center;
		margin: 0 auto;
	}
	
	h2.title {
	    text-align: left;
	}
	
	div txt {
	    text-align: left;
	}
	
	input {
		position: relative;
	}
	

</style>
<body>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmAgree]').submit(function(){
			if(!$('#chkAgree1').is(':checked')){
				alert("약관에 동의하셔야 합니다!");
				$('#chkAgree1').focus();
				event.preventDefault();
			
				if(!$('#chkAgree2').is(':checked')){
					alert("약관에 동의하셔야 합니다!");
					$('#chkAgree2').focus();
					event.preventDefault();
				}
			}
		});
	});
</script>


	<article class="agree">
		<form name="frmAgree" method="post" action="addLogin.jsp">
			<h2 class="title" style="margin-top: 30px;margin-left: 20px;">회원 약관</h2>
			<div style="text-align: left; margin-left: 30px;border-left-width: 30px;padding-left: 10px;margin-bottom: 5px;">
				<input type="checkbox" name="chkAgree1" id="chkAgree1">
				<label for="chkAgree1">(필수)인뱀 이용약관</label>	
			</div>
			<p><iframe src="provision.html" width="650" height="250"></iframe></p>
			<div style="text-align: left; margin-left: 30px;border-left-width: 30px;padding-left: 10px;margin-bottom: 5px;">
				<input type="checkbox" name="chkAgree2" id="chkAgree2">
				<label for="chkAgree2">(필수)개인정보 수집 및 이용 동의</label>
			</div>
			<p><iframe src="provision2.html" width="650" height="250"></iframe></p>
				<div style="margin-bottom: 50px;">
					<input type="submit" value="회원가입"> <input type="reset" value="돌아가기" onclick="history.back(-1);">
				</div>	
		</form>
	</article>
</body>
</html>

<%@ include file="../inc/bottom.jsp" %>