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
		
		String userid = request.getParameter("userid");
		String nickname = request.getParameter("nickname");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String dateofbirth = request.getParameter("dateofbirth");
		
		String phoneno1 = request.getParameter("phoneno1");
		String phoneno2 = request.getParameter("phoneno2");
		String phoneno3 = request.getParameter("phoneno3");

		String email1 = request.getParameter("email1");
		String email3 = request.getParameter("email3");

		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String detail = request.getParameter("detail");
		
		String sum_name = request.getParameter("sum_name");
		
		
		String phoneno = "", email = "";
		
		if(phoneno2 != null && !phoneno2.isEmpty() && phoneno3 != null && !phoneno3.isEmpty()){
			phoneno = phoneno1 + "-" + phoneno2 + "-" + phoneno3;
		}
		if(email1 != null && !email1.isEmpty() && email3 != null && !email3.isEmpty()){
			email = email1 + "@" + email3;
	    }
		
		MemberDTO vo = new MemberDTO();
		vo.setUserid(userid);
		vo.setNickname(nickname);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setDateofbirth(dateofbirth);
		vo.setPhoneno(phoneno);
		vo.setEmail(email);
		vo.setZipcode(zipcode);
		vo.setAddress(address);
		vo.setDetail(detail);
		vo.setSum_name(sum_name);
		
		MemberService serv = new MemberService();
		
		int cnt=0;
		String msg="당신은 가입 못합니다.", url="/login/signup.gg";
		try {
			cnt = serv.insertMember(vo);
			msg="환영합니다!";
			url="/index/index.gg";
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
