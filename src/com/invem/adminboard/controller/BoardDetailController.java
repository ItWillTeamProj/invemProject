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

	@Override
	public boolean isRedirect() {
		return false;
	}

}
