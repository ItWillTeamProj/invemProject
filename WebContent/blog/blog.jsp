<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Tabs - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">블로그 홈</a></li>
    <li><a href="#tabs-2">게시물</a></li>
    <li><a href="#tabs-3">댓글</a></li>
    <li><a href="#tabs-4">방명록</a></li>
    
  </ul>
  	<%@include file = "/common/blogHome.jsp" %>
  	<%@include file = "/common/myBoard.jsp" %>
	<%@include file = "/common/myReply.jsp" %>
	<%@include file = "/common/guestbook.jsp" %>
</div>


 
</body>
</html>