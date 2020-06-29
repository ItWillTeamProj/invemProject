<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String no = request.getParameter("no");
	String code = request.getParameter("code");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var result=confirm("삭제하시겠습니까?");
		if(result){
			location.href="boardDelete_ok.jsp?no=<%=no %>&code=<%=code %>";
		}else{
		    alert("삭제가 취소되었습니다");
		    history.go(-1);
		}
	</script>
</body>
</html>