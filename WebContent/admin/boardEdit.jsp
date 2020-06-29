<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	String code = request.getParameter("code");
	
	if(no==null || no.isEmpty()){ %>
	<script type="text/javascript">
		alert("잘못된 url 입니다.");
		location.href="boardList.jsp?code=<%=code%>";
	</script>
	
	<%return;
	}
	
	AdminBoardService adminBoardService = new AdminBoardService();
	AdminBoardDTO dto = null;
	
	try{
		dto = adminBoardService.selectByNo(Integer.parseInt(no));				
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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
	<h3><%=dto.getUserid() %> 님의 게시물수정</h3>
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="게시물 상세정보" onclick="location.href='boardDetail.jsp?no=<%=no %>&code=<%=code %>'" />  
		<input type="Button" value="게시물 목록" onclick="location.href='boardList.jsp?code=<%=code %>'" />  
	</div>	
	<form name="boardEdit" method="post" action="boardEdit_ok.jsp">
		<!-- 수정 시 no가 필요 hidden에 담아서 보낸다 -->
		<input type="hidden" name="no" value="<%=no %>">
		<table style="font-size: 100%; border-collapse: collapse; margin-left:10px;
			width:700px;">
			<tr style="background:white; border-top:1px solid gray;">
				<td style="padding-left: 30px;">게시물번호</td>
				<td><input type="text" readonly id="no" name="no" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=no %>"/></td>
	            <td># 게시물번호 수정불가</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">아이디</td>
				<td><input type="text" id="id" name="id"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getUserid() %>" /></td>
	            <td>#아이디 수정불가</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">제목</td>
				<td><input type="text" id="title" name="title" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getTitle() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">작성일</td>
				<td><input type="text" readonly id="regdate" name="regdate" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=sdf.format(dto.getRegdate()) %>"/></td>
	            <td># 작성일 수정불가</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">카테고리</td>
		        <td>
		        	<select name="category" style="margin-left:100px; height:23px;">
						<option value="F" <%if(code.equals("F")){%>
						selected="selected"	<%} %>>자유게시판</option>
						<option value="E" <%if(code.equals("E")){%>
						selected="selected"	<%} %>>기타게시판</option>
					</select>
		        </td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="border-bottom:1px solid gray;">
				<td style="padding-left: 30px;">내용</td>
				<td><input type="text" id="describe" name="describe" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getDescribe() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
		</table>
		<div style="text-align:right; margin:10px;">
			<input type="submit" value="수정완료"/>
        </div>
	</form>

</article>
<%@ include file="../inc/bottom.jsp" %>