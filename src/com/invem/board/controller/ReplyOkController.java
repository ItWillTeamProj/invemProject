package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.ReplyVO;
import com.invem.controller.Controller;

public class ReplyOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String nonuserid = request.getParameter("nonuserid");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String reply = request.getParameter("reply");
		String user_no = request.getParameter("no"); 
		
		String username = nonuserid;
		if(userid != null && !userid.isEmpty() && userid.equals("unknown")){
			username = userid;
		}
		
		ReplyVO vo = new ReplyVO();
		
		vo.setNo(Integer.parseInt(user_no));
		vo.setSortno(Integer.parseInt(user_no));
		vo.setUserid(username);
		vo.setReply(reply);
		vo.setStep(1);
		vo.setGroupno(Integer.parseInt(user_no));
		
		BoardService boardServ = new BoardService();
		int cnt = 0;
		String msg = "댓글등록 실패", url = "/board/detail.gg?no=" + user_no;
		try{
			cnt = boardServ.reply(vo);
			if(cnt>0) {
				System.out.println("userid = " + vo.getUserid());
				msg = "댓글 등록 성공";
			}
		}catch(SQLException e){
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