<%@page import="java.sql.SQLException"%>
<%@page import="com.admin.member.model.AdminMemberDTO"%>
<%@page import="com.admin.member.model.AdminMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	if(userid==null || userid.isEmpty()){ %>
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
		dto = adminMemberService.selectByUserid(userid);		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>

<%@ include file="../inc/top.jsp" %>
<article>
	<style>
	.sp1 {
		margin-left: 50px;
	}
	.sp2 {
		text-align: center;
	}
	</style>
	<h2 style="margin-top: 10px;">회원상세보기</h2>
	<div class="divForm">
		<table border="1px solid gray" style="font-size: 90%; border-collapse: collapse;
			width:600px; margin-left: 60px;">
			<tr>
				<td>아이디</td>
				<td><%=dto.getUserid() %></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=dto.getNickname() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><%=dto.getDateofbirth() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=dto.getPhoneno() %></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><%=dto.getZipcode() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=dto.getAddress() %></td>
			</tr>
			<tr>
				<td>주소상세</td>
				<td><%=dto.getDetail() %></td>
			</tr>
			<tr>
				<td>소환사명</td>
				<td><%=dto.getSum_name() %></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<td>경고</td>
				<td><%=dto.getCaution() %></td>
			</tr>
		</table>
				
		<div class="center" style="text-align: center; margin: 10px;">
			<a href='edit.jsp?userid=<%=dto.getUserid() %>'>수정</a> |
        	<a href='memberList.jsp'>목록</a>			
		</div>
	</div>





</article>	
<%@ include file="../inc/bottom.jsp" %>