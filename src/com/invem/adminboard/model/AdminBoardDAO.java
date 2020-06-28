package com.invem.adminboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.invem.adminmember.model.AdminMemberDTO;
import com.invem.db.ConnectionPoolMgr2;

public class AdminBoardDAO {
	private ConnectionPoolMgr2 pool;
	
	public AdminBoardDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<AdminBoardDTO> selectAll(String code) throws SQLException{
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<AdminBoardDTO> list = new ArrayList<AdminBoardDTO>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from board where cat_code=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, code);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				
				int no = rs.getInt("no");
				String userid = rs.getString("userid");
				String nonUserid = rs.getString("nonUserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend = rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				int filesize = rs.getInt("filesize");
				int downcount = rs.getInt("downcount");
				String originalFilename = rs.getString("originalFilename");
				String ipAddress = rs.getString("ipAddress");
				String delFlag = rs.getString("delFlag");
				String cat_code = rs.getString("cat_code");
				
				AdminBoardDTO dto = new AdminBoardDTO(no, userid, nonUserid, pwd, 
						title, regdate, describe, recommend, views, 
						filename, filesize, downcount, originalFilename, ipAddress, delFlag, cat_code);
				list.add(dto);
			}
			
			System.out.println("list.size()="+list.size());

			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	
	public AdminBoardDTO selectByNo(int no) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		AdminBoardDTO dto = new AdminBoardDTO();
		
		try {
			//1 //2
			con = pool.getConnection();
			
			String sql="select * from Board where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				
				no = rs.getInt("no");
				String userid = rs.getString("userid");
				String nonUserid = rs.getString("nonUserid");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String describe = rs.getString("describe");
				int recommend = rs.getInt("recommend");
				int views = rs.getInt("views");
				String filename = rs.getString("filename");
				int filesize = rs.getInt("filesize");
				int downcount = rs.getInt("downcount");
				String originalFilename = rs.getString("originalFilename");
				String ipAddress = rs.getString("ipAddress");
				String delFlag = rs.getString("delFlag");
				String cat_code = rs.getString("cat_code");
	
				dto.setNo(no);
				dto.setUserid(userid);
				dto.setNonUserid(nonUserid);
				dto.setPwd(pwd);
				dto.setTitle(title);
				dto.setRegdate(regdate);
				dto.setDescribe(describe);
				dto.setRecommend(recommend);
				dto.setViews(views);
				dto.setFilename(filename);
				dto.setFilesize(filesize);
				dto.setDowncount(downcount);
				dto.setOriginalFilename(originalFilename);
				dto.setIpAddress(ipAddress);
				dto.setDelflag(delFlag);
				dto.setCat_code(cat_code);
				
			
			}
			
			System.out.println("게시물 상세보기 결과, dto="+dto+", 매개변수 userid="+no);
			
			return dto;
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	public int updateBoard(AdminBoardDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql="update board" 
					+" set title=?, describe=?, cat_code=?"
					+" where no=? and userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getDescribe());
			ps.setString(3, dto.getCat_code());			
			ps.setInt(4, dto.getNo());
			ps.setString(5, dto.getUserid());
			
			int cnt=ps.executeUpdate();
			System.out.println("게시물 수정결과, cnt="+cnt+", 매개변수 dto="+dto);
			
			return cnt;
			
		}finally {
			pool.dbClose(con, ps);
		}
		
	}
	
	public int deleteBoard(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql="delete board" 
					+" where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("게시물 삭제결과, cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
			
		}finally {
			pool.dbClose(con, ps);
		}
		
	}
	
}
