package com.invem.adminboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class BoardDeleteController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		if(userid!=null && userid=="admin" && !userid.isEmpty()) {
			
			String msg = "로그인 정보를 확인하세요";
			String url = ;
			return "/common/message.jsp";
		}
		
		return "/admin/boardDelete.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
