package com.sanga.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.service.EmployeeService;
import com.sanga.pj.service.ProjectService;
import com.sanga.pj.service.SliderService;

@Controller
@RequestMapping("/admin*")
public class DashboardController {
	
	@Autowired
	ProjectService pojectService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	SliderService sliderService;
	
	@GetMapping
	public ModelAndView getDashborad() {
		ModelAndView model = new ModelAndView("dashboard");
		model.addObject("projectTotal", pojectService.countAllProject());
		model.addObject("employeeTotal", employeeService.countAllEmployee());
		model.addObject("sliderTotal", sliderService.countAllSlider());
		return model;
	}
}
