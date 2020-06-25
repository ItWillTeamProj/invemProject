<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Properties"%>
<%@page import="com.invem.champion.model.AbilityVO"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
	String no = request.getParameter("no");
	ChampionVO cVo = (ChampionVO)request.getAttribute("cVo");
%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/champion/detail.css">

<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
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
		    <li><a href="#tabs-3">스토리</a></li>
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
		<fmt:bundle basename="../config/preview.properties">
		<fmt:message key="1"/>
		<c:set var="myArray" value="${fn:split(avility,',')}" />
		<%@ include file="avilityTable.jsp" %>
		
		<div class="video-container">
    		<div class="jetpack-video-wrapper">
    		<span class="embed-youtube" style="text-align:center; display: block;">
    			<iframe class="youtube-player"
    			 src="https://www.youtube.com/embed/dFVxGRekRSg?version=3&rel=1&fs=1&autohide=2&showsearch=0&showinfo=1&iv_load_policy=1&wmode=transparent" 
    			 allowfullscreen="true" 
    			 style="border: 0px; display: block; margin: 0px; width: 100%; height: 210px;" 
    			 data-ratio="0.5625" data-width="560" data-height="315">
   			 </iframe></span></div>
		</div>
		</fmt:bundle>
		</div>
		<div id="tabs-3">
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
				potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
				rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
				Class aptent taciti sociosqu ad litora torquent per conubia nostra,
				per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
				commodo pellentesque. Praesent eu risus hendrerit ligula tempus
				pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
				lacus.</p>
			<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
				semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
				justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
				potenti. Donec mattis, pede vel pharetra blandit, magna ligula
				faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
				Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
				lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
				vehicula velit eu tellus interdum rutrum. Maecenas commodo.
				Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
				hendrerit hendrerit.</p>
		</div>
	</nav>
</article>
<%@ include file="../inc/bottom.jsp"%>