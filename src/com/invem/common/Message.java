package com.invem.common;

import java.util.List;

public class Message {
	private	String	severity;
	private	String	updated_at;
	private	String	author;
	private	List<Translation>	translations;
	private	String	created_at;
	private	String	id;
	private	String content;
	private String heading;
	
	
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public List<Translation> getTranslations() {
		return translations;
	}
	public void setTranslations(List<Translation> translations) {
		this.translations = translations;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Message [severity=" + severity + ", updated_at=" + updated_at + ", author=" + author + ", translations="
				+ translations + ", created_at=" + created_at + ", id=" + id + ", content=" + content + ", heading="
				+ heading + "]";
	}
	
	
	
	
}
