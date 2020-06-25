package com.invem.champion.model;

import java.sql.SQLException;
import java.util.List;

public class AbilityService {
	
	private AbilityDAO dao;
	
	public AbilityService() {
		dao = new AbilityDAO();
	}
	
	public List<AbilityVO> searchByNo(int champNo) throws SQLException {
		return dao.searchByNo(champNo);
	}
}
