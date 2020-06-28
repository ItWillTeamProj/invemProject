<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	String code = request.getParameter("code");
	
	if(no==null || no.isEmpty()){ %>
	<script type="text/javascript">
		alert("잘못된 url 입니다.");
		location.href="boardList.jsp";
	</script>
	
	<%return;
} 

	//2
	AdminBoardService adminBoardService = new AdminBoardService();
	AdminBoardDTO dto = null;
	
	try{
		dto = adminBoardService.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	
%>

<%@ include file="../inc/top.jsp" %>

<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:15px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리</b>
		</div>
	</div>
	<h3><%=dto.getUserid() %> 님의 상세정보</h3>	
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="게시물목록" onclick="location.href='boardList<%=code %>.jsp'" /> 
	</div>	
	<div>
		<table style="font-size: 90%; border-collapse: collapse; margin-left:10px;
			width:700px; table-layout: fixed;">
			
			<colgroup>
				<col style = "width: 260px">
				<col style = "width: 440px">
			</colgroup>			
			
			<tr style="background:white; border-top:1px solid gray;">
				<td style="padding-left: 30px;">게시물번호</td>
				<td><%=dto.getNo() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">아이디</td>
				<td><%=dto.getUserid() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">제목</td>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">작성일</td>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">추천수</td>
				<td><%=dto.getRecommend() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">조회수</td>
				<td><%=dto.getViews() %></td>
			</tr>
			
			<tr style="background:white;">
				<td style="padding-left: 30px;">카테고리</td>
				<%if(code.equals("F")){%>
				<td>자유게시판</td>
				<%}else{%>
				<td>기타게시판</td>
				<%}%>
			</tr>
			<tr style="border-bottom:1px solid gray;">
				<td style="padding-left: 30px;">내용</td>
				<td style="word-break:break-all"><%=dto.getDescribe()%></td>
			</tr>
			
		</table>
				
		<div class="center" style="text-align: right; margin: 10px;">
			<input type="Button" value="게시물수정" onclick="location.href='boardEdit.jsp?no=<%=dto.getNo() %>'" />  
		</div>
	</div>
	
</article>	
<%@ include file="../inc/bottom.jsp" %>