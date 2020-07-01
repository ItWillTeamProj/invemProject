package com.invem.adminmember.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminmember.model.AdminMemberDTO;
import com.invem.adminmember.model.AdminMemberService;
import com.invem.controller.Controller;

public class MemberEditController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		
		AdminMemberService adminMemberService = new AdminMemberService();
		AdminMemberDTO dto = null;
		
		try{
			dto = adminMemberService.selectByUserid(id);				
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("dto", dto);
		
		return "/admin/memberEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
