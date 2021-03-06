package com.invem.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int no;	//게시판 번호
	private String userid;	//	회원 id
	private String nonuserid;	//비회원 글 작성 id
	private String pwd;	//비회원 글작성용 비번
	private String title;	//글제목
	private Timestamp regdate;	//작성일
	private String describe;	//글내용
	private int recommend;	//추천
	private int views;	//조회수
	private String ipaddress;	//ip주소
	private String delflag;	//삭제플래그 
	private String cat_code;	//게시판 코드
	private int champ_no; //챔피언번호
	
	public BoardVO() {
		super();
	}

	

	public BoardVO(int no, String userid, String nonuserid, String pwd, String title, Timestamp regdate,
			String describe, int recommend, int views, String ipaddress, String delflag, String cat_code) {
		super();
		this.no = no;
		this.userid = userid;
		this.nonuserid = nonuserid;
		this.pwd = pwd;
		this.title = title;
		this.regdate = regdate;
		this.describe = describe;
		this.recommend = recommend;
		this.views = views;
		this.ipaddress = ipaddress;
		this.delflag = delflag;
		this.cat_code = cat_code;
	}



	public BoardVO(int no, String userid, String nonuserid, String pwd, String title, Timestamp regdate,
			String describe, int recommend, int views, String ipaddress, String delflag, String cat_code,
			int champ_no) {
		super();
		this.no = no;
		this.userid = userid;
		this.nonuserid = nonuserid;
		this.pwd = pwd;
		this.title = title;
		this.regdate = regdate;
		this.describe = describe;
		this.recommend = recommend;
		this.views = views;
		this.ipaddress = ipaddress;
		this.delflag = delflag;
		this.cat_code = cat_code;
		this.champ_no = champ_no;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNonuserid() {
		return nonuserid;
	}

	public void setNonuserid(String nonuserid) {
		this.nonuserid = nonuserid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	
	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public String getCat_code() {
		return cat_code;
	}

	public void setCat_code(String cat_code) {
		this.cat_code = cat_code;
	}

	public int getChamp_no() {
		return champ_no;
	}

	public void setChamp_no(int champ_no) {
		this.champ_no = champ_no;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", userid=" + userid + ", nonuserid=" + nonuserid + ", pwd=" + pwd + ", title="
				+ title + ", regdate=" + regdate + ", describe=" + describe + ", recommend=" + recommend + ", views="
				+ views + ", ipaddress=" + ipaddress + ", delflag=" + delflag + ", cat_code=" + cat_code + ", champ_no="
				+ champ_no + "]";
	}

}
