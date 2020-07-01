<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../inc/top.jsp" %>  
	<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리</b>
		</div>
	</div>
	
	<p style="font-size: 18.7px; font-weight: bold; margin-top: 15px;">게시판종류</p> <!-- 억지로맞춤 -->
	
	<div style="float:left; width:300px; height:320px;
		margin:5px 20px 10px 30px; text-align: center; background: white;">
		<a href="<%=request.getContextPath()%>/admin/boardList.jsp?code=<%="F"%>">
			<img src="#">
			<br>
			<b style="font-size: 30px; color: black;">자유게시판</b>
		</a>
		
	</div>	
	
	<div style="float:left; width:300px; height:320px;
		margin:5px 30px 10px 20px; text-align: center; background: white;">
		<a href="<%=request.getContextPath()%>/admin/boardList.jsp?code=<%="E"%>">
			<img src="#">
			<br>
			<b style="font-size: 30px; color: black;">기타게시판</b>
		</a>
		
	</div>

	<div style="text-align: right; margin: 10px;">
		<input type="Button" value="게시물작성" onclick="location.href='boardWrite.jsp'" />
		<input type="Button" value="관리자 메인 페이지" onclick="location.href='admin.jsp'" />
	</div>	
		
		
		
	</article>
<%@ include file="../inc/bottom.jsp" %>