<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");

	
	AdminBoardService adminBoardService = new AdminBoardService();
	List<AdminBoardDTO> list = null;
	
	try{
		list = adminBoardService.selectAll(code);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>        
    
<%@ include file="../inc/top.jsp" %>  
	<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리</b>
		</div>
	</div>
	
	<%if(code.equals("F")){ %>
		<h3>자유게시판</h3>	
	<%}else if(code.equals("E")){%>
		<h3>기타게시판</h3>	
	<%} %>
	
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="게시판 선택 페이지" onclick="location.href='<%=request.getContextPath() %>/admin/boardSelect.jsp'" />  
	</div>
	<div>
	<table class="boardBox"
		style="border-top :1px solid gray; border-bottom: 1px solid gray;
			font-size: 100%; border-collapse: collapse; margin-left: 10px; margin-right: 10px">
		<colgroup>
			<col style="width:80px;" />
			<col style="width:120px;" />
			<col style="width:210px;" />		
			<col style="width:130px;" />
			<col style="width:90px;" />
			<col style="width:80px;" />
		</colgroup>
		<thead style="background-color: lightgray; text-align: left;">
		  <tr>
		    <th scope="col">번호</th>
		    <th scope="col">아이디</th>
		    <th scope="col">제목</th>
		    <th scope="col">작성일</th>
		    <th scope="col">조회수</th>
		    <th scope="col">분류</th>
		  </tr>
		</thead>
		<tbody>
			<%if(list==null || list.isEmpty()){ %>
				<tr style="text-align: center;">
					<td colspan="6" >
						게시물이 존재하지 않습니다.</td>
				</tr>			
			<%}else{
			for(int i=0;i<list.size();i++){
					AdminBoardDTO dto = list.get(i);%>
					<tr style="text-align: left;">
						<td><%=dto.getNo() %></td>
						<td><%=dto.getUserid() %></td>
						<td><a href="boardDetail.jsp?no=<%=dto.getNo() %>&code=<%=dto.getCat_code()%>"><%=dto.getTitle() %></a></td>					
						<td><%=sdf.format(dto.getRegdate()) %></td>
						<td><%=dto.getViews() %></td>
						<%if(code.equals("F")){%>
						<td>자유게시판</td>
						<%}else if(code.equals("E")){%>
						<td>기타게시판</td>
						<%} %>
						
					</tr>
					
				<%}//for 
			}%>
			  	<!--반복처리 끝  -->
		  </tbody>
	</table>
		   
	</div>


	</article>
<%@ include file="../inc/bottom.jsp" %>