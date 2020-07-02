package com.invem.board.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int rep_no;
	private String username;
	private String reply;
	private Timestamp regdate;
	private int groupno;
	private String delflag;
	private String pwd;

	public ReplyVO() {
		super();
	}

	public int getRep_no() {
		return rep_no;
	}

	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "ReplyVO [rep_no=" + rep_no + ", username=" + username + ", reply=" + reply + ", regdate=" + regdate
				+ ", groupno=" + groupno + ", delflag=" + delflag + ", pwd=" + pwd + "]";
	}

	public ReplyVO(int rep_no, String username, String reply, Timestamp regdate, int groupno, String delflag,
			String pwd) {
		super();
		this.rep_no = rep_no;
		this.username = username;
		this.reply = reply;
		this.regdate = regdate;
		this.groupno = groupno;
		this.delflag = delflag;
		this.pwd = pwd;
	}

}