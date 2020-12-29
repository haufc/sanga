package com.sanga.pj.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.entity.Slider;
import com.sanga.pj.service.SliderService;

@Controller
@RequestMapping("/admin")
public class SliderController extends BaseController{
	@Autowired
	SliderService sliderService;
	
	@GetMapping("/slider/list*")
	public ModelAndView listSlider() {
		ModelAndView model = new ModelAndView("slider-list");
		model.addObject("page", sliderService.getSliders());
		return model;
	}
	
	@GetMapping("/slider/form*")
    public ModelAndView show(@RequestParam(name = "id", required = false) Long id) {
    
    	ModelAndView modelAndView = new ModelAndView("slider-form");
    	Slider slider;
		if (id != null) {
			slider = sliderService.getSlider(id);
		} else {
			slider = new Slider();
		}
		modelAndView.addObject("slider",slider);		
        return modelAndView;
    }
	
	@PostMapping("/slider/save*")
    public String show(@Valid Slider slider, BindingResult bindingResult, HttpServletRequest httpServletRequest) throws IOException {

        String view = "slider-list";        
        if (bindingResult.hasErrors()) {
        	addError(httpServletRequest, bindingResult.getAllErrors().toString());
            return view;
        }
        boolean isNew = slider.getId() == null;
        slider = sliderService.saveSlider(slider);
        if (isNew){
        	addMessage(httpServletRequest, getText("slider.msg.added", httpServletRequest.getLocale()));
        } else{
        	addMessage(httpServletRequest, getText("slider.msg.updated", httpServletRequest.getLocale()));

        }
        view = "redirect:/admin/slider/list";

        return view;
    }

}
