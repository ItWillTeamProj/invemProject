package com.invem.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.controller.Controller;
import com.invem.login.model.LoginService;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class MemberEditOKController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userid = request.getParameter("userid");
		String nickname = request.getParameter("nickname");
		String pwd = request.getParameter("pwd");
		String dateofbirth = request.getParameter("dateofbirth");
		
		String phoneno1 = request.getParameter("phoneno1");
		String phoneno2 = request.getParameter("phoneno2");
		String phoneno3 = request.getParameter("phoneno3");

		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");

		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String detail = request.getParameter("detail");
		
		String sum_name = request.getParameter("sum_name");
		
		
		String phoneno = "", email = "";
		
		if(phoneno2 != null && !phoneno2.isEmpty() && phoneno3 != null && !phoneno3.isEmpty()){
			phoneno = phoneno1 + "-" + phoneno2 + "-" + phoneno3;
		}
		if(email1 != null && !email1.isEmpty() && email2 != null && !email2.isEmpty()){
			email = email1 + "@" + email2;
	    }
		
		MemberDTO vo = new MemberDTO();
		vo.setUserid(userid);
		vo.setNickname(nickname);
		vo.setPwd(pwd);
		vo.setDateofbirth(dateofbirth);
		vo.setPhoneno(phoneno);
		vo.setEmail(email);
		vo.setZipcode(zipcode);
		vo.setAddress(address);
		vo.setDetail(detail);
		vo.setSum_name(sum_name);
		
		MemberService serv = new MemberService();
		LoginService lserv = new LoginService();
		
		int cnt=0;
		String msg="수정 실패", url="/member/memberEdit.gg";
		try {
			int result=lserv.loginCheck(userid, pwd);
			if(result==LoginService.LOGIN_OK){ 
				cnt = serv.updateMember(vo);
				if(cnt>0) {
					msg="수정완료입니다!";
					url="/member/memberEdit.gg";
				}
			}else if(result==LoginService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==LoginService.ID_NONE){
				msg="해당 아이디가 존재하지 않습니다.";				
			}else{
				msg="탈퇴한 회원입니다.";
			}
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
