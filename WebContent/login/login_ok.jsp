<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.member.model.MemberDTO"%>
<%@page import="com.invem.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="serv" class="com.invem.member.model.MemberService" 
	scope="session"></jsp:useBean>
<body>
	<%

		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String saveId=request.getParameter("saveId");
		
		//2
		String msg="로그인 처리 실패!", url="/login/login.gg";
		try{
			int result=serv.loginCheck(userid, pwd);
			if(result==MemberService.LOGIN_OK){ 
				MemberDTO vo=serv.selectMember(userid);

				session.setAttribute("userid", userid);
				session.setAttribute("userName", vo.getName());

				if(saveId!=null){ 
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setMaxAge(1000*24*60*60); 
					ck.setPath("/"); 
					response.addCookie(ck);
				}else{ 
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setMaxAge(0); 
					ck.setPath("/"); 
					response.addCookie(ck);
				}
				
				msg=vo.getName()+ "님 로그인되었습니다.";
				url="/index.gg";
			}else if(result==MemberService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==MemberService.ID_NONE){
				msg="해당 아이디가 존재하지 않습니다.";				
			}else{
				msg="탈퇴한 회원입니다.";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
	%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>
	
</body>
</html>