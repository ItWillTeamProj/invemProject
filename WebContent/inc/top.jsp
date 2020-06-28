<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid=(String)session.getAttribute("userid");

	boolean isLogin=false;
	if(userid!=null && !userid.isEmpty()){
		isLogin=true;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	});
</script>
</head>
<body>
<div class="container">
	<div class="header">
		<a href="<%=request.getContextPath() %>/index/index.jsp">
		<img src="<%=request.getContextPath() %>/images/index/invem.png" alt="인뱀로고" name="Insert_logo" id="Insert_logo"
			width="240" height="90" align="left"/></a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/top.png" alt="lck2020" name="Insert_logo" id="Insert_logo"
				width="720" height="90"/></a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/logo.png" alt="롤로고" name="Insert_logo" id="Insert_logo"

				width="240" height="90" align="right"/></a>
	<!-- end .header --></div>

	<div class="sidebar1">
		<div style="background: whitesmoke;margin-top: 20px;">
	 	<span style="color:black; margin-left:45px;">리그오브레전드 인뱀</span><br>

			<%if(!isLogin){ %>
				<div class="login" style="margin-left: 15px;">
					<button style="border-radius: 0.5em;border-color: #6db92a;background-color:white;margin-top: 5px;margin-left: 11px;margin-bottom: 5px;" onclick="location.href='../login/login.gg'">
	    			<img src="<%=request.getContextPath()%>/images/invemlogin.png"><span style="padding-left: 5px;vertical-align:15px;margin-right: 10px;">로그인</span></button>
					<li style="font-size:10px" color=black;><a href="<%=request.getContextPath()%>/login/agreement.gg" style="margin-left: 2px;">회원가입</a>
					<a href="<%=request.getContextPath()%>/login/munhi.gg" style="margin-left: 25px;">아이디·비밀번호찾기</a></li>
				<br>
				</div>
			<%}else{ %>
				<img alt="브론즈" src="../images/bronze.png">
		   		<div style="font-size:10px" color=black;>
					<li><a href="<%=request.getContextPath()%>/login/logout.gg" style="margin-left: 4px;">로그아웃</a>
					<a href="<%=request.getContextPath()%>/member/memberEdit.gg" style="margin-left: 45px;">회원정보수정</a></li>
		  	 	</div>
			<%} %>
	</div>
	<ul class="nav">
		<li><a href="<%=request.getContextPath()%>/index.gg">INVEM HOME</a></li>
		<li><a href="<%=request.getContextPath()%>/champion/list.gg">챔피언정보</a></li>
		<li><a href="<%=request.getContextPath()%>/board/boardList.gg">자유게시판</a></li>
		<li><a href="#">베스트공략</a></li>
		<li><a href="#">화이팅</a></li>
	</ul>
	<!-- end .sidebar1 --></div>
	<div class="content">
