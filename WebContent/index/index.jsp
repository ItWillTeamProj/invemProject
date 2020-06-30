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

	<div>
		<a href="<%=request.getContextPath() %>/admin/admin.jsp">관리자</a>
	</div>
</article>
<%@ include file="../inc/bottom.jsp" %>
