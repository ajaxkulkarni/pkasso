package com.pkasso.web.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.pkasso.web.bo.domain.Category;
import com.pkasso.web.bo.domain.Project;
import com.pkasso.web.util.DataUtil;
import com.pkasso.web.util.ImageUtil;

@Controller
@SessionAttributes("loggedIn")
public class MainController {

	private static final String LOGGED_IN = "loggedIn";
	private static final String MODEL_RESOURCES = "resources";
	//private static final String ASSETS_ROOT = "/resources"; //DEV
	private static final String ASSETS_ROOT = "../../resources/design";
	private static final String PROJECTS_URL = "projects.htm";
	/*API KEY :  AIzaSyDWC33tTp0Sc0kFvGrrLkQez_-p9ChwbHI*/
	private DataUtil dataUtil;
	private String resultMsg;
	//private boolean loggedIn;
	
	public DataUtil getDataUtil() {
		return dataUtil;
	}

	@Autowired(required = true)
	@Qualifier(value = "DataUtil")
	public void setDataUtil(DataUtil dataUtil) {
		this.dataUtil = dataUtil;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String init(HttpServletRequest request, ModelMap model) {
		return "index";
	}
	
	@RequestMapping(value = "/home.htm", method = RequestMethod.GET)
	public String initHome(HttpServletRequest request, ModelMap model) {
		return "index";
	}
	
	@RequestMapping(value = "/credentials.htm", method = RequestMethod.GET)
	public String credentials(HttpServletRequest request, ModelMap model) {
		List<Project> categories = dataUtil.getCredentials();
		model.addAttribute("projects", categories);
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "credentials";
	}
	
	@RequestMapping(value = "/services.htm", method = RequestMethod.GET)
	public String services(HttpServletRequest request, ModelMap model) {
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "services";
	}
	
	@RequestMapping(value = "/vision.htm", method = RequestMethod.GET)
	public String vision(HttpServletRequest request, ModelMap model) {
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "vision";
	}
	
	@RequestMapping(value = "/contact.htm", method = RequestMethod.GET)
	public String contact(HttpServletRequest request, ModelMap model) {
		return "contact";
	}
	
	@RequestMapping(value = "/projects.htm", method = RequestMethod.GET)
	public String viewProjects(HttpServletRequest request, ModelMap model) {
		try {
			List<Category> categories = dataUtil.getCategories();
			model.addAttribute("categories", categories);
			model.addAttribute("project", new Project());
			//model.addAttribute("loggedIn", loggedIn);
		} catch (FileNotFoundException e) {
			model.addAttribute("error", "Error in loading file from database!");
		} catch (IOException e) {
			model.addAttribute("error", "File not found!");
		} 
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "projects";
	}

	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	public RedirectView addProject(@ModelAttribute("project") Project project, ModelMap model) {
		RedirectView view = new RedirectView(PROJECTS_URL);
		try {
			ImageUtil.processImages(project);
			dataUtil.addProject(project);
			List<Category> categories = dataUtil.getCategories();
			model.addAttribute("categories", categories);
			
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return view;
	}
	

	@RequestMapping(value = "/files/{file_name}", method = RequestMethod.GET)
	public void getFile(@PathVariable("file_name") int fileName, HttpServletResponse response, ModelMap model) {
		try {
			InputStream documentStream = dataUtil.getImage(fileName);
			if (documentStream != null) {
				IOUtils.copy(documentStream, response.getOutputStream());
				response.flushBuffer();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}

	}

	@RequestMapping(value = "/preview", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String previewProject(int projectId) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(dataUtil.getProject(projectId));
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public RedirectView deleteProject(@RequestParam("projectId") int projectId) {
		dataUtil.deleteProject(projectId);
		return new RedirectView(PROJECTS_URL);
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String adminLogin(ModelMap model) {
		model.addAttribute("resultMsg", resultMsg);
		resultMsg = null;
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "login";
	}
	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public String adminLogin(SessionStatus status,ModelMap model) {
		model.addAttribute(LOGGED_IN, false);
		status.setComplete();
		resultMsg = null;
		model.addAttribute(MODEL_RESOURCES, ASSETS_ROOT);
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public RedirectView adminLogin(@RequestParam("username") String username, @RequestParam("password") String password,ModelMap model) {
		if("pkasso".equals(username) && "pk123".equals(password)) {
			model.addAttribute(LOGGED_IN, true);
			return new RedirectView("home.htm");
		}
		model.addAttribute(LOGGED_IN, false);
		resultMsg = "Invalid credentials!";
		return new RedirectView("login.htm");
	}

}
