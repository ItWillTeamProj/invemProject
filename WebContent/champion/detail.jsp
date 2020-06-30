<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Properties"%>
<%@page import="com.invem.champion.model.AbilityVO"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%
	String no = request.getParameter("no");
	ChampionVO cVo = (ChampionVO)request.getAttribute("cVo");
	Properties previewProp = (Properties)request.getAttribute("previewProp");

	response.addHeader("X-Frame-Options", "DENY");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/champion/detail.css">

<script type="text/javascript">


	$(function() {
		$("#tabs").tabs();

		$(".content1").addClass("contentHide");

		$("#reply .row1").each(function(){
			$(this).click(function() {
				var parent = $(this).parent().next();
				$(".content1").not(parent).each(function() {
					$(this).addClass("contentHide");
				});
				
				if($(parent).hasClass("contentHide")){
					$(parent).toggleClass("contentHide");
				}else{
					$(parent).addClass("contentHide");
				}
			});
		});
		
		var result = '${userid}';
		if(result == '' || result == 'unknown'){
			result = '로그인을 하세요';
		}
		$("#userid").val(result);

	});

</script>
<style type="text/css">

</style>
<article>
<div class="title">
		<h2>${cVo.name }</h2>
	</div>
	<nav id="tabs">
		<ul class="nav nav-tabs">
		    <li><a href="#tabs-1" class="active">챔피언 정보</a></li>
		    <li><a href="#tabs-2">능력치</a></li>
		    <li><a href="#tabs-3">챔피언 소개</a></li>
		  </ul>
		<div id="tabs-1" style="background-image: url('../images/championSkin/s<%=no%>.jpg');">
			<div id="icon">
				<div><img alt="icon" src="<%=request.getContextPath()%>/images/championIcon/i<%=no%>.png" style="width: 126px; height: 126px;"></div>
				<div><img alt="icon" src="<%=request.getContextPath()%>/images/champion/frame.png" style="width: 130px; height: 130px;"></div>
			</div>
			<div id="detail">
				<p style="font-size: 1.3em; font-weight: bold; color: #ff7f00"><%=cVo.getName() %></p>
				<p style="font-size: 0.8em; color: #b1a5c8"><%=cVo.getNickname() %></p>
				<p style="font-size: 0.7em; color: #ece9ec ">
				<label style="color: #ff7f00;">능력치</label> : <%=cVo.getSkill() %>
				</p>
			</div>
			<div id="describe">
				<p style="font-size: 15px; color: #ece9ec; line-height: 2em;"><%=cVo.getDescribe() %></p>
			</div>
		</div>
		<div id="tabs-2">
			<c:set var="myArray" value="${fn:split(avility,',')}" />
			<%@ include file="avilityTable.jsp" %>

			<div class="view"><span style="color: #d9e5f7">챔피언 소개 영상</span></div>

			<div class="video-container">
	    		<div class="jetpack-video-wrapper">
	    		<span class="embed-youtube" style="text-align:center; display: block;">
	    			<iframe class="youtube-player"
	    			 src="<%=previewProp.getProperty(no).replace("watch?v=", "embed/").replace("&", "?") %>"
	    			 allowfullscreen
	    			 style="border: 1px solid #d9e5f7; display: block; margin: 0px; width: 99%;
	    			 height: 210px;"
	    			 data-ratio="0.5625" data-width="560" data-height="315">
	   			 	</iframe>
	   			 </span>
	   			 </div>
	 		</div>
		</div>
		<div id="tabs-3">
		<p style="padding: 10px; font-weight: bold;"><%=cVo.getDescribe() %></p>
		</div>
	</nav>
	<div>
	<%@include file="replyList.jsp" %>
	<%@include file="replyInsert.jsp" %>
	</div>


<!-- 폼 레이어  -->
<div id="divLangSelect" style="background: #fff0">
<ul id="menu">
  <li><div><a>블로그 가기</a></div></li>
  <li><div><a>작성글, 댓글보기</a></div></li>
</ul>
</div>
<!-- //폼 레이어  -->
</article>
<%@ include file="../inc/bottom.jsp"%>
