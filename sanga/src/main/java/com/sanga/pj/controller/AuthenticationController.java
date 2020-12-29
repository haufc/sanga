package com.sanga.pj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthenticationController {
	@GetMapping("/login")
	public ModelAndView getLogin() {
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
	@PostMapping("/login")
	public ModelAndView doLogin() {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin");
		return modelAndView;
	}
	
	@GetMapping("/logout")
	public ModelAndView getLogOut() {
		ModelAndView modelAndView = new ModelAndView("redirect:/login");
		return modelAndView;
	}
}
