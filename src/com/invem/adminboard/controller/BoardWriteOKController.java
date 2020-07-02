package com.invem.adminboard.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.adminboard.model.AdminBoardDTO;
import com.invem.adminboard.model.AdminBoardService;
import com.invem.adminmember.model.AdminMemberService;
import com.invem.controller.Controller;

public class BoardWriteOKController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String apwd = request.getParameter("apwd");
		String bpwd = request.getParameter("bpwd");
		String title = request.getParameter("title");
		String describe = request.getParameter("content");
		String code = request.getParameter("category");
			
		//2 db작업
		
		AdminBoardService adminBoardService = new AdminBoardService();
		AdminMemberService adminMemberService = new AdminMemberService();
		AdminBoardDTO dto = new AdminBoardDTO();

		dto.setUserid(id);
		dto.setPwd(bpwd);
		dto.setTitle(title);
		dto.setDescribe(describe);
		dto.setCat_code(code);
		
		String cpwd="";
		
		try{
			cpwd = adminMemberService.selectAdminPwd(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String msg="공지사항 등록실패";
		String url="/admin/boardWrite.gg";
		
		if(apwd.equals(cpwd)){
			int cnt=0;
			try{
				cnt = adminBoardService.insertBoard(dto);	
			}catch (SQLException e){
				e.printStackTrace();
			}
			
			//3 결과처리
			if(cnt>0){
				msg="공지사항 등록성공";
				url="/admin/boardList.gg?code="+code;
			}
			
		}else{
			msg="비밀번호 불일치";
			
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
