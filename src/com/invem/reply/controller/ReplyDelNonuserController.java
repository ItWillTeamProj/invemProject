package com.invem.reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class ReplyDelNonuserController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no =request.getParameter("no");
		String code = request.getParameter("code");
		String cnt = request.getParameter("cnt");
		String groupno = request.getParameter("groupno");
		String url = "";
		System.out.println("no="+no);
		if(cnt != null && !cnt.isEmpty()) {
			url ="/reply/replyDelNonuser.jsp?no="+no+"&code="+code+"&cnt="+cnt+"&groupno="+groupno;
		}else {
			url = "/reply/replyDelNonuser.jsp?no="+no+"&code="+code+"&groupno="+groupno;
		}
		
		return url;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	

}
