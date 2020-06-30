<%@page import="com.invem.adminmember.model.AdminMemberService"%>
<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
<%
	//boardWrite.jsp post 등록버튼 
	//인코딩
	request.setCharacterEncoding("utf-8");
	
	//1 파라미터
	
	String id = request.getParameter("id");
	String apwd = request.getParameter("apwd");
	String bpwd = request.getParameter("bpwd");
	String title = request.getParameter("title");
	String describe = request.getParameter("content");
	String code = request.getParameter("category");
		
	//2 db작업
	
	AdminBoardService adminBoardService = new AdminBoardService();
	AdminMemberService adminMemberService = new AdminMemberService();
	AdminBoardDTO dto = new AdminBoardDTO();

	
	dto.setUserid(id);
	dto.setPwd(bpwd);
	dto.setTitle(title);
	dto.setDescribe(describe);
	dto.setCat_code(code);
	
	String cpwd="";
	try{
		cpwd = adminMemberService.selectAdminPwd(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	if(apwd.equals(cpwd)){
		int cnt=0;
		try{
			cnt = adminBoardService.insertBoard(dto);	
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		//3 결과처리
		if(cnt>0){%>
			<script type="text/javascript">
				alert('게시물 등록 성공');
				location.href="boardList.jsp?code=<%=code%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('게시물 등록 실패');
				history.back();
			</script>
		<%}%>
	<%}else{%>
		<script type="text/javascript">
			alert('관리자 비밀번호 불일치!');
			history.back();
		</script>
	<%}%>
</body>
</html>