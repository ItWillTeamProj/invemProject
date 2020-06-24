package com.invem.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.invem.db.ConnectionPoolMgr2;
import com.invem.login.model.LoginService;

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
			String sql="select pwd from member where userid= ?";
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
}
