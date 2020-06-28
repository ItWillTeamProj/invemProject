<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.adminmember.model.AdminMemberDTO"%>
<%@page import="java.sql.SQLException"%>
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
	
	AdminMemberService adminMemberService = new AdminMemberService();
	AdminMemberDTO dto = null;
	
	try{
		dto = adminMemberService.selectByUserid(id);				
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
			<b>회원관리</b>
		</div>
	</div>	
	<h3><%=id %> 님의 정보수정</h3>
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="회원정보" onclick="location.href='memberDetail.jsp?id=<%=dto.getUserid() %>'" />  
		<input type="Button" value="회원목록" onclick="location.href='memberList.jsp'" />  
	</div>	
	<form name="formEdit" method="post" action="memberEdit_ok.jsp">
		<!-- 수정 시 id가 필요 hidden에 담아서 보낸다 -->
		<input type="hidden" name="id" value="<%=id %>">
		<table style="font-size: 90%; border-collapse: collapse; margin-left:10px;
			width:700px;">
			<tr style="background:white; border-top:1px solid gray;">
				<td style="padding-left: 30px;">아이디</td>
				<td><input type="text" readonly id="id" name="id" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getUserid() %>"/></td>
	            <td># 아이디 수정불가</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">닉네임</td>
				<td><input type="text" id="nickname" name="nickname"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getNickname() %>" /></td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">이름</td>
				<td><input type="text" id="name" name="name" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getName() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">생일</td>
				<td><input type="text" id="dateOfBirth" name="dateOfBirth"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getDateofbirth() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">전화번호</td>
				<td><input type="text" id="phone" name="phone" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getPhoneno() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">이메일</td>
				<td><input type="text" id="email" name="email"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getEmail() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">우편번호</td>
				<td><input type="text" id="zipcode" name="zipcode" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getZipcode() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">주소</td>
				<td><input type="text" id="address" name="address"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getAddress() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">주소상세</td>
				<td><input type="text" id="detail" name="detail" 
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getDetail() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="padding-left: 30px;">소환사명</td>
				<td><input type="text" id="sum_name" name="sum_name"
	            	size="28px" style="margin-left:100px;"
	            	value="<%=dto.getSum_name() %>"/></td>
	            <td>&nbsp;</td>
			</tr>
			<tr style="background:white;">
				<td style="padding-left: 30px;">가입일</td>
				<td><input type="text" readonly id="regdate" name="regdate"
					size="28px" style="margin-left:100px;"
	            	value="<%=sdf.format(dto.getRegdate()) %>"/></td>
	            <td># 가입일 수정불가</td>
			</tr>
			<tr style="border-bottom:1px solid gray;">
				<td style="padding-left: 30px;">경고</td>
				<td><input type="text" id="caution"  name="caution"
					size="28px" style="margin-left:100px;"
	            	value="<%=dto.getCaution() %>"/></td>
	            <td># 경고 5회 이상 로그인 불가</td>
			</tr>
		</table>
		<div style="text-align:right; margin:10px;">
			<input type="submit" value="수정완료"/>
        </div>
	</form>

</article>
<%@ include file="../inc/bottom.jsp" %>