package com.invem.adminboard.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardService;
import com.invem.controller.Controller;

public class BoardDeleteOKController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no=request.getParameter("no");
		String code=request.getParameter("code");
		
		//2
		AdminBoardService adminBoardService = new AdminBoardService();
			
		int cnt=0;
		try{
			cnt=adminBoardService.deleteBoard(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
				
		return "/admin/boardList.gg?code="+code;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
	

}
