package com.invem.champion.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class ListController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/champion/list.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
