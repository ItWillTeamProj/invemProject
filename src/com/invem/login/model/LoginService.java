package com.invem.login.model;

import java.sql.SQLException;

public class LoginService {
	//아이디 중복확인 관련 상수
	public static final int EXIST_ID=1; //이미 해당 아이디가 존재하는 경우
	public static final int NON_EXIST_ID=2; //이미 해당 아이디가 존재하는 경우
	
	//로그인 처리관련
	public static final int LOGIN_OK=1;	//로그인 성공
	public static final int PWD_DISAGREE=2;	//비밀번호 불일치
	public static final int ID_NONE=3;	//아이디가 존재하지 않음
	
	private LoginDAO logindao;
	
	public LoginService() {
		logindao = new LoginDAO();
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException{
		return logindao.loginCheck(userid, pwd);
	}
	
}
