<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>

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

	String no=request.getParameter("no");
	String code=request.getParameter("code");
	
	//2
	AdminBoardService adminBoardService = new AdminBoardService();
		
	int cnt=0;
	try{
		cnt=adminBoardService.deleteBoard(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){ %>
		<script type="text/javascript">
			alert('게시물이 삭제되었습니다.');
			location.href="boardList.jsp?code=<%=code%>";
		</script>	
<%	}else{%>
		<script type="text/javascript">
			alert('게시물 삭제 실패!');
			history.go(-1);
		</script>
<%	}

%>
</body>
</html>