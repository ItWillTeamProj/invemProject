package com.invem.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.imvem.db.ConnectionPoolMgr2;
import com.invem.member.model.MemberDTO;

public class MemberDAO {

private ConnectionPoolMgr2 pool;
	
	public MemberDAO(){
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertMember(MemberDTO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into member(userid, nickname, pwd, name, "
					+ " dateofbirth, phoneno, email, zipcode, address, detail, sum_name)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getName());
			ps.setString(5, vo.getDateofbirth());
			ps.setString(6, vo.getPhoneno());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getZipcode());
			ps.setString(9, vo.getAddress());
			ps.setString(10, vo.getDetail());
			ps.setString(11, vo.getSum_name());

			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과, cnt=" + cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
}
