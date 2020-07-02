package com.invem.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;
import com.invem.login.model.LoginService;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class SearchPwdController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		
		MemberService service = new MemberService();
		String result = "존재하지 않는 아이디입니다.";
		try {
			int over = service.overlap(id);
			if(over == LoginService.EXIST_ID) {
				MemberDTO dto = service.selectMember(id);
				if(date.equals(dto.getDateofbirth())) {
					result = dto.getPwd();
				}else {
					result = "생년월일이 일치하지 않습니다.";
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		return "/login/resultPwd.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
