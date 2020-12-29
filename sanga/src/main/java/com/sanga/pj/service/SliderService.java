package com.sanga.pj.service;

import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.sanga.pj.entity.Slider;

public interface SliderService {
	
	Page<Slider> getSliders();
	
	List<Slider> getSlidersList();
	
	Slider getSlider(Long id);
	Slider saveSlider(Slider slider) throws IOException;
	void deleteSlider(Long id) throws IOException;
	long countAllSlider();

}
