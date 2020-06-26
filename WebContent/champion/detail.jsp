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
		$(".content1").hide();
		$("#tabs").tabs();
		
		$("#reply tr").each(function() {
			$(this).click(function() {
				$(this).next().show();
			});
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
	<div>
	<table style="border: 1px solid gray; border-collapse: collapse; width: 600px;" id="reply">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>1</td>
			<td>java</td>
			<td>kim</td>
			<td>0909</td>
		</tr>
		<tr class="content1"><td colspan="4">아무말대잔치</td></tr>
		<tr>
			<td>2</td>
			<td>oracle</td>
			<td>lee</td>
			<td>0930</td>
		</tr>
		<tr class="content1"><td colspan="4">가나다라마바사</td></tr>
	</table>
	</div>
</article>
<%@ include file="../inc/bottom.jsp"%>