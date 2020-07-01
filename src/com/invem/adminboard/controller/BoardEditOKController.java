package com.invem.adminboard.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardDTO;
import com.invem.adminboard.model.AdminBoardService;
import com.invem.controller.Controller;

public class BoardEditOKController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no=request.getParameter("no");
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		
		String category=request.getParameter("category");
		String describe=request.getParameter("describe");	
		
		//2
		AdminBoardService adminBoardService = new AdminBoardService();
		AdminBoardDTO dto = new AdminBoardDTO();
			
		dto.setNo(Integer.parseInt(no));
		dto.setUserid(id);
		dto.setTitle(title);
		dto.setCat_code(category);
		dto.setDescribe(describe);
		
		int cnt=0;
		try{
			cnt=adminBoardService.updateBoard(dto);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		String msg = "게시물 수정 실패!", url = "/admin/boardEdit.gg?no="+no;
		//3
		if(cnt>0){ 
			msg = "게시물 수정 성공!";
			url = "/admin/boardDetail.gg?no="+no+"&code="+category;
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
