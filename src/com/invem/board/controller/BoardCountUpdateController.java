package com.invem.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;

public class BoardCountUpdateController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String nonuserid = request.getParameter("nonuserid");
		String ipaddress = request.getParameter("ipaddress");
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		
		BoardService boardServ = new BoardService();
		int cnt = boardServ.updateReadCount(Integer.parseInt(no));
		
		
		
		
		return "/board/countUpdate.jsp?no="+no+"&userid="+userid+"&nonuserid="+nonuserid+"&ipaddress="+ipaddress+"&code="+code;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
