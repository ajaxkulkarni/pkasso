package com.pkasso.web.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.pkasso.web.bo.domain.Category;
import com.pkasso.web.bo.domain.Project;
import com.pkasso.web.dao.domain.Slide;

public class DataUtil {

	/*
	 * private static final String COLUMN_CLIENT_NAME = "Client Name"; private
	 * static final String COLUMN_CATEGORY = "Category"; private static final
	 * String COLUMN_PROJECT_NAME = "Project Name"; private static final String
	 * COLUMN_IMG_ID = "Img ID"; private static final String COLUMN_IMAGE_PATH =
	 * "Image path"; private static final String COLUMN_DESCRIPTION =
	 * "Description"; private static final String COLUMN_NAME = "Name";
	 * 
	 * private static final int COLUMN_NAME = 0; private static final int
	 * COLUMN_IMG_ID = 1; private static final int COLUMN_CATEGORY = 2; private
	 * static final int COLUMN_DESCRIPTION = 3; private static final int
	 * COLUMN_CLIENT_NAME = 4; private static final int COLUMN_IMAGE_PATH = 0;
	 * private static final int COLUMN_PROJECT_NAME = 2;
	 */

	private static final String IMAGES_SHEET = "Images";
	private static final String PROJECTS_SHEET = "Projects";
	private static final String CATEGORIES_SHEET = "Categories";

	private static final String CSV_PATH = "src/main/webapp/resources/";
	private DBUtil dbUtil;

	public List<Category> getCategories() throws FileNotFoundException, IOException {

		List<Category> categories = new ArrayList<Category>();
		List<com.pkasso.web.dao.domain.Category> categoriesData = dbUtil.getCategories();
		for (com.pkasso.web.dao.domain.Category cat : categoriesData) {
			Category category = new Category();
			category.setName(cat.getName());
			category.setId(cat.getId());
			category.setDescription(cat.getDescription());
			// category.setIconPath(cat.g);
			getProjects(category);
			categories.add(category);
		}
		return categories;
	}

	private void getProjects(Category category) throws FileNotFoundException, IOException {
		/*
		 * CsvReader reader = new CsvReader(CSV_PATH + PROJECTS_SHEET + ".csv");
		 * //reader.readHeaders(); while (reader.readRecord()) { String
		 * categoryName = reader.get(COLUMN_CATEGORY);
		 * if(!categoryName.equalsIgnoreCase(category.getName())) { continue; }
		 * Project project = new Project();
		 * project.setName(reader.get(COLUMN_NAME));
		 * project.setDescription(reader.get(COLUMN_DESCRIPTION));
		 * project.setImagePath(reader.get(COLUMN_IMG_ID));
		 * project.setCategoryName(categoryName);
		 * project.setClientName(reader.get(COLUMN_CLIENT_NAME));
		 * setProjectSlides(project); category.getProjects().add(project); }
		 * reader.close();
		 */
		List<com.pkasso.web.dao.domain.Project> projects = dbUtil.getProjects(category.getId());
		for (com.pkasso.web.dao.domain.Project dbProject : projects) {
			Project project = new Project();
			project.setId(dbProject.getId());
			project.setName(dbProject.getName());
			project.setDescription(dbProject.getDescription());
			project.setCategoryName(category.getName());
			// project.setClientName(dbProject.getclie);
			setProjectSlides(project, dbProject.getId());
			category.getProjects().add(project);
		}
	}

	private void setProjectSlides(Project project, int id) throws IOException {
		/*
		 * CsvReader reader = new CsvReader(CSV_PATH + IMAGES_SHEET + ".csv");
		 * //reader.readHeaders(); while (reader.readRecord()) {
		 * if(StringUtils.equals
		 * (reader.get(COLUMN_PROJECT_NAME),project.getName())) {
		 * project.getSlides().add(reader.get(COLUMN_IMG_ID)); } if(
		 * StringUtils.equals(reader.get("Img ID"),project.getImagePath())) {
		 * project.setImagePath(reader.get("Image path")); } }
		 */
		project.setSlides(dbUtil.getSlides(id));
	}

	public void addProject(Project project) throws FileNotFoundException, IOException {

		com.pkasso.web.dao.domain.Project projectData = new com.pkasso.web.dao.domain.Project();
		projectData.setName(project.getName());
		com.pkasso.web.dao.domain.Category category = dbUtil.getCategory(project.getCategoryName());
		if (category != null) {
			projectData.setCategoryId(category.getId());
		}
		projectData.setDescription(project.getDescription());
		projectData.setClientName(project.getClientName());
		dbUtil.addProject(projectData);
		processImages(project);
	}

	private void processImages(Project project) {
		int projectId = dbUtil.getProjectId();
		for (Slide slide : project.getSlides()) {
			slide.setProjectId(projectId);
			dbUtil.addSlide(slide);
		}
		return;
	}

	/*
	 * private static int processImages(Project project, boolean append) throws
	 * IOException { CsvWriter csvOutput = new CsvWriter(new FileWriter(CSV_PATH
	 * + IMAGES_SHEET + ".csv", append), ','); String imgId = ""; CsvReader
	 * reader = new CsvReader(CSV_PATH + IMAGES_SHEET + ".csv");
	 * //reader.readHeaders(); while (reader.readRecord()) { imgId =
	 * reader.get(COLUMN_IMG_ID); } int nextId = 1; int imageId = nextId;
	 * if(!StringUtils.isBlank(imgId)) { imageId = Integer.parseInt(imgId);
	 * nextId = imageId + 1; } reader.close(); for(String
	 * slide:project.getSlides()) { csvOutput.write(slide);
	 * csvOutput.write(String.valueOf(nextId));
	 * csvOutput.write(project.getName()); csvOutput.endRecord(); nextId++; }
	 * csvOutput.close(); return (imageId+1); }
	 */

	public InputStream getImage(int slideId) throws IOException {
		Slide slide = dbUtil.getSlide(slideId);
		if (slide == null) {
			return null;
		}
		return new FileInputStream(slide.getImagePath());
	}

	/*
	 * public static Project getProjects(String projectName) throws IOException
	 * { Project project = new Project(); CsvReader reader = new
	 * CsvReader(CSV_PATH + PROJECTS_SHEET + ".csv"); //reader.readHeaders();
	 * while (reader.readRecord()) {
	 * if(StringUtils.equals(projectName,reader.get(COLUMN_NAME))) {
	 * createProject(project, reader); break; } } reader.close(); return
	 * project;
	 * 
	 * }
	 * 
	 * private static void createProject(Project project, CsvReader reader)
	 * throws IOException { project.setName(reader.get(COLUMN_NAME));
	 * project.setDescription(reader.get(COLUMN_DESCRIPTION));
	 * project.setImagePath(reader.get(COLUMN_IMG_ID));
	 * project.setCategoryName(reader.get(COLUMN_CATEGORY));
	 * project.setClientName(reader.get(COLUMN_CLIENT_NAME));
	 * //setProjectSlides(project); }
	 */

	public void deleteProject(int projectId) {
		dbUtil.deleteProject(projectId);
		dbUtil.deleteSlides(projectId);
	}

	public DBUtil getDbUtil() {
		return dbUtil;
	}

	public void setDbUtil(DBUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	public Project getProject(int projectId) {
		com.pkasso.web.dao.domain.Project dataProject = dbUtil.getProject(projectId);
		Project project = getProject(dataProject);
		return project;
	}

	private Project getProject(com.pkasso.web.dao.domain.Project dataProject) {
		Project project = new Project();
		project.setName(dataProject.getName());
		project.setId(dataProject.getId());
		project.setDescription(dataProject.getDescription());
		project.setClientName(dataProject.getClientName());
		com.pkasso.web.dao.domain.Category category = dbUtil.getCategory(dataProject.getCategoryId());
		if (category != null) {
			project.setCategoryName(category.getName());
		}
		// TODO:
		// project.setClientName(dataProject.getc);
		project.setId(dataProject.getId());
		project.setSlides(dbUtil.getSlides(dataProject.getId()));
		return project;
	}

	public List<Project> getCredentials() {
		List<com.pkasso.web.dao.domain.Project> projects = dbUtil.getProjects();
		List<Project> currentProjects = new ArrayList<Project>();
		for(com.pkasso.web.dao.domain.Project project: projects) {
			if(project.getCategoryId() != 0) {
				continue;
			}
			currentProjects.add(getProject(project));
		}
		return currentProjects;
	}

}
