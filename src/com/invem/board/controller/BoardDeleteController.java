package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;

public class BoardDeleteController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		String pwd = request.getParameter("pwd");
		String cnt = request.getParameter("cnt");
		BoardService boardServ = new BoardService();
		
		String msg = "비밀번호가 틀립니다.", url = "/board/deleteNonuser.gg?no="+no+"&code="+code+"&cnt=";
		try {
			if(boardServ.checkReplyPwd(Integer.parseInt(no), pwd)) {
				msg = "비밀번호 일치 삭제합니다.";
				cnt = "1";
			}else {
				cnt = "0";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		url += cnt;
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
	
}
