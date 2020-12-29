package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sanga.pj.entity.ImgThumbnail;
import com.sanga.pj.entity.Slider;
import com.sanga.pj.repository.ImgThumbnailRepository;
import com.sanga.pj.service.ImgThumbnailService;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Service
public class ImgThumbnailServiceImpl implements ImgThumbnailService{
	@Autowired
	ImgThumbnailRepository imgThumbnailRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;

	@Override
	public List<ImgThumbnail> getThumbnails() {
		return imgThumbnailRepository.findAll();
	}

	@Override
	public ImgThumbnail getById(Long id) {
		// TODO Auto-generated method stub
		return imgThumbnailRepository.getOne(id);
	}

	@Override
	public ImgThumbnail saveImgThumbnail(ImgThumbnail imgThumbnail) throws IOException {
		if (imgThumbnail.getFile() != null && StringUtils.isNotBlank(imgThumbnail.getFile().getOriginalFilename())) {
			if(imgThumbnail.getId() != null) {
				ImgThumbnail existSlider = imgThumbnailRepository.getOne(imgThumbnail.getId());
				if(StringUtils.isNotBlank(existSlider.getImgUrl()) && Paths.get(Utils.getFilePath(existSlider.getImgUrl(), rootLocationDir)) != null) {
					Files.deleteIfExists(Paths.get (Utils.getFilePath(existSlider.getImgUrl(), rootLocationDir)));
				}
			}
			
			UploadedFileUtil uploadedFile = new UploadedFileUtil();
			uploadedFile.setUploadedPath(rootLocationDir);
			uploadedFile.setUploadedFileName(imgThumbnail.getFile().getOriginalFilename());
			uploadedFile.setUploadedFileContent(imgThumbnail.getFile().getBytes());
			SpringUploadUtil.uploadFile(uploadedFile);
			imgThumbnail.setImgUrl("/resources/" + imgThumbnail.getFile().getOriginalFilename());
		}
		return imgThumbnailRepository.save(imgThumbnail);
	}

	@Override
	public void deleteImgThumbnail(ImgThumbnail imgThumbnail) {
		imgThumbnailRepository.delete(imgThumbnail);
	}

	@Override
	public List<ImgThumbnail> getThumbnailByProjectIds(Long projectId) {
		// TODO Auto-generated method stub
		return imgThumbnailRepository.findByProjectId(projectId);
	}

	

}
