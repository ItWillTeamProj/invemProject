package com.invem.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class MemberEditController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/memberEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
