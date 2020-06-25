<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String nonuserid = request.getParameter("nonuserid");
	String pwd = request.getParameter("pwd");
	String userid = request.getParameter("userid");
	String ipaddress = request.getParameter("ipaddress");
	String title = request.getParameter("title");
	String describe = request.getParameter("ir1");
	String cat_code = request.getParameter("code");
	
	if(userid == null || userid.isEmpty()){
		userid = "unknown";
	}
	
	
	BoardVO vo = new BoardVO();
	BoardService boardServ = new BoardService();
	
	String ip=request.getRemoteAddr();
	String ip2=request.getRemoteHost();
	
	vo.setUserid(userid);
	vo.setNonuserid(nonuserid);
	vo.setPwd(pwd);
	vo.setIpaddress(ip);
	vo.setTitle(title);
	vo.setDescribe(describe);
	vo.setCat_code(cat_code);
	
	try{
		int cnt = boardServ.insertBoard(vo);
		if(cnt > 0){%>
			<script type="text/javascript">
				alert('글이 등록 되었습니다.');
				location.href = "boardList.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('글 등록 실패.');
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>