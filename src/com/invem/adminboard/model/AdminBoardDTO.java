package com.invem.adminboard.model;

import java.sql.Timestamp;

public class AdminBoardDTO {
	
	private int no;
	private String userid;
	private String nonUserid;
	private String pwd;
	private String title;
	private Timestamp regdate;
	private String describe;
	private int recommend;
	private int views;
	private String filename;
	private int filesize;
	private int downcount;
	private String originalFilename;
	private String ipAddress;
	private String delflag;
	private String cat_code;
	
	public AdminBoardDTO() {
		super();
	}

	public AdminBoardDTO(int no, String userid, String nonUserid, String pwd, String title, Timestamp regdate,
			String describe, int recommend, int views, String filename, int filesize, int downcount,
			String originalFilename, String ipAddress, String delflag, String cat_code) {
		super();
		this.no = no;
		this.userid = userid;
		this.nonUserid = nonUserid;
		this.pwd = pwd;
		this.title = title;
		this.regdate = regdate;
		this.describe = describe;
		this.recommend = recommend;
		this.views = views;
		this.filename = filename;
		this.filesize = filesize;
		this.downcount = downcount;
		this.originalFilename = originalFilename;
		this.ipAddress = ipAddress;
		this.delflag = delflag;
		this.cat_code = cat_code;
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

	public String getNonUserid() {
		return nonUserid;
	}

	public void setNonUserid(String nonUserid) {
		this.nonUserid = nonUserid;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
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

	@Override
	public String toString() {
		return "AdminBoardDTO [no=" + no + ", userid=" + userid + ", nonUserid=" + nonUserid + ", pwd=" + pwd
				+ ", title=" + title + ", regdate=" + regdate + ", describe=" + describe + ", recommend=" + recommend
				+ ", views=" + views + ", filename=" + filename + ", filesize=" + filesize + ", downcount=" + downcount
				+ ", originalFilename=" + originalFilename + ", ipAddress=" + ipAddress + ", delflag=" + delflag
				+ ", cat_code=" + cat_code + "]";
	}

}
