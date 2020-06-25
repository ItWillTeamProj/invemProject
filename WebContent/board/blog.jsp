<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String test1 = request.getParameter("test1");
    String test2 = request.getParameter("test2");
%>
<html>
<head>
<meta charset="UTF-8">
<title>blog.jsp</title>
<script type="text/javascript" scr = "../js/jquery-3.5.1.min.js"></script>
<script language="javascript">

function closewin()
{
   self.close();
   }

</script>

</head>
<body>
	<h3>Popup Page</h3><br>
<h3>테스트값1:&nbsp;<%=test1%></h3><br>
<h3>테스트값2:&nbsp;<%=test2%></h3><br>
<input type="button" value="닫기" onclick="javascript:closewin()">
	
</body>
</html>