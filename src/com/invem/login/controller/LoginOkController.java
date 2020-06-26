package com.invem.login.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.invem.controller.Controller;
import com.invem.login.model.LoginService;


public class LoginOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		LoginService serv = new LoginService();
		String msg = "로그인 실패", url = "/login/login.gg";
		try {
			int result = serv.loginCheck(userid, pwd);
			
			if(result == serv.LOGIN_OK) {
				msg = userid+"님 환영합니다";
				url = "/index.gg?userid";
				
				HttpSession session = request.getSession();
				session.setAttribute("userid", userid);
				
			}else if(result == serv.PWD_DISAGREE) {
				msg = "비밀번호가 일치하지 않습니다.";
			}else if(result == serv.ID_NONE) {
				msg = "아이디가 존재하지 않습니다.";
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
