package com.invem.board.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int rep_no;
	private String userid;
	private String reply;
	private Timestamp regdate;
	private int no;
	private int groupno;
	private int sortno;
	private int step;
	private String delflag;
	private String pwd;
	
	
	public ReplyVO() {
		super();
	}


	public ReplyVO(int rep_no, String userid, String reply, Timestamp regdate, int no, int groupno, int sortno,
			int step, String delflag, String pwd) {
		super();
		this.rep_no = rep_no;
		this.userid = userid;
		this.reply = reply;
		this.regdate = regdate;
		this.no = no;
		this.groupno = groupno;
		this.sortno = sortno;
		this.step = step;
		this.delflag = delflag;
		this.pwd = pwd;
	}


	public int getRep_no() {
		return rep_no;
	}


	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
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


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getGroupno() {
		return groupno;
	}


	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}


	public int getSortno() {
		return sortno;
	}


	public void setSortno(int sortno) {
		this.sortno = sortno;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
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


	@Override
	public String toString() {
		return "ReplyVO [rep_no=" + rep_no + ", userid=" + userid + ", reply=" + reply + ", regdate=" + regdate
				+ ", no=" + no + ", groupno=" + groupno + ", sortno=" + sortno + ", step=" + step + ", delflag="
				+ delflag + ", pwd=" + pwd + "]";
	}

	
}