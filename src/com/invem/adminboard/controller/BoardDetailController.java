package com.invem.adminboard.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardDTO;
import com.invem.adminboard.model.AdminBoardService;
import com.invem.controller.Controller;

public class BoardDetailController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userid = (String)request.getSession().getAttribute("userid");
		if(userid==null || userid.isEmpty() || !userid.equals("admin")) {
			
			String msg="잘못된 로그인 정보! 메인화면으로 돌아갑니다";
			String url="/index.gg";
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			return "/common/message.jsp";
			
		}else {
				
			String no = request.getParameter("no");
			String code =request.getParameter("code");
			
			AdminBoardService adminBoardService = new AdminBoardService();
			AdminBoardDTO dto = null;
			
			try{
				dto = adminBoardService.selectByNo(Integer.parseInt(no));
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			request.setAttribute("dto", dto);
			request.setAttribute("code", code);
			
			return "/admin/boardDetail.jsp";
		}
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
