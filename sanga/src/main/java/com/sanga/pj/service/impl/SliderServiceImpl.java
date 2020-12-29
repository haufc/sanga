package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;

import com.sanga.pj.entity.Slider;
import com.sanga.pj.repository.SliderRepository;
import com.sanga.pj.service.SliderService;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Transactional
@Service("sliderService")
public class SliderServiceImpl implements SliderService{
	
	@Autowired
	SliderRepository sliderRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;
	
	@Override
	public Page<Slider> getSliders() {
		return sliderRepository.findAll(PageRequest.of(0, 10));
	}

	@Override
	public Slider getSlider(Long id) {
		return sliderRepository.getOne(id);
	}

	@Override
	public Slider saveSlider(Slider slider) throws IOException {
		if (slider.getFile() != null && StringUtils.isNotBlank(slider.getFile().getOriginalFilename())) {
			if(slider.getId() != null) {
				Slider existSlider = sliderRepository.getOne(slider.getId());
				if(StringUtils.isNotBlank(existSlider.getSliderImgUrl()) && Paths.get(Utils.getFilePath(existSlider.getSliderImgUrl(), rootLocationDir)) != null) {
					Files.deleteIfExists(Paths.get (Utils.getFilePath(existSlider.getSliderImgUrl(), rootLocationDir)));
				}
			}
			
			UploadedFileUtil uploadedFile = new UploadedFileUtil();
			uploadedFile.setUploadedPath(rootLocationDir);
			uploadedFile.setUploadedFileName(slider.getFile().getOriginalFilename());
			uploadedFile.setUploadedFileContent(slider.getFile().getBytes());
			SpringUploadUtil.uploadFile(uploadedFile);
			slider.setSliderImgUrl("/resources/" + slider.getFile().getOriginalFilename());
		}
		return sliderRepository.save(slider);
	}

	@Override
	public void deleteSlider(Long id) throws IOException {
		Slider slider = sliderRepository.getOne(id);
		if(StringUtils.isNotBlank(slider.getSliderImgUrl()) && Paths.get(Utils.getFilePath(slider.getSliderImgUrl(), rootLocationDir)) != null) {
			Files.deleteIfExists(Paths.get (Utils.getFilePath(slider.getSliderImgUrl(), rootLocationDir)));
		}
		sliderRepository.delete(slider);
	}

	@Override
	public List<Slider> getSlidersList() {
		// TODO Auto-generated method stub
		return sliderRepository.findAll();
	}

	@Override
	public long countAllSlider() {
		// TODO Auto-generated method stub
		return sliderRepository.countAllSlider();
	}

}
