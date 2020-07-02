package com.invem.adminboard.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardDTO;
import com.invem.adminboard.model.AdminBoardService;
import com.invem.controller.Controller;

public class BoardListController implements Controller {

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
		
			String code = request.getParameter("code");
			String condition=request.getParameter("searchCondition");
			String keyword=request.getParameter("searchKeyword");
			
			AdminBoardService adminBoardService = new AdminBoardService();
			List<AdminBoardDTO> list = null;
			
			try{
				list = adminBoardService.selectAll(code, condition, keyword);
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			request.setAttribute("code", code);
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);		
			
			return "/admin/boardList.jsp";
			
		}
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
