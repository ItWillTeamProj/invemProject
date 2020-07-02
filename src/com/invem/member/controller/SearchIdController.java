package com.invem.member.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class SearchIdController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String name = request.getParameter("name");
		
		MemberService serv = new MemberService();
		List<MemberDTO> list = null;
		try {
			list = serv.selectByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("mList", list);
		return "/login/searchResult.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
