package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;
import com.invem.login.model.LoginService;

public class ChampBoardDelete implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		LoginService lServ = new LoginService();
		BoardService bServ = new BoardService();
		int cnt = 0;
		try {
			int check = lServ.loginCheck(userid, pwd);
			if(check == LoginService.PWD_DISAGREE) {
				request.setAttribute("msg", "비밀번호가 틀렸습니다.");
				request.setAttribute("url", "/board/deleteNonuser.gg?no="+no+"&code=C&userid=" + userid);
				return "/common/message.jsp";
			}
			cnt = bServ.boardDelete(Integer.parseInt(no), "C");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("cnt", cnt);
		return "/board/champBoardDelete.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
