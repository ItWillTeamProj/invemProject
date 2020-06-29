<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.adminmember.model.AdminMemberDTO"%>
<%@page import="com.invem.adminmember.model.AdminMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	if(id==null || id.isEmpty()){ %>
	<script type="text/javascript">
		alert("잘못된 url 입니다.");
		location.href="memberList.jsp";
	</script>
	
	<%return;
} 

	//2
	AdminMemberService adminMemberService = new AdminMemberService();
	AdminMemberDTO dto = null;
	
	try{
		dto = adminMemberService.selectByUserid(id);		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	int ct = dto.getCaution();
%>

<%@ include file="../inc/top.jsp" %>

<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:15px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>회원관리</b>
		</div>
	</div>
	<h3><%=id %> 님의 상세정보</h3>	
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="회원목록" onclick="location.href='memberList.jsp'" /> 
	</div>	
	<div>
		<table style="font-size: 100%; border-collapse: collapse; margin-left:10px;
			width:700px;">
			<tr style="background:white; border-top:1px solid gray;">
				<td style="padding-left: 30px;">아이디</td>
				<td><%=dto.getUserid() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">닉네임</td>
				<td><%=dto.getNickname() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">이름</td>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">생일</td>
				<td><%=dto.getDateofbirth() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">전화번호</td>
				<td><%=dto.getPhoneno() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">이메일</td>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">우편번호</td>
				<td><%=dto.getZipcode() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">주소</td>
				<td><%=dto.getAddress() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">주소상세</td>
				<td><%=dto.getDetail() %></td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">소환사명</td>
				<td><%=dto.getSum_name() %></td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">가입일</td>
				<td><%=dto.getRegdate() %></td>
			</tr> 
			<tr style="border-bottom:1px solid gray;">
				<td style="padding-left: 30px;">경고</td>
				<%if(ct<5){%>
				<td><%=ct %>회</td>
				<%}else{%>
				<td><%=ct %>회 (# 경고 5회 이상 블라인드 회원)</td>
				<%}%>
				
			</tr>
		</table>
				
		<div class="center" style="text-align: right; margin: 10px;">
			<input type="Button" value="정보수정" onclick="location.href='memberEdit.jsp?id=<%=dto.getUserid() %>'" />  
		</div>
	</div>
</article>	
<%@ include file="../inc/bottom.jsp" %>