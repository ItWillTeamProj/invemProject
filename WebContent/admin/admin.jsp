<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>  
<article>
	<%-- ADMIN 첫 화면 --%>
	<a href="memberList.jsp">
    	<div style="width:360px; height:600px; float:left;
    		background: rgba(255, 220, 220, 0.5); text-align: center;">
			<img src="../img/member.png" alt="member" 
				style="width:80%; margin-top: 80px; margin-left: 10%; margin-right: 10%;" />
			<b style="font-size: 300%; color: black;">회원관리</b>
		</div>
    </a>
    <a href="#">
    	<div style="width:360px; height:600px; float:right;
    		background: rgba(170, 220, 250, 0.5); text-align: center;">
			<img src="../img/board.png" alt="board" 
				style="width:80%; margin-top: 80px; margin-left: 10%; margin-right: 10%;" />
			<b style="font-size: 300%; color: black; ">게시판관리</b>
		</div>
	</a>
</article>	
<%@ include file="../inc/bottom.jsp" %>