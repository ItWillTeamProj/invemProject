package com.invem.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class AdminController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
				
		return "/admin/admin.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
