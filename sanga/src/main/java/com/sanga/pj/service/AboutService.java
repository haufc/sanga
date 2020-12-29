package com.sanga.pj.service;

import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.sanga.pj.entity.About;
import com.sanga.pj.search.AboutSearchCriteria;

public interface AboutService {
	Page<About> getAbouts(AboutSearchCriteria aboutSearchCriteria);
	About getById(Long id);
	About saveAbout(About about) throws IOException ;
	void deleteAbout(About about);
	
	List<About> getByType(String type);
}
