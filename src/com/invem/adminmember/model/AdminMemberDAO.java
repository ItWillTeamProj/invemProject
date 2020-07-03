package com.invem.adminmember.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.invem.db.ConnectionPoolMgr2;


public class AdminMemberDAO {
	private ConnectionPoolMgr2 pool;
	
	public AdminMemberDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<AdminMemberDTO> selectAll(String condition, String keyword) throws SQLException{
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<AdminMemberDTO> list = new ArrayList<AdminMemberDTO>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from member";
			if(keyword!=null && !keyword.isEmpty()) { //검색의 경우
				sql+=" where "+ condition +" like '%' || ? || '%'";
			}				
			sql+=" order by regdate desc";
			
			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) { //검색의 경우
				ps.setString(1, keyword);
			}

			rs=ps.executeQuery();
			while(rs.next()) {
				
				String userid = rs.getString("userid");
				String nickname = rs.getString("nickname");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String dateofbirth = rs.getString("dateofbirth");
				String phoneno = rs.getString("phoneno");
				String email = rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");
				String detail = rs.getString("detail");
				String sum_name = rs.getString("sum_name");
				Timestamp regdate = rs.getTimestamp("regdate");
				int caution = rs.getInt("caution");
				
				AdminMemberDTO dto = new AdminMemberDTO(userid, nickname, pwd, name, 
						dateofbirth, phoneno, email, zipcode, address, 
						detail, sum_name, regdate, caution);
				list.add(dto);
			}
			
			System.out.println("list.size()="+list.size());

			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	public String selectAdminPwd(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String pwd="";
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select pwd from member"
					 +" where userid=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
			
			System.out.println("매개변수 userid="+id+", pwd="+pwd);
			return pwd;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	
	public AdminMemberDTO selectByUserid(String userid) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		AdminMemberDTO dto = new AdminMemberDTO();
		try {
			//1 //2
			con = pool.getConnection();
			
			String sql="select * from member where userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userid);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				
				userid=rs.getString("userid");
				String nickname=rs.getString("nickname");
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String dateofbirth=rs.getString("dateofbirth");
				String phoneno=rs.getString("phoneno");
				String email=rs.getString("email");
				String zipcode=rs.getString("zipcode");
				String address=rs.getString("address");
				String detail=rs.getString("detail");
				String sum_name=rs.getString("sum_name");
				Timestamp regdate=rs.getTimestamp("regdate");
				int caution=rs.getInt("caution");
	
				dto.setUserid(userid);
				dto.setNickname(nickname);
				dto.setPwd(pwd);
				dto.setName(name);
				dto.setDateofbirth(dateofbirth);
				dto.setPhoneno(phoneno);
				dto.setEmail(email);
				dto.setZipcode(zipcode);
				dto.setAddress(address);
				dto.setDetail(detail);
				dto.setSum_name(sum_name);
				dto.setRegdate(regdate);
				dto.setCaution(caution);
			
			}
			
			System.out.println("회원 상세보기 결과, dto="+dto+", 매개변수 userid="+userid);
			return dto;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	public int updateMember(AdminMemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql="update member" 
					+" set name=?, dateOfBirth=?, phoneno=?,"
					+" email=?, zipcode=?, address=?, detail=?, sum_name=? , caution=?" 
					+" where userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDateofbirth());
			ps.setString(3, dto.getPhoneno());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getZipcode());
			ps.setString(6, dto.getAddress());
			ps.setString(7, dto.getDetail());
			ps.setString(8, dto.getSum_name());
			ps.setInt(9, dto.getCaution()); 
			
			ps.setString(10, dto.getUserid());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원정보 수정결과, cnt="+cnt+", 매개변수 dto="+dto);
			
			return cnt;
			
		}finally {
			pool.dbClose(con, ps);
		}
		
	}
}
