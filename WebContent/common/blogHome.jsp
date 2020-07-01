<%@page import="com.invem.common.LeagueVO"%>
<%@page import="com.invem.common.SummonerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//String userid = (String)request.getAttribute("userid");
	int cnt = (int)request.getAttribute("writeCount");
	String test = request.getParameter("test1");
	SummonerVO smVo =  (SummonerVO)request.getAttribute("smVo");
	LeagueVO lgVo = (LeagueVO)request.getAttribute("lgVo");
%>
<div id="tabs-1">
	<h1>${param.userid }님의 블로그 홈 화면입니다.</h1>
	<h3>여기에는 기본적인 회원 정보 와 지금껏 작성한 게시물 수 등을 출력할 예정입니다.</h3>
	<h5>현재 include한 페이지 blogHome.jsp</h5>
	<p>지금까지 작성한 게시물 수는 <%=cnt %>건입니다.</p>
	<p>${param.userid }</p>
	<div style="background: whitesmoke; padding-top: 7px; width:240px;">
				<div id="InfoDesk">
					<c:if test="${!empty smVo }">
						<img id="tier" alt="<%=lgVo.getTier()%>" src="<%=request.getContextPath() %>/images/tier/<%=lgVo.getTier().toLowerCase()%>.png"/>
						<div class="userInfo">
							<p>아이디 : ${param.userid }</p>
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
			   		
				</div>
			
		</div>
</div>
