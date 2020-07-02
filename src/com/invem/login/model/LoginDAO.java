package com.invem.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.invem.db.ConnectionPoolMgr2;
import com.invem.login.model.LoginService;
import com.invem.member.model.MemberDTO;

public class LoginDAO {
	
	private ConnectionPoolMgr2 pool;
	
	public LoginDAO(){
		pool=new ConnectionPoolMgr2();
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			
			//3
			String sql="select pwd from member where userid= ?  and caution <5";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				
				if(dbPwd.equals(pwd)) { 
					result=LoginService.LOGIN_OK;
				}else{
					result=LoginService.PWD_DISAGREE;
				}
			}else{ //아이디가 없는 경우
				result=LoginService.ID_NONE;
			}
			
			System.out.println("비밀번호 체크 결과, result="+result
				+", 매개변수 userid="+userid+", pwd="+pwd);
			return result;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

	public MemberDTO selectMember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		MemberDTO vo = new MemberDTO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from member" + 
					" where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
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
				
				vo.setNickname(nickname);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setDateofbirth(dateofbirth);
				vo.setPhoneno(phoneno);
				vo.setEmail(email);
				vo.setZipcode(zipcode);
				vo.setAddress(address);
				vo.setDetail(detail);
				vo.setSum_name(sum_name);
				vo.setRegdate(regdate);
				vo.setUserid(userid);
			}
			
			System.out.println("회원정보 조회 결과 vo="+vo
					+", 매개변수 userid="+userid);
			
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
}
