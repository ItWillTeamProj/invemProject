package com.invem.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.invem.controller.Controller;

public class LogOutController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/index/index.jsp";
	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
