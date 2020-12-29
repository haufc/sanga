package com.sanga.pj.controller;

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

import com.sanga.pj.entity.About;
import com.sanga.pj.search.AboutSearchCriteria;
import com.sanga.pj.service.AboutService;

@Controller
public class AboutController extends BaseController{
	@Autowired
	AboutService aboutService;
	
	@RequestMapping("/admin/about/list*")
	public ModelAndView getAbout(AboutSearchCriteria aboutSearchCriteria,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "size", required = false) String size,
			HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("about-list");
		
		Integer pageVal = StringUtils.isEmpty(page) == true? null : Integer.parseInt(page); 
		Integer sizeVal = StringUtils.isEmpty(size) == true? null : Integer.parseInt(size); 
		if (pageVal  == null) {
			pageVal = 0;
		}
		
		if (sizeVal == null) {
			sizeVal = 20;
		}
		
		aboutSearchCriteria.setPage(pageVal);
		aboutSearchCriteria.setSize(sizeVal);
		modelAndView.addObject("aboutSearchCriteria", aboutSearchCriteria);
		modelAndView.addObject("page", aboutService.getAbouts(aboutSearchCriteria));
		return modelAndView;
	}
	
	@GetMapping("/admin/about/form")
	public ModelAndView showForm(@RequestParam(value="id", required = false)Long id) {
		ModelAndView modelAndView = new ModelAndView("about-form");
		About about = new About();
		if (id != null) {
			about = aboutService.getById(id);
		}
		modelAndView.addObject("about", about);
		return modelAndView;
	}
	
	@PostMapping("/admin/about/save")
	public ModelAndView save(@Valid About about, HttpServletRequest request,BindingResult bindingResult) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/about/list");
		if (bindingResult.hasErrors()) {
        	addError(request, bindingResult.getAllErrors().toString());
            return modelAndView;
        }
		boolean isNew = (about.getId() == null);
		
		// Save category data to database
		try {

			About newAbout = aboutService.saveAbout(about);
			if (isNew) {
				addMessage(request, getText("about.msg.added", request.getLocale()));
			} else {
				addMessage(request, getText("about.msg.updated", request.getLocale()));
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			addError(request, getText("about.msg.error", request.getLocale()));
		}
		
		return modelAndView;
	}
	
	@GetMapping("/admin/about/delete/{id}")
	public ModelAndView del(@PathVariable(value="id", required=true) Long id, HttpServletRequest request) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/about/list");

		try {
			About about = new About(id);
			aboutService.deleteAbout(about);
			addMessage(request, getText("about.msg.deleted", request.getLocale()));
			
		} catch (Exception e) {
			addError(request, getText("about.msg.error", request.getLocale()));
		}

		return modelAndView;
	}
	
	@RequestMapping("/front/about/{aboutType}")
	public ModelAndView getAboutFront(@PathVariable(value="aboutType", required=true) String aboutType, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		if(aboutType.equals("0")) {
			modelAndView.setViewName("/front/about");
		} else if(aboutType.equals("1")){
			modelAndView.setViewName("/front/about-history");
		} else {
			modelAndView.setViewName("/front/about-news");
		}
		modelAndView.addObject("abouts", aboutService.getByType(aboutType));
		return modelAndView;
	}
}
