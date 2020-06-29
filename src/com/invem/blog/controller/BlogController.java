package com.invem.blog.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.board.model.ReplyVO;
import com.invem.controller.Controller;

public class BlogController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String curPage = request.getParameter("currentPage");
		//1. myBoard.jsp
		
		BoardService boardServ = new BoardService();
		int writeCount = boardServ.countByUserid(userid);
		//2. myBoard.jsp
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			list = boardServ.selectById(userid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3. myReply.jsp
		List<ReplyVO> rList = new ArrayList<ReplyVO>();
		try {
			rList = boardServ.selectAllReply(userid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		//4. guestbook.jsp
		
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("writeCount", writeCount);
		request.setAttribute("list", list);
		request.setAttribute("rList", rList);
		request.setAttribute("userid", userid);
		
		return "/blog/blog.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
