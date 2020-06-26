
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memSer" class="com.invem.member.model.MemberService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="vo" class="com.invem.member.model.MemberDTO" 
	scope="page"></jsp:useBean>

<%

	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String nickname=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String dateofbirth=request.getParameter("dateofbirth");
	String phoneno1=request.getParameter("phoneno1");
	String phoneno2=request.getParameter("phoneno2");
	String phoneno3=request.getParameter("phoneno3");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String email3=request.getParameter("email3");
	String zipcode=request.getParameter("zipcode");
	String address=request.getParameter("address");
	String detail=request.getParameter("detail");
	String sum_name=request.getParameter("sum_name");
	String caution=request.getParameter("caution");
	
	//2
	String email="", phoneno="";
	if(phoneno2!=null && !phoneno2.isEmpty() && phoneno3!=null && !phoneno3.isEmpty()){
		phoneno=phoneno1+"-"+phoneno2+"-"+phoneno3;
	}
	
	if(email1!=null && !email1.isEmpty()){
		if(email2.equals("etc")){ //직접입력의 경우
			if(email3!=null && !email3.isEmpty()){
				email=email1+"@"+email3;
			}
		}else{
			email=email1+"@"+email2;			
		}
	}
	
	vo.setUserid(userid);
	vo.setUserid(nickname);
	vo.setPwd(pwd);
	vo.setName(name);
	vo.setDateofbirth(dateofbirth);
	vo.setPhoneno(phoneno);
	vo.setEmail(email);
	vo.setZipcode(zipcode);
	vo.setAddress(address);
	vo.setDetail(detail);
	vo.setSum_name(sum_name);
	vo.setCaution(caution);
	
	String msg="회원가입 실패!", url="/login/addLogin.gg";
	try{
		int cnt=memSer.insertMember(vo);
		
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="/index.gg";
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