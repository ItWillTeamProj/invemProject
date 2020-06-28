package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class BoardWriteOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String nonuserid = request.getParameter("nonuserid");
		String pwd = request.getParameter("pwd");
		String userid = request.getParameter("userid");
		String ipaddress = request.getParameter("ipaddress");
		String title = request.getParameter("title");
		String describe = request.getParameter("ir1");
		String cat_code = request.getParameter("code");
		
		if(userid == null || userid.isEmpty()){
			userid = "unknown";
		}
		
		
		BoardVO vo = new BoardVO();
		BoardService boardServ = new BoardService();
		
		String ip=request.getRemoteAddr();
		String ip2=request.getRemoteHost();
		
		vo.setUserid(userid);
		vo.setNonuserid(nonuserid);
		vo.setPwd(pwd);
		vo.setIpaddress(ip);
		vo.setTitle(title);
		vo.setDescribe(describe);
		vo.setCat_code(cat_code);
		
		String msg = "글 등록 실패", url = "/board/boardWrite.gg?userid="+userid+"&code="+cat_code;
		try{
			int cnt = boardServ.insertBoard(vo);
			if(cnt > 0){
				msg = "글 등록 성공";
				url = "/board/boardList.gg?code="+cat_code;
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
