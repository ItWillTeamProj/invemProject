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
	
	public List<ChampionVO> searchAll(String[] role, String[] skill) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from champ_list ";
			
			if(role != null && role.length > 0) {
				sql += "where role like ";
				for(int i = 0; i < role.length; i++) {
					sql += "'%" + role[i] + "%'";
					if(i < (role.length -1)) {
						sql += " and role like ";
					}
				}
				
				if(skill != null && skill.length >0) {
					sql += "and skill like ";
					
					for(int i = 0; i < skill.length; i++) {
						sql += "'%" + skill[i] + "%'";
						if(i < (skill.length -1)) {
							sql += " and skill like ";
						}
					}
				}
				
			}else {
				if(skill != null && skill.length >0) {
					sql += "where skill like ";
					for(int i = 0; i < skill.length; i++) {
						sql += "'%" + skill[i] + "%'";
						if(i < (skill.length -1)) {
							sql += " and skill like ";
						}
					}
				}
			}
			
			sql += " order by CHAMP_no";
			
			System.out.println("sql="+sql);
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			ChampionVO vo = null;
			List<ChampionVO> list = new ArrayList<ChampionVO>();
			while(rs.next()) {
				int no = rs.getInt("champ_no");
				String name = rs.getString("name");
				String crole = rs.getString("role");
				String lane = rs.getString("lane");
				String cskill = rs.getString("skill");
				String nickName = rs.getString("nickname");
				String describe = rs.getString("describe");
				
				vo = new ChampionVO(no, name, crole, lane, cskill, nickName, describe);
				list.add(vo);
				
			}//while
			System.out.println("list.size = " + list.size());
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
			
		}
	}
	
	public List<ChampionVO> searchAll(String val) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int start = 0;
		int end = 0;
		
		switch (val) {
		case "ㄱ":
			start = 0;
			end = 45207;
			break;
		case "ㄴ":
			start = 45208;
			end = 45795;
			break;
		case "ㄷ":
			start = 45796;
			end = 46971;
			break;
		case "ㄹ":
			start = 46972;
			end = 47559;
			break;
		case "ㅁ":
			start = 47560;
			end = 48147;
			break;
		case "ㅂ":
			start = 48148;
			end = 49323;
			break;
		case "ㅅ":
			start = 49324;
			end = 50499;
			break;
		case "ㅇ":
			start = 50500;
			end = 51087;
			break;
		case "ㅈ":
			start = 51088;
			end = 52263;
			break;
		case "ㅊ":
			start = 52264;
			end = 52851;
			break;
		case "ㅋ":
			start = 52852;
			end = 53439;
			break;
		case "ㅌ":
			start = 53440;
			end = 54027;
			break;
		case "ㅍ":
			start = 54028;
			end = 54615;
			break;
		case "ㅎ":
			start = 55204;
			end = 45207;
			break;
		default:
			break;
		}
		
		try {
			con = pool.getConnection();
			String sql = "SELECT * FROM champ_list ";
			if(!val.equals("all")) {
				sql	= sql + " WHERE name BETWEEN NCHR("+start+") AND NCHR("+end+")";
			}
			sql += " order by CHAMP_no";
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
	
	
}
