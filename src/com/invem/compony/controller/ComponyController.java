package com.invem.compony.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class ComponyController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/compony/compony.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
