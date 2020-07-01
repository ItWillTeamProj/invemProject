<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>  
<article>
	<%-- ADMIN 첫 화면 --%>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>관리자 메인페이지</b>
		</div>
	</div>
	<div style="float:left; width:345px; height:320px;
		margin:0px 5px 5px 10px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/memberList.gg">
			<img src="<%=request.getContextPath() %>/images/admin/member.png" 
			style="width:auto; height:260px;" >
			<br>
			<b style="font-size: 30px; color: black;">회원관리</b>
		</a>
	</div>	
	
	<div style="float:right; width:345px; height:320px;
		margin:0px 10px 10px 5px; text-align: center; background: white;">
		<a href="<%=request.getContextPath() %>/admin/boardSelect.gg">
			<img src="<%=request.getContextPath() %>/images/admin/board.png" 
			style="width:auto; height:235px; margin-top:25px; margin-left: 5px;" >
			<br>
			<b style="font-size: 30px; color: black;">게시판관리</b>
		</a>
	</div>

</article>	
<%@ include file="../inc/bottom.jsp" %>