package com.sanga.pj.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.entity.ImgThumbnail;
import com.sanga.pj.entity.Project;
import com.sanga.pj.search.AboutSearchCriteria;
import com.sanga.pj.search.ProjectSearchCriteria;
import com.sanga.pj.service.ImgThumbnailService;
import com.sanga.pj.service.ProjectService;

@Controller
public class ProjectController extends BaseController{
	@Autowired
	ProjectService projectService;
	
	@Autowired
	ImgThumbnailService imgThumbnailService;
	
	@RequestMapping("/admin/project/list*")
	public ModelAndView getProject(ProjectSearchCriteria projectSearchCriteria,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "size", required = false) String size,
			HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("project-list");
		Integer pageVal = StringUtils.isEmpty(page) == true? null : Integer.parseInt(page); 
		Integer sizeVal = StringUtils.isEmpty(size) == true? null : Integer.parseInt(size); 
		if (pageVal  == null) {
			pageVal = 0;
		}
		
		if (sizeVal == null) {
			sizeVal = 20;
		}
		
		projectSearchCriteria.setPage(pageVal);
		projectSearchCriteria.setSize(sizeVal);
		modelAndView.addObject("projectSearchCriteria", projectSearchCriteria);
		modelAndView.addObject("page", projectService.getProjects(projectSearchCriteria));
		return modelAndView;
	}
	
	@GetMapping("/admin/project/form*")
	public ModelAndView showForm(@RequestParam(value="id", required = false)Long id) {
		ModelAndView modelAndView = new ModelAndView("project-form");
		Project project = new Project();
		
		if (id != null) {
			project = projectService.getById(id);
			List<ImgThumbnail> imgThumbnails = projectService.getById(id).getImageThumbnails();
			modelAndView.addObject("imgThumbnails", imgThumbnails);
		}
		modelAndView.addObject("project", project);
		return modelAndView;
	}
	
	@PostMapping("/admin/project/save")
	public ModelAndView save(@Valid Project project, BindingResult bindingResult, HttpServletRequest request) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/project/list");
		
		if (bindingResult.hasErrors()) {
        	addError(request, bindingResult.getAllErrors().toString());
            return modelAndView;
        }
		
		boolean isNew = (project.getId() == null);
		System.out.println(project.getThumbs());
		// Save category data to database
		try {

			Project newProject = projectService.saveProject(project);
			if (project.getThumbs() != null) {
				project.getThumbs().stream().forEach(item -> {
					ImgThumbnail imgThumbnail = new ImgThumbnail(newProject, item);
					try {
						imgThumbnailService.saveImgThumbnail(imgThumbnail);
					} catch (IOException e) {
						e.printStackTrace();
					}
				});
			}
			
			if (isNew) {
				addMessage(request, getText("project.msg.added", request.getLocale()));
			} else {
				addMessage(request, getText("project.msg.updated", request.getLocale()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@GetMapping("/admin/project/delete/{id}")
	public ModelAndView del(@PathVariable(value="id", required=true) Long id, HttpServletRequest request) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/project/list");

		try {
			Project project = new Project(id);
			projectService.deleteProject(project);
			addMessage(request, getText("project.msg.deleted", request.getLocale()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}
	
	@RequestMapping("/front/project-detail/{id}")
	public ModelAndView getProject(@PathVariable(value="id", required=true) Long id) {
		ModelAndView model = new ModelAndView("/front/project-detail");
		Project project = new Project();
		if (id != null) {
			project = projectService.getById(id);
		}
		
		model.addObject("project", project);
		return model;
	}
	
	@RequestMapping("/front/project/list")
	public ModelAndView getProjectList(@RequestParam(name="type", required=false, defaultValue = "0") String type) {
		ModelAndView model = new ModelAndView("/front/project-design");
		List<Project> projects = null;
		if (!StringUtils.isEmpty(type)) {
			projects = projectService.getProjectsByType(type);
		}
		
		model.addObject("type", type);
		model.addObject("projects", projects);
		return model;
	}
}
