package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class BoardEditController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		String delflag = request.getParameter("delflag");

		int num = 0;
		String boardName = "";
		String msg = "", url = "";
		switch (code) {
		case "F":
			boardName = "자유게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "E":
			boardName = "기타게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "T":
			boardName = "Top 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "M":
			boardName = "Mid 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "J":
			boardName = "Jungle 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "B":
			boardName = "Bot 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "S":
			boardName = "Support 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		case "P":
			boardName = "챔피언 공략 게시판";
			url = "/board/boardEdit.jsp?code=" + code + "&delflag=" + delflag;
			break;
		default:
			msg = "잘못된 접근입니다.";
			url = "/index.gg";
			num = 1;
			break;
		}

		BoardService boardServ = new BoardService();
		BoardVO vo = new BoardVO();

		try {
			vo = boardServ.searchByNo(Integer.parseInt(no));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		request.setAttribute("vo", vo);
		request.setAttribute("boardName", boardName);
		request.setAttribute("code", code);
		request.setAttribute("delflag", delflag);

		if (num == 1) {
			return "/common/message.jsp";
		} else {
			return url;

		}
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
