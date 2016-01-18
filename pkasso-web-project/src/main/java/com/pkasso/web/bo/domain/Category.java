package com.pkasso.web.bo.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

public class Category {
	
	private int id;
	private String name;
	private String description;
	private String iconPath;
	private List<Project> projects;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Project> getProjects() {
		if(CollectionUtils.isEmpty(projects)) {
			projects = new ArrayList<Project>();
		}
		return projects;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIconPath() {
		return iconPath;
	}
	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

}
