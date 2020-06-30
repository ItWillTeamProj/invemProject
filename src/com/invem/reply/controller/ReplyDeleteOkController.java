package com.invem.reply.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;

public class ReplyDeleteOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		String groupno = request.getParameter("groupno");
		BoardService boardServ = new BoardService();
		
		String msg = "삭제 성공", url = "/board/detail.gg?no="+groupno+"&code="+code;
		try {
			boardServ.replyDelete(Integer.parseInt(no));	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
