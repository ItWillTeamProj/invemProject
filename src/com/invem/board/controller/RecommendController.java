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
		String delflag = request.getParameter("delflag");
		String userid = request.getParameter("userid");
		
		if(userid == null || userid.isEmpty() || userid.equals("null")){
			userid = "";
		}
		
		String msg = "", url = "/board/detail.gg?no="+no+"&code="+code+"&delflag="+delflag;
		int num = 0;
		if(value.equals("G")) {
			num = 1;
		}else if(value.equals("B")) {
			num = -1;
		}
		BoardService boardServ = new BoardService();
		
		
		
		int recommendCount = 0;
		try {
			if(userid == null || userid.isEmpty() || "unknown".equals(userid)) {
				msg = "추천 / 비추천은 회원만 가능합니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);

				return "/common/message.jsp";
				
			}else {
				int cnt = boardServ.recommendInsert(userid, Integer.parseInt(no));
				if(cnt>0) {
					System.out.println("추천등록 성공");
				}else {
					System.out.println("추천등록 실패");
				}
				
				recommendCount = boardServ.checkRecommend(userid, Integer.parseInt(no));
				
			}	
			
			
			if(recommendCount > 1) {
				msg = "추천 / 비추천은 각 게시물에 계정당 1회만 가능합니다.";
			}else {
				
				int cnt2 = boardServ.recommentCount(Integer.parseInt(no), code, num);
				if(cnt2 > 0) {
					System.out.println("추천수 변경 성공");
					if(value.equals("G")) {
						msg = "추천 하셨습니다.";
					}else if(value.equals("B")) {
						msg = "비추천 하셨습니다.";
					}
				}else {
					System.out.println("db작업 실패");
				}
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
