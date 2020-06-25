package com.invem.champion.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.invem.db.ConnectionPoolMgr2;

public class AbilityDAO {
	private ConnectionPoolMgr2 pool;
	
	public AbilityDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<AbilityVO> searchByNo(int champNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		AbilityVO vo = null;
		try {
			con = pool.getConnection();
			
			String sql = "select * from ability where champno = ? order by c_level";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, champNo);
			
			rs = ps.executeQuery();
			List<AbilityVO> list = new ArrayList<AbilityVO>();
			while(rs.next()) {
				vo = new AbilityVO(champNo, rs.getInt(2), rs.getDouble(3), rs.getDouble(4), 
						rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8), 
						rs.getDouble(9), rs.getDouble(10), rs.getInt(11), rs.getInt(12));
				list.add(vo);
			}
			System.out.println("ability 조회 결과 list.size=" + list.size() 
				+ ", 매개변수 champno=" + champNo);
			return list;
		} finally {
			pool.dbClose(con, ps, rs);
		}
	}
}
