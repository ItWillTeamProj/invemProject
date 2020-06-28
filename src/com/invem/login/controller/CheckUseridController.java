package com.invem.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class CheckUseridController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/checkUserid.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
