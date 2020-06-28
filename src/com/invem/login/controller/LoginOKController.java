package com.invem.login.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.invem.controller.Controller;
import com.invem.login.model.LoginService;
import com.invem.member.model.MemberDTO;


public class LoginOKController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String saveId=request.getParameter("saveId");
		
		LoginService serv = new LoginService();
		
		String msg="로그인 처리 실패!", url="/login/login.gg";
		try{
			int result=serv.loginCheck(userid, pwd);
			if(result==LoginService.LOGIN_OK){ 
				MemberDTO vo=serv.selectMember(userid);

				HttpSession session = request.getSession();
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
				url="/index/index.gg";
			}else if(result==LoginService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==LoginService.ID_NONE){
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
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
