package com.invem.adminboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class BoardWriteController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		return "/admin/boardWrite.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
