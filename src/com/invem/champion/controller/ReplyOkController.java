package com.invem.champion.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class ReplyOkController  implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String content = request.getParameter("reContent");
		String champNo = request.getParameter("champNo");
		String code = request.getParameter("code");
		
		BoardService service = new BoardService();
		BoardVO vo = new BoardVO();
		vo.setUserid(userid);
		vo.setTitle(title);
		vo.setDescribe(content);
		vo.setCat_code(code);
		vo.setChamp_no(Integer.parseInt(champNo));
		
		try {
			service.insertBoard(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/champion/detail.gg?no=" + champNo;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
