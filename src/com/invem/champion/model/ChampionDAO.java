package com.invem.champion.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.invem.db.ConnectionPoolMgr2;


public class ChampionDAO {
	ConnectionPoolMgr2 pool;
	
	public ChampionDAO(){
		pool = new ConnectionPoolMgr2();
	}
	
	public List<ChampionVO> searchAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from champ_list order by CHAMP_no";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			ChampionVO vo = null;
			List<ChampionVO> list = new ArrayList<ChampionVO>();
			while(rs.next()) {
				int no = rs.getInt("champ_no");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String lane = rs.getString("lane");
				String skill = rs.getString("skill");
				String nickName = rs.getString("nickname");
				String describe = rs.getString("describe");
				
				vo = new ChampionVO(no, name, role, lane, skill, nickName, describe);
				list.add(vo);
				
			}//while
			System.out.println("list.size = " + list.size());
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
			
		}
	}
	
	public ChampionVO searchByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ChampionVO vo = null;
		try {
			con = pool.getConnection();
			String sql = "select * from champ_list where champ_no = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				String name = rs.getString("name");
				String role = rs.getString("role");
				String lane = rs.getString("lane");
				String skill = rs.getString("skill");
				String nickName = rs.getString("nickname");
				String describe = rs.getString("describe");
				
				vo = new ChampionVO(no, name, role, lane, skill, nickName, describe);
			}
			System.out.println("vo = " + vo);
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);
			
		}
		
	}
	
}
