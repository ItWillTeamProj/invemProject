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
		
		String address = memVo.getAddress();
		String addressDetail = memVo.getAddressDetail();
		String zipcode = memVo.getZipcode();
		String hp = memVo.getHp();
		String hp1 = "";
		String hp2 = "";
		String hp3 = "";
		String email = memVo.getEmail();
		String email1 = "";
		String email2 = "";
		
		if(address==null || address.isEmpty()){
			address = "";
		}
		if(addressDetail==null || addressDetail.isEmpty()){
			addressDetail = "";
		}
		if(zipcode==null || zipcode.isEmpty()){
			zipcode = "";
		}
		if(hp!=null && !hp.isEmpty()){
			/* hp1 = hp.substring(0, hp.indexOf("-"));
			hp2 = hp.substring(hp.indexOf("-")+1, hp.lastIndexOf("-"));
			hp3 = hp.substring(hp.lastIndexOf("-")+1); */
			hp1 = hp.split("-")[0];
			hp2 = hp.split("-")[1];
			hp3 = hp.split("-")[2];
		}
		if(email!=null && !email.isEmpty()){
			email1 = email.split("@")[0];
			email2 = email.split("@")[1];
		}
		
		int counter = 0;
		String[] emailList = {"naver.com","hanmail.net","nate.com","gmail.com"};
		boolean isEtc = false;
		if(email!=null && !email.isEmpty()){
			for(int i = 0; i < emailList.length; i++){
				if(emailList[i].equals(email2)){
					counter++;
					break;
				}
			}
			
			if(counter == 0){
				isEtc = true;
			}
		}
		return "/member/memberEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
