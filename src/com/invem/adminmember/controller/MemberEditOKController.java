package com.invem.adminmember.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminmember.model.AdminMemberDTO;
import com.invem.adminmember.model.AdminMemberService;
import com.invem.controller.Controller;

public class MemberEditOKController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1
		request.setCharacterEncoding("utf-8");

		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String dateOfBirth=request.getParameter("dateOfBirth");
		String phoneno=request.getParameter("phone");
		String email=request.getParameter("email");
		String zipcode=request.getParameter("zipcode");
		String address=request.getParameter("address");
		String detail=request.getParameter("detail");
		String sum_name=request.getParameter("sum_name");
		String caution=request.getParameter("caution");
		
		String nickname="x";//임시로 값을 넣음
		//2
		AdminMemberService adminMemberService = new AdminMemberService();
		AdminMemberDTO dto = new AdminMemberDTO();
			
		dto.setUserid(id);
		dto.setName(name);
		dto.setNickname(nickname); //임시로 값을 넣음
		dto.setDateofbirth(dateOfBirth);
		dto.setPhoneno(phoneno);
		dto.setEmail(email);
		dto.setZipcode(zipcode);
		dto.setAddress(address);
		dto.setDetail(detail);
		dto.setSum_name(sum_name);
		dto.setCaution(Integer.parseInt(caution));
		
		String msg="회원정보 수정 실패!";
		String url="/admin/memberDetail.gg?id="+id;
		
		try{
			int cnt=adminMemberService.updateMember(dto);
			if(cnt>0) {
				msg = "회원정보 수정 성공!";
				url = "/admin/memberDetail.gg?id="+id;
			}
		}catch(SQLException e){
			e.printStackTrace();
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
