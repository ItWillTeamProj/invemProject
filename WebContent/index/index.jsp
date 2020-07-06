<%@page import="java.util.Properties"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@page import="com.invem.common.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../inc/top.jsp" %>
<%
	Properties prop = (Properties)request.getAttribute("prop");
	ChampionVO champVo = (ChampionVO)request.getAttribute("champVo");
	String video = prop.getProperty(Integer.toString(champVo.getChamp_no()));
	video =	video.replace("watch?v=", "embed/").replace("&", "?");
%>
<article>

	<%-- 첫 화면 입니다 --%>
		<div class="grid" id="grid1" style="float:left;">

		<div style="border-bottom: 1px solid lightgray; padding-top:3px;
			width:348px; height:25px; ">
			<div style="padding-top:2px; overflow: hidden;">
				<span style="float: left; padding-left: 10px;">챔피언 소개 : ${champVo.name }</span>
				<a href="<c:url value='/champion/detail.gg?no=${champVo.champ_no }' />"
					style="float: right; padding-right: 10px;">자세히</a>
			</div>
		</div>

		<div style="text-align: left; font-size: 1.2em; padding: 10px; width: 320px; margin: 0 auto;">
			<span><%=Utility.cutString(champVo.getDescribe(), 30) %> </span>
		</div>
			<br>
			<span style="margin-left: 20px; font-size: 1.2em; display: inline-block;
				margin-bottom: 10px">[${champVo.name } 소개 영상]</span>
		<div style="text-align: center;">
			<iframe style="width:320px; height:183px;"
			src="<%= video %>"
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen>
			</iframe>
		</div>

	</div>
	<div class="grid" style="float: left;">
		<table class="table table-striped" style="clear: both;">
		<colgroup>
			<col width="50%">
			<col width="20%">
			<col width="15%">
			<col width="15%">
		</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
			<c:if test="${empty bdList }">
				<tr>
					<td colspan="4" style="text-align: center;">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty bdList }">
				<c:forEach begin="0" end="${fn:length(bdList) }" var="i">
					<c:set value="${bdList[i] }" var="bdVO"/>
					<c:if test="${i < 5 }">
						<tr>
							<td><a href='<c:url value="/board/detail.gg?no=${bdVO.no }&code=${bdVO.cat_code }&delflag=${bdVO.delflag }"/>'>${bdVO.title }</a></td>
							<c:if test="${bdVO.userid == null || empty bdVO.userid || bdVO.userid == 'unknown'}">
								<td>${bdVO.nonuserid }</td>
							</c:if>
							<c:if test="${!empty bdVO.userid && bdVO.userid != 'unknown' }">
								<td>${bdVO.userid }</td>
							</c:if>
							<td>${bdVO.views }</td>
							<td>${bdVO.recommend }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div style="clear: both; width: 98%; height: auto;" class="grid">
		<table class="table table-striped" style="width: 100%">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
			<tr>
				<th>LOL 공지사항</th>
				<th style="overflow: hidden;">내용<a href="<%=request.getContextPath() %>/board/riotNotice.gg" style="float: right;">더보기</a></th>
			</tr>
			<c:forEach var="msg" items="${messages }">
				<tr>
					<td>${msg.heading }</td>
					<td>${fn:substring(msg.content,0,30) }...</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</article>
<%@ include file="../inc/bottom.jsp" %>
