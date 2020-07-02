<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

	AdminBoardDTO dto = (AdminBoardDTO)request.getAttribute("dto");
	code = (String)request.getAttribute("code");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>

<%@ include file="../inc/top.jsp" %>

<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:15px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리 - 게시물 상세정보</b>
		</div>
	</div>
	<h3></h3>	
	
	<div>
		<table style="font-size: 100%; border-collapse: collapse; margin-left:10px;
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
				<td><%=sdf.format(dto.getRegdate()) %></td>
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
				<%}else if(code.equals("E")){%>
				<td>기타게시판</td>
				<%}else if(code.equals("A")){%>
				<td>공지사항</td>
				<%} %>
			</tr>
			<tr style="border-bottom:1px solid gray;">
				<td style="padding-left: 30px;">내용</td>
				<td style="word-break:break-all"><%=dto.getDescribe()%></td>
			</tr>
			
		</table>
				
		<div class="center" style="text-align: center; margin: 10px;">
			<input type="Button" value="수정" onclick="location.href='<%=request.getContextPath()%>/admin/boardEdit.gg?no=<%=dto.getNo() %>&code=<%=code %>'" />
			<input type="Button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/admin/boardDelete.gg?no=<%=dto.getNo() %>&code=<%=code %>'" />
			<input type="Button" value="목록" onclick="location.href='<%=request.getContextPath()%>/admin/boardList.gg?code=<%=code%>'" />
		</div>
	</div>
	
</article>	
<%@ include file="../inc/bottom.jsp" %>