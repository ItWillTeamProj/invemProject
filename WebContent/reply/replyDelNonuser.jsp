<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	String code = request.getParameter("code");
	String cnt = request.getParameter("cnt");
	String groupno = request.getParameter("groupno");
	if(cnt == null || cnt.isEmpty()){
		cnt = "0";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src= "<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	if("<%=cnt%>" == "1"){
		
		opener.location.href = "<%=request.getContextPath()%>/reply/replyDelete_ok.gg?no=<%=no%>&code=<%=code%>&groupno=<%=groupno%>";
		self.close();
	}
	
	$('#cancel').click(function(){
		self.close();
	});
	$('form[name=frmCheckPwd]').submit(function(){
		if($('#pwd').val()==''){
			alert('비밀번호를 입력하세요');
			event.preventDefault();
		}
	});
});
</script>
</head>
<body>
<form name = "frmCheckPwd" method="post" action="<%=request.getContextPath()%>/reply/replyDelete.gg">
	<p>댓글 작성 시 비밀번호 입력</p>
	<input type = "password" name = "pwd" id = "pwd" size = "30"><br>
	<input type = "hidden" name = "no" value = "<%=no %>">
	<input type = "hidden" name = "code" value = "<%=code %>">
	<input type = "hidden" name = "cnt" value = "<%=cnt %>">
	<input type = "hidden" name = "groupno" value = "<%=groupno %>">
 	<div style = "text-align: center">
		<input type = "submit" value = "확인">
		<input type = "button" id = "cancel" value = "취소">
	</div>
</form>
</body>
</html>