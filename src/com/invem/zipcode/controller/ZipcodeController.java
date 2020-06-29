package com.invem.zipcode.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class ZipcodeController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/zipcode/zipcode.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
