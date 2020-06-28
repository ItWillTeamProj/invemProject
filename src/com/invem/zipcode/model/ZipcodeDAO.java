package com.invem.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.invem.db.ConnectionPoolMgr2;

public class ZipcodeDAO {
	private ConnectionPoolMgr2 pool;
	
	public ZipcodeDAO(){
		pool=new ConnectionPoolMgr2();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from zipcode"
				+ " where dong like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, dong);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int seq=rs.getInt("seq");
				String zipcode=rs.getString("zipcode");
				String sido=rs.getString("sido");
				String gugun=rs.getString("gugun");
				String dong2=rs.getString("dong");
				String startBunji=rs.getString("startBunji");
				String endBunji=rs.getString("endBunji");
				
				ZipcodeVO vo = new ZipcodeVO(zipcode, sido, gugun, 
						dong2, startBunji, endBunji, seq);
				list.add(vo);
			}
			
			System.out.println("우편번호 조회 결과 list.size="+list.size()
				+", 매개변수  dong="+dong);
			
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
}