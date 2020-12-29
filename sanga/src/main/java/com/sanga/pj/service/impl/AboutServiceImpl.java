package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.sanga.pj.entity.About;
import com.sanga.pj.repository.AboutRepository;
import com.sanga.pj.search.AboutSearchCriteria;
import com.sanga.pj.service.AboutService;
import com.sanga.pj.specification.AboutSearchSpecification;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Service
public class AboutServiceImpl implements AboutService{
	@Autowired
	AboutRepository aboutRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;

	@Override
	public Page<About> getAbouts(AboutSearchCriteria aboutSearchCriteria) {
		// TODO Auto-generated method stub
		if (aboutSearchCriteria == null) {
			aboutSearchCriteria = new AboutSearchCriteria();
		}
		return aboutRepository.findAll(AboutSearchSpecification.findByCriteria(aboutSearchCriteria), 
				PageRequest.of(aboutSearchCriteria.getPage(),  aboutSearchCriteria.getSize()));
	}

	@Override
	public About getById(Long id) {
		// TODO Auto-generated method stub
		return aboutRepository.getOne(id);
	}

	@Override
	public About saveAbout(About about) throws IOException {
		if (about.getFile() != null && StringUtils.isNoneEmpty(about.getFile().getOriginalFilename())) {
			if(about.getId() != null) {
				About existAbout = aboutRepository.getOne(about.getId());
				if(StringUtils.isNoneEmpty(existAbout.getCeoPhoto()) && Paths.get(Utils.getFilePath(existAbout.getCeoPhoto(), rootLocationDir)) != null) {
					Files.deleteIfExists(Paths.get(Utils.getFilePath(existAbout.getCeoPhoto(), rootLocationDir)));
				}
			}
			
			UploadedFileUtil uploadedFile = new UploadedFileUtil();
			uploadedFile.setUploadedPath(rootLocationDir);
			uploadedFile.setUploadedFileName(about.getFile().getOriginalFilename());
			uploadedFile.setUploadedFileContent(about.getFile().getBytes());
			SpringUploadUtil.uploadFile(uploadedFile);
			about.setCeoPhoto("/resources/" + about.getFile().getOriginalFilename());
		}
		return aboutRepository.save(about);
	}

	@Override
	public void deleteAbout(About about) {
		// TODO Auto-generated method stub
		aboutRepository.delete(about);
	}

	@Override
	public List<About> getByType(String type) {
		
		return aboutRepository.findByAboutType(type);
	}
	

}
