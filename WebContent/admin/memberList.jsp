<%@page import="com.admin.member.model.AdminMemberService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.admin.member.model.AdminMemberDTO"%>
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
<h2 style="margin-top: 10px">회원관리</h2>
<div class="divList">
<table class="box2" border="1px solid gray" 
	style="font-size: 90%; border-collapse: collapse; margin-left: 10px; margin-right: 10px">
	<colgroup>
		<col style="width:80px;" />
		<col style="width:80px;" />
		<col style="width:80px;" />
		<col style="width:120px;" />
		<col style="width:180px;" />
		<col style="width:100px;" />
		<col style="width:60px;" />
	</colgroup>
	<thead style="background-color: lightgray">
	  <tr>
	    <th scope="col">아이디</th>
	    <th scope="col">닉네임</th>
	    <th scope="col">이름</th>
	    <th scope="col">전화번호</th>
	    <th scope="col">이메일</th>
	    <th scope="col">가입일</th>
	    <th scope="col">경고</th>
	  </tr>
	</thead>
	<tbody>
		<%if(list==null || list.isEmpty()){ %>
			<tr>
				<td colspan="10" class="align_center">
					게시판 글이 존재하지 않습니다.</td>
			</tr>			
		<%}else{
		for(int i=0;i<list.size();i++){
				AdminMemberDTO dto = list.get(i);%>
				<tr class="align_center" >
					<td><a href="memberDetail.jsp?userid=<%=dto.getUserid() %>"><%=dto.getUserid() %></a></td>
					<td><%=dto.getNickname() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getPhoneno() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getRegdate()) %></td>
					<td><%=dto.getCaution() %></td>
				</tr>
				
				
				 
			<%}//for 
		}%>
		  	<!--반복처리 끝  -->
	  </tbody>
</table>	   
</div>
<div style="text-align: right; margin: 10px 10px 10px 10px;">
	<a href="admin.jsp">관리자 메인 페이지</a>
</div>

</article>

<%@ include file="../inc/bottom.jsp" %>