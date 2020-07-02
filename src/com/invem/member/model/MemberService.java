package com.invem.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberService {
	
	private MemberDAO memberdao;
	
	public MemberService() {
		memberdao = new MemberDAO();
	}
	
	public int insertMember(MemberDTO vo) throws SQLException {
		return memberdao.insertMember(vo);
	}
	
	public int overlap(String userid) throws SQLException {
		return memberdao.overlap(userid);
	}
	
	public MemberDTO selectMember(String userid) throws SQLException {
		return memberdao.selectMember(userid);
	}
	
	public int updateMember(MemberDTO vo) throws SQLException {
		return memberdao.updateMember(vo);
	}
	
}
