<%@page import="com.invem.adminmember.model.AdminMemberService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.adminmember.model.AdminMemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	AdminMemberService adminMemberService = new AdminMemberService();
	List<AdminMemberDTO> list = null;
	
	try{
		list = adminMemberService.selectAll();
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
			<b>회원관리</b>
		</div>
	</div>
	<p style="font-size: 18.7px; font-weight: bold; margin-top: 15px;">회원목록</p> <!-- 억지로맞춤 -->
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="관리자 메인 페이지" onclick="location.href='admin.jsp'" />  
	</div>
	<div>
	<table class="memberBox"
		style="border-top :1px solid gray; border-bottom: 1px solid gray;
			font-size: 100%; border-collapse: collapse; margin-left: 10px; margin-right: 10px">
		<colgroup>
			<col style="width:110px;" />
			<col style="width:110px;" />
			<col style="width:110px;" />		
			<col style="width:210px;" />
			<col style="width:110px;" />
			<col style="width:50px;" />
		</colgroup>
		<thead style="background-color: lightgray; text-align: left;">
		  <tr>
		    <th scope="col">아이디</th>
		    <th scope="col">닉네임</th>
		    <th scope="col">이름</th>	    
		    <th scope="col">이메일</th>
		    <th scope="col">가입일</th>
		    <th scope="col">경고</th>
		  </tr>
		</thead>
		<tbody>
			<%if(list==null || list.isEmpty()){ %>
				<tr style="text-align: center;">
					<td colspan="6" >
						회원이 존재하지 않습니다.</td>
				</tr>			
			<%}else{
			for(int i=0;i<list.size();i++){
					AdminMemberDTO dto = list.get(i);%>
					<tr style="text-align: left;">
						<td><a href="memberDetail.jsp?id=<%=dto.getUserid() %>"><%=dto.getUserid() %></a></td>
						<td><%=dto.getNickname() %></td>
						<td><%=dto.getName() %></td>					
						<td><%=dto.getEmail() %></td>
						<td><%=sdf.format(dto.getRegdate()) %></td>
						<td>&nbsp;<%=dto.getCaution() %>회</td>
					</tr>
					
				<%}//for 
			}%>
			  	<!--반복처리 끝  -->
		  </tbody>
	</table>	   
	</div>
</article>

<%@ include file="../inc/bottom.jsp" %>