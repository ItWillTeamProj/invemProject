package com.invem.common;

import java.util.List;

public class ShardState {
	private List<String> locales;	
	private String hostname;
	private String name;
	private List<Service> services;	
	private String slug	;
	private String region_tag;
	public List<String> getLocales() {
		return locales;
	}
	public void setLocales(List<String> locales) {
		this.locales = locales;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Service> getServices() {
		return services;
	}
	public void setServices(List<Service> services) {
		this.services = services;
	}
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public String getRegion_tag() {
		return region_tag;
	}
	public void setRegion_tag(String region_tag) {
		this.region_tag = region_tag;
	}
	@Override
	public String toString() {
		return "ShardState [locales=" + locales + ", hostname=" + hostname + ", name=" + name + ", slug=" + slug
				+ ", region_tag=" + region_tag + "]";
	}
	
	
}
