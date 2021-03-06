<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String blogId = request.getParameter("userid"); 
	String sUserid = (String)session.getAttribute("userid");
	
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${param.userid }님의 블로그</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$( function() {
	  $( "#tabs" ).tabs();
	} );
	
	function closewin()
	{
	   self.close();
	   }	
</script>
</head>
<body>
 
<div id="tabs" style = "border-bottom: 0px">
  <ul>
    <li><a href="#tabs-1" class="nav-item">블로그 홈</a></li>
    <li><a href="#tabs-2" class="nav-item">게시물</a></li>
    <li><a href="#tabs-3" class="nav-item">댓글</a></li>
    <li><a href="#tabs-4" class="nav-item">방명록</a></li>
    
  </ul>
	<%@include file = "/common/guestbook.jsp" %>
  	<%@include file = "/common/blogHome.jsp" %>
  	<%@include file = "/common/myBoard.jsp" %>
	<%@include file = "/common/myReply.jsp" %>
</div>

</body>
</html>