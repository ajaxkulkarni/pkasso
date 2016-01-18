package com.pkasso.web.bo.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.pkasso.web.dao.domain.Slide;

public class Project {
	
	private int id;
	private String name;
	private String clientName;
	private String description;
	private String imagePath;
	private List<Slide> slides;
	private String categoryName;
	private List<MultipartFile> files;
	
	public List<Slide> getSlides() {
		if(CollectionUtils.isEmpty(slides)) {
			slides = new ArrayList<Slide>();
		}
		return slides;
	}
	
	public void setSlides(List<Slide> slides) {
		this.slides = slides;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

}
