package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;

public class BoardDeleteOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		BoardService boardServ = new BoardService();
		System.out.println("no="+no);
		String msg = "삭제 실패", url = "/board/boardList.gg?code="+code;
		try {
			int cnt = boardServ.boardDelete(Integer.parseInt(no), code);
			if(cnt>0) {
				msg = "삭제성공";
				url = "/board/boardList.gg?code="+code;
			}
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
