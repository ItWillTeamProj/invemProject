<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
			<h2>회원 약관</h2>
				<input type="checkbox" name="chkAgree1" id="chkAgree1">
				<label>(필수)인뱀 이용약관</label>	
			<p><iframe src="provision.html" width="820" height="300"></iframe></p>
				<input type="checkbox" name="chkAgree2" id="chkAgree2">
				<label>(필수)개인정보 수집 및 이용 동의</label>
			<p><iframe src="provision2.html" width="820" height="300"></iframe></p>
				<div class="center">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</div>	
		</form>
	</article>
</body>
</html>