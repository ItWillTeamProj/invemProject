package com.invem.board.model;

public class CategoryVO {
	private String cat_code;	//게시판 코드
	private String cat_name;	//게시판 이름
	private String isuser;	//제약사항(비회원 글쓰기 가능여부)\
	
	
	public CategoryVO() {
		super();
	}


	public CategoryVO(String cat_code, String cat_name, String isuser) {
		super();
		this.cat_code = cat_code;
		this.cat_name = cat_name;
		this.isuser = isuser;
	}


	public String getCat_code() {
		return cat_code;
	}


	public void setCat_code(String cat_code) {
		this.cat_code = cat_code;
	}


	public String getCat_name() {
		return cat_name;
	}


	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}


	public String getIsuser() {
		return isuser;
	}


	public void setIsuser(String isuser) {
		this.isuser = isuser;
	}


	@Override
	public String toString() {
		return "CategoryVO [cat_code=" + cat_code + ", cat_name=" + cat_name + ", isuser=" + isuser + "]";
	}
	
	
	
	
}
