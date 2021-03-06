package com.invem.adminmember.model;

import java.sql.SQLException;
import java.util.List;

public class AdminMemberService {
	
	private AdminMemberDAO adminMemberDao;
	
	public AdminMemberService() {
		adminMemberDao =new AdminMemberDAO();
	}
	
	public List<AdminMemberDTO> selectAll(String condition, String keyword) throws SQLException {
		return adminMemberDao.selectAll(condition, keyword);
	}
	
	public AdminMemberDTO selectByUserid(String userid) throws SQLException {
		return adminMemberDao.selectByUserid(userid);
	}
	
	public int updateMember(AdminMemberDTO dto) throws SQLException {
		return adminMemberDao.updateMember(dto);
	}
	
	public String selectAdminPwd(String id) throws SQLException {
		return adminMemberDao.selectAdminPwd(id);
	}
}
