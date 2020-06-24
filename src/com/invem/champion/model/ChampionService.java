package com.invem.champion.model;

import java.sql.SQLException;
import java.util.List;

public class ChampionService {
	
	private ChampionDAO dao;
	
	public ChampionService() {
		dao = new ChampionDAO();
	}
	
	public List<ChampionVO> searchAll() throws SQLException{
		return dao.searchAll();
	}
	
	public ChampionVO searchByNo(int no) throws SQLException {
		return dao.searchByNo(no);
	}
		
}
