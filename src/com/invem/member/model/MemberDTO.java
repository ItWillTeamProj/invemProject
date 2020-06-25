package com.invem.member.model;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String userid;
    private String nickname;
    private String pwd;
    private String name;
    private String dateofbirth;
    private String phoneno;
    private String email;
    private String zipcode;
    private String address;
    private String detail;
    private String sum_name;
    private Timestamp regdate;
    private int caution;
    
	public MemberDTO() {
		super();
	}

	public MemberDTO(String userid, String nickname, String pwd, String name, String dateofbirth, String phoneno,
			String email, String zipcode, String address, String detail, String sum_name, Timestamp regdate,
			int caution) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.pwd = pwd;
		this.name = name;
		this.dateofbirth = dateofbirth;
		this.phoneno = phoneno;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.detail = detail;
		this.sum_name = sum_name;
		this.regdate = regdate;
		this.caution = caution;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getSum_name() {
		return sum_name;
	}

	public void setSum_name(String sum_name) {
		this.sum_name = sum_name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCaution() {
		return caution;
	}

	public void setCaution(int caution) {
		this.caution = caution;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", nickname=" + nickname + ", pwd=" + pwd + ", name=" + name
				+ ", dateofbirth=" + dateofbirth + ", phoneno=" + phoneno + ", email=" + email + ", zipcode=" + zipcode
				+ ", address=" + address + ", detail=" + detail + ", sum_name=" + sum_name + ", regdate=" + regdate
				+ ", caution=" + caution + "]";
	}
	
}
