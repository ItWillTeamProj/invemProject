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
	<a href="<%=request.getContextPath()%>/admin/boardList.jsp?code=<%="F"%>"><div>자유게시판</div></a>
	<a href="<%=request.getContextPath()%>/admin/boardList.jsp?code=<%="E"%>"><div>기타게시판</div></a>
	<div style="text-align: right; margin: 10px;">
		<input type="Button" value="게시물작성" onclick="location.href='boardWrite.jsp'" />
	</div>	
		
		
		
	</article>
<%@ include file="../inc/bottom.jsp" %>