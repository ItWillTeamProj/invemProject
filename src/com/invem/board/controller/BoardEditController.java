package com.invem.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class BoardEditController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		
		int num = 0;
		String boardName = "";
		String msg = "", url = "";
		switch(code){
			case "F":
			boardName = "자유게시판";
			url = "/board/boardEdit.jsp?code=F";
			break;
			default:
				msg = "잘못된 접근입니다.";
				url = "index.gg";
			break;
		}
		
		BoardService boardServ = new BoardService();
		BoardVO vo = new BoardVO();
		
		vo = boardServ.searchByNo(Integer.parseInt(no));
		
		
		
		
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		request.setAttribute("vo", vo);
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
