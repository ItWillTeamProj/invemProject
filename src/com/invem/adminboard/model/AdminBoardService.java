package com.invem.adminboard.model;

import java.sql.SQLException;
import java.util.List;

public class AdminBoardService {
	
	private AdminBoardDAO adminBoardDao;
	
	public AdminBoardService() {
		adminBoardDao =new AdminBoardDAO();
	}
	
	public int insertBoard(AdminBoardDTO dto) throws SQLException {
		return adminBoardDao.insertBoard(dto);
	}
	
	public List<AdminBoardDTO> selectAll(String code, String condition, String keyword) throws SQLException{
		return adminBoardDao.selectAll(code, condition, keyword);
	}
	
	public AdminBoardDTO selectByNo(int no) throws SQLException {
		return adminBoardDao.selectByNo(no);
	}
	
	public int updateBoard(AdminBoardDTO dto) throws SQLException {
		return adminBoardDao.updateBoard(dto);
	}
	
	public int deleteBoard(int no) throws SQLException {
		return adminBoardDao.deleteBoard(no);
	}
}
