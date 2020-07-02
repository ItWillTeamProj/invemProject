package com.invem.board.model;

public class RecommendVO {
	private int no;
	private int board_no;
	private String userid;
	
	public RecommendVO() {
	
		super();
	}

	public RecommendVO(int no, int board_no, String userid) {
		super();
		this.no = no;
		this.board_no = board_no;
		this.userid = userid;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "RecommendVO [no=" + no + ", board_no=" + board_no + ", userid=" + userid + "]";
	}
	
	
	
	
}
