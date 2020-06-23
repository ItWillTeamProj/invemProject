<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="invem_index.css" type="text/css">
<title>invem_index</title>
<script type="text/javascript">
$(function(){
	$('#login[type=login]').submit(function(){
		if($('#userid').val().length<1){
			alert('아이디를 입력하세요');
			$('#userid').focus();
			event.preventDefault();
		}else if($('#pw').val().length<1){
			alert('비밀번호를 입력하세요');
			$('#pw').focus();
			event.preventDefault();
		}
	});
	$('#login[type=login]').submit(function(){
	
});

</script>
</head>
<body>
<div class="container">
	<div class="header">
		<a href="#">
		<img src="img/index/invem.png" alt="인벰로고" name="Insert_logo" id="Insert_logo"
			width="240" height="90" align="left"/></a>
		<a href="#">
			<img src="img/index/top.png" alt="lck2020" name="Insert_logo" id="Insert_logo"
				width="720" height="90"/></a> 
		<a href="#">
			<img src="img/index/logo.png" alt="롤로고" name="Insert_logo" id="Insert_logo"
				width="240" height="90" align="right"/></a>		
	<!-- end .header --></div>
        
	<div class="sidebar1">
		<div class="logindiv">
	 	<span>로그인</span>
		<ul class="login">
		   	<li>아이디　 <input type="text" name="userid" id="userid" class="userid"/></li>
		   	<li>비밀번호 <input type="password" name="pw" id="pw" class="pw"/></li>
		   	<li><a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a>
			<a href="<%=request.getContextPath()%>/login/agreement.jsp">회원가입</a></li>
		</ul>
	</div>
	<ul class="nav">
		<li><a href="#">INVEM HOME</a></li>
		<li><a href="#">챔피언정보</a></li>
		<li><a href="#">자유게시판</a></li>
		<li><a href="#">베스트공략</a></li>
		<li><a href="#">화이팅</a></li>
	</ul>
	<!-- end .sidebar1 --></div>
	  
	<div class="content">