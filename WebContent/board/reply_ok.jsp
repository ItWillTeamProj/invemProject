<%@page import="com.invem.board.model.BoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.board.model.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String nonuserid = request.getParameter("nonuserid");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String reply = request.getParameter("reply");
	String user_no = request.getParameter("no"); 
	
	String username = nonuserid;
	if(userid != null && !userid.isEmpty() && userid.equals("unknown")){
		username = userid;
	}
	
	ReplyVO vo = new ReplyVO();
	
	vo.setNo(Integer.parseInt(user_no));
	vo.setSortno(Integer.parseInt(user_no));
	vo.setusername(username);
	vo.setReply(reply);
	vo.setStep(1);
	vo.setGroupno(Integer.parseInt(user_no));
	
	BoardService boardServ = new BoardService();
	int cnt = 0;
	try{
		cnt = boardServ.reply(vo);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	if(cnt>0){%>
		<script type="text/javascript">
				alert('글이 등록 되었습니다.');
				location.href = "detail.jsp?no=<%=user_no%>";
		</script>
	<%}else{%>
		<script type="text/javascript">
				alert('글등록 실패');
				history.back();
		</script>
	<%}%>
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply_ok.jsp</title>
</head>
<body>

</body>
</html>