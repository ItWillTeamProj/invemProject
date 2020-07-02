package com.invem.adminboard.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardService;
import com.invem.controller.Controller;

public class BoardDeleteOKController implements Controller {

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
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
	

}
