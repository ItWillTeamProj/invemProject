<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>  
<article>
	<%-- ADMIN 첫 화면 --%>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 9px;">
			<h4>관리자 페이지</h4>
		</div>
	</div>
	<div style="float:left; width:360px; height:240px; background-color: pink;
		margin-top:5px;">
		<a href="<%=request.getContextPath() %>/admin/memberList.jsp">
			<img src="<%=request.getContextPath() %>/images/admin/member.png" 
			style="width:auto; height:240px;" >
		</a>
	</div>	
	
	<div style="float:left; width:360px; height:240px; background-color: lightblue;
		margin-top:5px;">
		<a href="<%=request.getContextPath() %>/admin/boardSelect.jsp">
			<img src="<%=request.getContextPath() %>/images/admin/board.png" 
			style="width:auto; height:230px; margin-top:20px; margin-left: 5px;" >
		</a>
	</div>

</article>	
<%@ include file="../inc/bottom.jsp" %>