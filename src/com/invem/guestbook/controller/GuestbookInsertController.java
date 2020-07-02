package com.invem.guestbook.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.GuestbookVO;
import com.invem.controller.Controller;

public class GuestbookInsertController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String nonuserid = request.getParameter("nonuserid");
		String ipaddress = request.getParameter("reply");
		String pwd = request.getParameter("pwd");
		String blogId = request.getParameter("blogId");
		String reply = request.getParameter("reply");
		
		String username = nonuserid;
	
		
		if(userid != null && !userid.isEmpty() && !"unknown".equals(userid)){
			username = userid;
		}
		
		GuestbookVO gVo = new GuestbookVO();
		
		gVo.setUserid(blogId);
		gVo.setWriter_id(username);
		gVo.setG_comment(reply);
		
		
		BoardService boardService = new BoardService();
		try {
			int cnt = boardService.guestbookInsert(gVo);
			if(cnt > 0) {
				System.out.println("방명록 등록 성공");
			}else {
				System.out.println("방명록 등록 실패");
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return "/blog/blog.gg?sId="+blogId+"&#tabs-4";
	}
	
	
	
	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
