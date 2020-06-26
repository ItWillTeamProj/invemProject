package com.invem.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class AddSignUpOKController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		
		MemberDTO vo = new MemberDTO();
		
		
		MemberService serv = new MemberService();
		
		String msg="가입축하", url="/index/index.gg";
		try {
			int cnt = serv.insertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
