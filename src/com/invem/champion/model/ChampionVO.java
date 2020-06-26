package com.invem.champion.model;

public class ChampionVO {
	private int champ_no;
	private String name;
	private String role;
	private String lane;
	private String skill;
	private String nickname;
	private String describe;
	public int getChamp_no() {
		return champ_no;
	}
	public void setChamp_no(int champ_no) {
		this.champ_no = champ_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "ChampionVO [champ_no=" + champ_no + ", name=" + name + ", role=" + role + ", lane=" + lane + ", skill="
				+ skill + ", nickname=" + nickname + ", describe=" + describe + "]";
	}
	public ChampionVO(int champ_no, String name, String role, String lane, String skill, String nickname,
			String describe) {
		super();
		this.champ_no = champ_no;
		this.name = name;
		this.role = role;
		this.lane = lane;
		this.skill = skill;
		this.nickname = nickname;
		this.describe = describe;
	}
	public ChampionVO() {
		super();
	}
	
}
