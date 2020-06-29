package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class BoardEditOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String nonuserid = request.getParameter("nonuserid");
		String pwd = request.getParameter("pwd");
		String userid = request.getParameter("userid");
		String ipaddress = request.getParameter("ipaddress");
		String title = request.getParameter("title");
		String describe = request.getParameter("ir1");
		String cat_code = request.getParameter("code");
		String no = request.getParameter("no");
		
		
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
		vo.setNo(Integer.parseInt(no));
		System.out.println(no);
		String msg = "글 수정 실패", url = "/board/boardEdit.gg?no="+no+"&code="+vo.getCat_code();
		try{
			if("unknown".equals(userid) || userid.isEmpty() || userid == null) {
				if(boardServ.checkPwd(Integer.parseInt(no), pwd)) {
					System.out.println("비밀번호 일치");
				}else {
					msg="비밀번호 불일치";
					request.setAttribute("msg", msg);
					request.setAttribute("url", url);
					return "/common/message.jsp";
				}
			}
			
			int cnt = boardServ.editBoard(vo);
			if(cnt > 0){
				msg = "글 수정 성공";
				url = "/board/detail.gg?no="+no+"&code="+vo.getCat_code();
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
