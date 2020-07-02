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
	String id=request.getParameter("id");
	String title=request.getParameter("title");
	
	String category=request.getParameter("category");
	String describe=request.getParameter("describe");	
	
	//2
	AdminBoardService adminBoardService = new AdminBoardService();
	AdminBoardDTO dto = new AdminBoardDTO();
		
	dto.setNo(Integer.parseInt(no));
	dto.setUserid(id);
	dto.setTitle(title);
	dto.setCat_code(category);
	dto.setDescribe(describe);
	
	int cnt=0;
	try{
		cnt=adminBoardService.updateBoard(dto);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){ %>
		<script type="text/javascript">
			alert('게시물 수정되었습니다.');
			location.href="boardDetail.jsp?no=<%=dto.getNo()%>&code=<%=dto.getCat_code()%>";
		</script>	
<%	}else{%>
		<script type="text/javascript">
			alert('게시물 수정 실패!');
			history.go(-1);
		</script>
<%	}

%>
</body>
</html>