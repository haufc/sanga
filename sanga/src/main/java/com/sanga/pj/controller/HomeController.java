package com.sanga.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.service.ProjectService;
import com.sanga.pj.service.SliderService;

@Controller
public class HomeController {
	@Autowired
	SliderService sliderService;
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/")
	public ModelAndView getHome() {
		ModelAndView model = new ModelAndView("/front/home");
		model.addObject("sliders", sliderService.getSlidersList());
		model.addObject("projects", projectService.getTopNew(1));
		return model;
	}
}
