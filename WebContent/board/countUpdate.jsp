<%@page import="com.invem.board.model.BoardService"%>
<%@page import="java.sql.SQLException"%>
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
	//no로 해당당 항목의 readcount 값을 찾은 후 +1해서 update하고 detail.jsp로 이동 
	
	//1.파라미터 읽기
	String no = request.getParameter("no");
	
	if(no == null || no.isEmpty()){%>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href = "<%=request.getContextPath()%>/board/list.gg";
		</script>
		<%return;
	}
	//2.
	BoardService boardServ = new BoardService();
	int cnt = 0;
	try{
		cnt = boardServ.updateReadCount(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3.
	if(cnt > 0){
		System.out.println("조회수 증가 성공");%>
		<script type="text/javascript">
			alert("조회수 증가 실패!");
			location.href = "<%=request.getContextPath()%>/board/detail.gg?no=<%=no%>";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("조회수 증가 실패!");
			history.back();
		</script>
	<% }
%>
</body>
</html>