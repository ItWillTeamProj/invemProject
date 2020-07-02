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
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리 - 메인페이지</b>
		</div>
	</div>
	
	<div style="float:left; width:345px; height:320px;
		margin:0px 5px 5px 10px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/boardList.gg?code=<%="F"%>">
			<img src="<%=request.getContextPath() %>/images/admin/childboard.png" 
			style="width:auto; height:210px; margin-top: 28px;" >
			<br><br>
			<b style="font-size: 30px; color: black;">자유게시판</b>
		</a>
	</div>
	
	<div style="float:left; width:345px; height:320px;
		margin:0px 10px 10px 5px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/boardList.gg?code=<%="E"%>">
			<img src="<%=request.getContextPath() %>/images/admin/childboard.png" 
			style="width:auto; height:210px; margin-top: 28px;" >
			<br><br>
			<b style="font-size: 30px; color: black;">기타게시판</b>
		</a>
	</div>
	
	<div style="float:left; width:345px; height:320px;
		margin:0px 5px 5px 10px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/boardList.gg?code=<%="A"%>">
			<img src="<%=request.getContextPath() %>/images/admin/write.png" 
			style="width:auto; height:210px; margin-top: 28px;" >
			<br><br>
			<b style="font-size: 30px; color: black;">공지사항</b>
		</a>
	</div>
	
	<div style="float:left; width:345px; height:320px;
		margin:0px 10px 10px 5px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/admin.gg">
			<img src="<%=request.getContextPath() %>/images/admin/admin.png" 
			style="width:auto; height:210px; margin-top: 28px;" >
			<br><br>
			<b style="font-size: 30px; color: black;">관리자 메인 페이지</b>
		</a>
	</div>
	
	</article>
<%@ include file="../inc/bottom.jsp" %>