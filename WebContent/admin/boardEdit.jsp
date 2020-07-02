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
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리 - 게시물수정</b>
		</div>
	</div>
	
	<div>
		<form name="frmEdit" method="post" action="<%=request.getContextPath() %>/admin/boardEdit_ok.gg" >
			<!-- 수정 시 no가 필요 hidden에 담아서 보낸다 -->
			<input type="hidden" name="no" value="<%=no %>">
			<div>
			<table style="font-size: 100%; border-collapse: collapse; margin-left:10px;
				width:700px;">
				
				<colgroup>
					<col style = "width: 150px">
					<col style = "width: 550px">
				</colgroup>	
				
				<tr>
					<td>게시물번호</td>
					<td><input type="text" readonly id="no" name="no" value="<%=no %>"/></td>
				</tr>
				<tr>
					<td>회원아이디</td>
					<td><input type="text" readonly id="id" name="id" value="<%=dto.getUserid() %>"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" id="title" name="title" value="<%=dto.getTitle() %>"/></td>
				</tr>					
				<tr>
					<td>작성일</td>
					<td><input type="text" id="regdate" name="regdate" value="<%=sdf.format(dto.getRegdate()) %>" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="describe" name="describe" rows="12" cols="55"><%=dto.getDescribe() %></textarea></td>
				</tr>
				
				<%if(userid!="admin"){ %>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="category" style="height:26px;">
							<option value="F" <%if(code.equals("F")){%>
							selected="selected"	<%} %>>자유게시판</option>
							<option value="E" <%if(code.equals("E")){%>
							selected="selected"	<%} %>>기타게시판</option>
						</select>
					</td>
				</tr>
				<%}else{ %>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="category" style="height:26px;">
							<option value="A" <%if(code.equals("A")){%>
							selected="selected"	<%} %>>공지사항</option>
						</select>
					</td>
				</tr>
				<%} %>
			</table>
			</div>
			<br>
			<div style="text-align: center;">
				<input type="submit" value="수정"/>
				<input type="Button" value="뒤로" onclick="location.href='<%=request.getContextPath() %>/admin/boardDetail.gg?no=<%=no %>&code=<%=code %>'" />         
			</div>
		</form>
	</div>   

</article>
<%@ include file="../inc/bottom.jsp" %>