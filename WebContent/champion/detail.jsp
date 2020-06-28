<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Properties"%>
<%@page import="com.invem.champion.model.AbilityVO"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	String no = request.getParameter("no");
	ChampionVO cVo = (ChampionVO)request.getAttribute("cVo");
	Properties previewProp = (Properties)request.getAttribute("previewProp");

	response.addHeader("X-Frame-Options", "DENY");
%>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/champion/detail.css">

<script type="text/javascript">

	
	$(function() {
		$("#tabs").tabs();
		
		$(".content1").addClass("contentHide");
		
		$("#reply .row1").each(function(){
			$(this).click(function() {
				$(".content1").each(function() {
					$(this).addClass("contentHide");
				});
				$(this).parent().next().toggleClass("contentHide");
			});
		});
		
		$( "#menu" ).menu();
		
		$(document).mouseup(function (e){

		    var container = $('#divLangSelect');

		    if( container.has(e.target).length === 0){

		      container.css('display','none');

		    }

		  });
		
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
			
			<div class="view"><span>챔피언 소개 영상</span></div>
		
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
	</nav>
	<div>
	<%@include file="replyList.jsp" %>
	<%@include file="replyInsert.jsp" %>
	</div>


<!-- 폼 레이어  -->
<div id="divLangSelect" style="background: #fff0">
<ul id="menu">
  <li><div>블로그 가기</div></li>
  <li><div>작성글, 댓글보기</div></li>
  <li><div>댓글 삭제</div></li>
</ul>
</div>
<!-- //폼 레이어  -->
</article>
<%@ include file="../inc/bottom.jsp"%>