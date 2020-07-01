package com.invem.board.controller;

import java.sql.SQLException;

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
		String delflag = request.getParameter("delflag");
		
		
		BoardService boardServ = new BoardService();
		try {
			int cnt = boardServ.updateReadCount(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return "/board/detail.gg?no="+no+"&code="+code+"&delflag="+delflag;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
