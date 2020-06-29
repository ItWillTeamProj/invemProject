package com.invem.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class MemberEditController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String c_userid = (String)request.getSession().getAttribute("userid");
		MemberDTO memVo = new MemberDTO();
		MemberService service = new MemberService();
		try{
			memVo = service.selectMember(c_userid);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("memVo", memVo);
		
		return "/member/memberEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
