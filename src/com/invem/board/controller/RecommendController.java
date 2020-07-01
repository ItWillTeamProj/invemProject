package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.controller.Controller;

public class RecommendController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		String value = request.getParameter("value");

		String msg = "", url = "/board/detail.gg?no="+no+"&code="+code;
		int num = 0;
		if(value.equals("G")) {
			num = 1;
		}else if(value.equals("B")) {
			num = -1;
		}
		BoardService boardServ = new BoardService();
		try {
			int cnt = boardServ.recommentCount(Integer.parseInt(no), code, num);
			if(cnt > 0) {
				System.out.println("추천수 변경 성공");
				if(value.equals("G")) {
					msg = "추천 하셨습니다.";
				}else if(value.equals("B")) {
					msg = "비추천 하셨습니다.";
				}
			}else {
				System.out.println("db작업 실패");
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
