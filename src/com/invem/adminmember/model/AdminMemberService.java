package com.invem.adminmember.model;

import java.sql.SQLException;
import java.util.List;

public class AdminMemberService {
	
	private AdminMemberDAO adminMemberDao;
	
	public AdminMemberService() {
		adminMemberDao =new AdminMemberDAO();
	}
	
	public List<AdminMemberDTO> selectAll() throws SQLException {
		return adminMemberDao.selectAll();
	}
	
	public AdminMemberDTO selectByUserid(String userid) throws SQLException {
		return adminMemberDao.selectByUserid(userid);
	}
	
	public int updateMember(AdminMemberDTO dto) throws SQLException {
		return adminMemberDao.updateMember(dto);
	}
	
	public String checkAdminPwd(String userid) throws SQLException {
		return adminMemberDao.checkAdminPwd(userid);
	}
}
