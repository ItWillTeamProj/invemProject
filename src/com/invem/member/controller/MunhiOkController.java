package com.invem.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class MunhiOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String radioValue = request.getParameter("search");
		
		String result = "/common/message.jsp";
		
		if(radioValue == null || radioValue.isEmpty()) {
			request.setAttribute("msg", "잘못된 url입니다.");
			request.setAttribute("url", "/login/munhi.gg");
			return result;
		}
		
		if(radioValue.equals("id")) {
			result = "/login/searchId.jsp";
		}else {
			result = "/login/searchPwd.jsp";
		}
		
		return result;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
