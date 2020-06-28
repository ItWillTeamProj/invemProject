package com.invem.adminboard.model;

import java.sql.SQLException;
import java.util.List;

public class AdminBoardService {
	
	private AdminBoardDAO adminBoardDao;
	
	public AdminBoardService() {
		adminBoardDao =new AdminBoardDAO();
	}
	
	public List<AdminBoardDTO> selectAll(String code) throws SQLException{
		return adminBoardDao.selectAll(code);
	}
	
	public AdminBoardDTO selectByNo(int no) throws SQLException {
		return adminBoardDao.selectByNo(no);
	}
}
