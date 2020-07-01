package com.invem.common;

public class SummonerVO {
	
	private String accountId;
	private int profileIconId;
	private long revisionDate;
	private String name;
	private String id;
	private String puuid;
	private long summonerLevel;
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public int getProfileIconId() {
		return profileIconId;
	}
	public void setProfileIconId(int profileIconId) {
		this.profileIconId = profileIconId;
	}
	public long getRevisionDate() {
		return revisionDate;
	}
	public void setRevisionDate(long revisionDate) {
		this.revisionDate = revisionDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public long getSummonerLevel() {
		return summonerLevel;
	}
	public void setSummonerLevel(long summonerLevel) {
		this.summonerLevel = summonerLevel;
	}
	public SummonerVO(String accountId, int profileIconId, long revisionDate, String name, String id, String puuid,
			long summonerLevel) {
		super();
		this.accountId = accountId;
		this.profileIconId = profileIconId;
		this.revisionDate = revisionDate;
		this.name = name;
		this.id = id;
		this.puuid = puuid;
		this.summonerLevel = summonerLevel;
	}
	public SummonerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SummonerVO [accountId=" + accountId + ", profileIconId=" + profileIconId + ", revisionDate="
				+ revisionDate + ", name=" + name + ", id=" + id + ", puuid=" + puuid + ", summonerLevel="
				+ summonerLevel + "]";
	}
	
	
	
	
}
