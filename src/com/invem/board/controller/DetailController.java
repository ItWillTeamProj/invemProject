package com.invem.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.board.model.ReplyVO;
import com.invem.controller.Controller;

public class DetailController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String nonuserid = request.getParameter("nonuserid");
		String ipaddress = request.getParameter("ipaddress");
		String pwd = request.getParameter("pwd");
		String delflag = request.getParameter("delflag");
		
		BoardVO vo = new BoardVO();
		
		String no = request.getParameter("no");
		
		//코드를 받아와서 게시판의 이름을 적는다 
		String code = request.getParameter("code");
		BoardService boardServ = new BoardService();
		int replyCount = 0;
		
		try{
			vo = boardServ.searchByNo(Integer.parseInt(no));
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		userid = vo.getUserid();

		List<ReplyVO> list = null;
		int cnt = 0;
		try{
			list = boardServ.selectReplyByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("조회수 증가 결과 cnt=" + cnt);
		
		try {
			replyCount = boardServ.checkReply(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		request.setAttribute("no", no);
		request.setAttribute("code", code);
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("no", no);
		request.setAttribute("userid", userid);
		request.setAttribute("replyCount", replyCount);
		request.setAttribute("nonuserid", nonuserid);
		request.setAttribute("delflag", delflag);
		
		return "/board/detail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
	

}
