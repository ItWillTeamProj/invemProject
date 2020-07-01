<%@page import="com.invem.common.LeagueVO"%>
<%@page import="com.invem.common.SummonerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userid=(String)session.getAttribute("userid");
	SummonerVO smVo=(SummonerVO)session.getAttribute("smVo");
	LeagueVO lgVo=(LeagueVO)session.getAttribute("lgVo");

	boolean isLogin=false;
	if((String)session.getAttribute("userid")!=null && !((String)session.getAttribute("userid")).isEmpty()){
		
		isLogin=true;
	}
	
	System.out.println(userid + ", " + isLogin + ", " + smVo + ", " + lgVo);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" type="text/css">
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
		//-- 버튼 클릭시 버튼을 클릭한 위치 근처에 레이어 생성 --//
		$('.aSelect').click(function(e) {
		 var divTop = e.pageY - 15; //상단 좌표
		 var divLeft = e.pageX + 20; //좌측 좌표
		 $('#divLangSelect').css({
		     "top": divTop
		     ,"left": divLeft
		     , "position": "absolute"
		 }).show();
		});

		$( "#menu" ).menu();
		$(document).mouseup(function (e){
	    var container = $('#divLangSelect');
	    if( container.has(e.target).length === 0){
			container.css('display','none');
	    }
	  });

		$('#logout').click(function(){
			var logout = confirm("로그아웃 하시나요?");
			if(logout){
				location.href="<%=request.getContextPath()%>/login/logout.gg";
			}else{
				alert("잘 생각하셨습니다.");
				event.preventDefault();
			}
		});
	});
</script>
</head>
<style type="text/css">
body {
	background-repeat: no-repeat;
	background-image:
		url('<%=request.getContextPath()%>/images/backimage.jpg');
	background-color: white;
	background-attachment: fixed;
}
#loginBtn{
	border-radius: 0.5em;
	border-color: #6db92a;
	background-color:white;
	margin-top: 7px; margin-left: 18px;
	margin-bottom: 5px;
}
span{
	color:black;
}
html{
	font-size:15px;
}
</style>
<body>
<div class="container" >
	<div class="header" style="background-color: rgb(0, 0, 60);">
		<a href="<%=request.getContextPath() %>/index.gg">
			<img src="<%=request.getContextPath() %>/images/index/bar_invem.png"
			alt="인뱀로고" name="Insert_logo" id="Insert_logo"
			style="width:auto; height:43px; padding:6px 5px 5px 5px; margin-left:55px " align="left"/>
		</a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/bar_lol.png"
			alt="롤로고" name="Insert_logo" id="Insert_logo"
			style="width:auto; height:46px; padding:6px 5px 5px 5px; margin-left:235px;" align="left"/>
		</a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/bar_youtube.png"
			alt="유튜브" name="Insert_logo" id="Insert_logo"
			style="width:auto; height:41px; padding:10px 5px 5px 5px; margin-left:270px;" align="left"/>
		</a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/bar_facebook.png"
			alt="페이스북" name="Insert_logo" id="Insert_logo"
			style="width:auto; height:41px; padding:11px 5px 5px 5px; margin-left:7px;" align="left"/>
		</a>
		<a href="#">
			<img src="<%=request.getContextPath() %>/images/index/bar_twitter.png"
			alt="트위터" name="Insert_logo" id="Insert_logo"
			style="width:auto; height:39px; padding:12px 5px 5px 5px; margin-left:7px;" align="left"/>
		</a>


	</div>
	<!-- end .header -->

	<div class="sidebar1">
		<div style="background: whitesmoke; padding-top: 7px; width:240px;">
			<%if(!isLogin){ %>
				<div style="margin-left: 9px;">
					<button id="loginBtn" style="margin-top: 15px;" onclick="location.href='<%=request.getContextPath() %>/login/login.gg'">
		    			<img src="<%=request.getContextPath() %>/images/invemlogin.png">
		    			<span style="padding-left: 5px; vertical-align:sub; margin-right: 10px;">로그인</span>
	    			</button>

					<div style="font-size:12.5px; margin-top:10px; color=black; text-align: center;">
					<a href="<%=request.getContextPath()%>/login/agreement.gg" style="margin-left:2px;">회원가입</a>
					<a href="<%=request.getContextPath()%>/login/munhi.gg" style="margin-left:15px;">아이디·비밀번호찾기</a></div>
				<br>
				</div>
			<%}else{ %>
				<div id="InfoDesk">
					<c:if test="${!empty smVo }">
						<img id="tier" alt="<%=lgVo.getTier()%>" src="<%=request.getContextPath() %>/images/tier/<%=lgVo.getTier().toLowerCase()%>.png"/>
						<div class="userInfo">
							<p>아이디 : <%=userid %></p>
							<p>소환사 명 : <%=smVo.getName() %></p>
							<p>레벨 : <%=smVo.getSummonerLevel() %></p>
							<p>티어 : <%=lgVo.getTier() %></p>
							<p>랭크 : <%=lgVo.getRank() %></p>
						</div>
					</c:if>
					<c:if test="${empty smVo }">
						<img id="tier" src="<%=request.getContextPath() %>/images/tier/1445.png"/>
						<p class="userInfo">일치하는 소환사 명이 없습니다.</p>
					</c:if>
			   		<div style="font-size:15px; clear: both; color=black;">
						<a href="<%=request.getContextPath()%>/login/logout.gg" style="padding-right: 10px;" id = "logout">로그아웃</a>
						<a href="<%=request.getContextPath()%>/member/memberEdit.gg">회원정보수정</a>
			  	 	</div>
				</div>
			<%} %>
		</div>
	<ul class="nav">
		<li><a href="<%=request.getContextPath()%>/index.gg">INVEM HOME</a></li>
		<li><a href="<%=request.getContextPath()%>/board/riotNotice.gg">LOL 공지사항</a></li>
		<li><a href="<%=request.getContextPath()%>/champion/list.gg">챔피언정보</a></li>
		<li><a href="<%=request.getContextPath()%>/board/boardList.gg?code=F">자유게시판</a></li>
		<li><a href="#">베스트공략</a></li>
		<li><a href="<%=request.getContextPath()%>/compony/compony.gg">회사정보</a></li>
	</ul>
	</div>
	<!-- end .sidebar1 -->
	<div class="content">
