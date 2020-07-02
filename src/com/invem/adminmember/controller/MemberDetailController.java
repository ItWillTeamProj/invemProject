package com.invem.adminmember.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminmember.model.AdminMemberDTO;
import com.invem.adminmember.model.AdminMemberService;
import com.invem.controller.Controller;

public class MemberDetailController implements Controller {

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
			String id = request.getParameter("id");
			
			AdminMemberService adminMemberService = new AdminMemberService();
			AdminMemberDTO dto = null;
			
			try{
				dto = adminMemberService.selectByUserid(id);		
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			request.setAttribute("dto", dto);
			
			return "/admin/memberDetail.jsp";
		}
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
