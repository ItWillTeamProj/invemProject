<%@page import="com.invem.login.model.LoginService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="serv" 
	class="com.invem.member.model.MemberService" 
	scope="session"></jsp:useBean>    
<%
		
	//1
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	
	//2
	int result=0;
	if(userid!=null && !userid.isEmpty()){
		try{
			result=serv.overlap(userid);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//3
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#userid').val("<%=userid%>");
			$(opener.document).find('#chkId').val("Y");
			
			self.close();			
		});
		
	});
	
</script>
</head>
<body>
	<h1>아이디 중복 검사</h1>	
	<form name="frmDup" method="post" action="<%=request.getContextPath()%>/invem/checkUserid.gg">
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" 
			value="<%=userid%>">
		<input type="submit" value="아이디 확인">
		
		<%if(result==LoginService.EXIST_ID){ %>
			<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
		<%}else if(result==LoginService.NON_EXIST_ID){ %>
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		<%} %>
	</form>
</body>
</html>
