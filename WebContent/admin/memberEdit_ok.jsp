<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.invem.adminmember.model.AdminMemberDTO"%>
<%@page import="com.invem.adminmember.model.AdminMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String nickname=request.getParameter("nickname");
	String name=request.getParameter("name");
	String dateOfBirth=request.getParameter("dateOfBirth");
	String phoneno=request.getParameter("phone");
	String email=request.getParameter("email");
	String zipcode=request.getParameter("zipcode");
	String address=request.getParameter("address");
	String detail=request.getParameter("detail");
	String sum_name=request.getParameter("sum_name");
	String caution=request.getParameter("caution");
	
	
	//2
	AdminMemberService adminMemberService = new AdminMemberService();
	AdminMemberDTO dto = new AdminMemberDTO();
		
	dto.setUserid(id);
	dto.setNickname(nickname);
	dto.setName(name);
	dto.setDateofbirth(dateOfBirth);
	dto.setPhoneno(phoneno);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress(address);
	dto.setDetail(detail);
	dto.setSum_name(sum_name);
	dto.setCaution(Integer.parseInt(caution));
	
	int cnt=0;
	try{
		cnt=adminMemberService.updateMember(dto);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){ %>
		<script type="text/javascript">
			alert('회원정보 수정완료!');
			location.href="memberDetail.jsp?id=<%=id%>";
		</script>	
<%	}else{%>
		<script type="text/javascript">
			alert('회원정보 수정실패!');
			history.go(-1);
		</script>
<%	}

%>
</body>
</html>