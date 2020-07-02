package com.invem.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;

public class BoardWriteController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = (String)request.getSession().getAttribute("userid"); 
		String code = request.getParameter("code");
		if(userid == null || userid.isEmpty()){
			userid = "";
		}
		int num = 0;
		String boardName = "";
		String msg = "", url = "";
		switch(code){
			case "F":
				boardName = "자유게시판";
				url = "/board/boardWrite.jsp?code="+code;
				break;
			case "E":
				boardName = "기타게시판";
				url = "/board/boardWrite.jsp?code="+code;
				break;
			default:
				msg = "잘못된 접근입니다.";
				url = "/index.gg";
				num = 1;
			break;
		}
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		request.setAttribute("userid", userid);
		request.setAttribute("boardName", boardName);
		if(num == 1) {
			return "/common/message.jsp";
		}else {
		return url;

		}
	}
	@Override
	public boolean isRedirect() {
		return false;
	}
	
	
}
