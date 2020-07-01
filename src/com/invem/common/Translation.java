package com.invem.common;

public class Translation {
	private	String	updated_at;
	private	String	locale;
	private	String content;
	
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Translation [updated_at=" + updated_at + ", locale=" + locale + ", content=" + content + "]";
	}
	
	
}
