package com.invem.index.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class IndexController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/index.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
