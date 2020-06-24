package com.invem.champion.model;

public class ChampionVO {
	private int no;
	private String champ;
	private String role;
	private String lane;
	private String skill;
	private String nickname;
	private String describe;
	public ChampionVO() {
		super();
	}
	public ChampionVO(int no, String champ, String role, String lane, String skill, String nickname, String describe) {
		super();
		this.no = no;
		this.champ = champ;
		this.role = role;
		this.lane = lane;
		this.skill = skill;
		this.nickname = nickname;
		this.describe = describe;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getChamp() {
		return champ;
	}
	public void setChamp(String champ) {
		this.champ = champ;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLane() {
		return lane;
	}
	public void setLane(String lane) {
		this.lane = lane;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	@Override
	public String toString() {
		return "ChampVO [no=" + no + ", champ=" + champ + ", role=" + role + ", lane=" + lane + ", skill=" + skill
				+ ", nickname=" + nickname + ", describe=" + describe + "]";
	}
}
