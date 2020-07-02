<%@page import="com.invem.common.LeagueVO"%>
<%@page import="com.invem.common.SummonerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//String userid = (String)request.getAttribute("userid");
	int cnt = (int)request.getAttribute("writeCount");
	int replyCnt = (int)request.getAttribute("replyCount");
	String test = request.getParameter("test1");
	SummonerVO smVo =  (SummonerVO)request.getAttribute("smVo");
	LeagueVO lgVo = (LeagueVO)request.getAttribute("lgVo");
%>
<div id="tabs-1">
	<div style="margin-top: 10px; width: 100%; height:61px;
		background-size:1s00%; color:white; font-size: 30px; margin-bottom:10px; 
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>${param.userid }님의 블로그</b>
		</div>
	</div>
	<div style="background: whitesmoke; ">
		<div style="padding-top: 7px; width:240px; float: left;">
					<div id="InfoDesk" style = "overflow: hidden;width: 100%;">
						<c:if test="${!empty smVo }">
							<img id="tier" style = "float: left;" alt="<%=lgVo.getTier()%>" src="<%=request.getContextPath() %>/images/tier/<%=lgVo.getTier().toLowerCase()%>.png"/>
						</c:if>
						<c:if test="${empty smVo }">
							<img id="tier" src="<%=request.getContextPath() %>/images/tier/1445.png"/>
							<p class="userInfo">일치하는 소환사 명이 없습니다.</p>
						</c:if>
				   		
					</div>
				
			</div>
					<div class="userInfo" style = "float: left; margin-left: 50px">
						<p>아이디 : ${param.userid }</p>
						<p>소환사 명 : <%=smVo.getName() %></p>
						<p>레벨 : <%=smVo.getSummonerLevel() %></p>
						<p>티어 : <%=lgVo.getTier() %></p>
						<p>랭크 : <%=lgVo.getRank() %></p><br><br>
						<b>지금까지 작성한 게시물 수는 <%=cnt %>건입니다.</b><br>
						<b>지금까지 작성한 댓글 수는 <%=replyCnt %>건입니다.</b>
					</div>
	</div>
</div>
