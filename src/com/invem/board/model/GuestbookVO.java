package com.invem.board.model;

import java.sql.Timestamp;

public class GuestbookVO {
	private int gno;
	private String userid;
	private String writer_id;
	private String g_comment;
	private Timestamp regdate;
	
	public GuestbookVO() {
		super();
	}

	public GuestbookVO(int gno, String userid, String writer_id, String g_comment, Timestamp regdate) {
		super();
		this.gno = gno;
		this.userid = userid;
		this.writer_id = writer_id;
		this.g_comment = g_comment;
		this.regdate = regdate;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getG_comment() {
		return g_comment;
	}

	public void setG_comment(String g_comment) {
		this.g_comment = g_comment;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "GuestbookVO [gno=" + gno + ", userid=" + userid + ", writer_id=" + writer_id + ", g_comment="
				+ g_comment + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
