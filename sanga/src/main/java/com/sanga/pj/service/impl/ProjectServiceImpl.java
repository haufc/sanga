package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.sanga.pj.entity.ImgThumbnail;
import com.sanga.pj.entity.Project;
import com.sanga.pj.repository.ImgThumbnailRepository;
import com.sanga.pj.repository.ProjectRepository;
import com.sanga.pj.search.AboutSearchCriteria;
import com.sanga.pj.search.ProjectSearchCriteria;
import com.sanga.pj.service.ProjectService;
import com.sanga.pj.specification.AboutSearchSpecification;
import com.sanga.pj.specification.ProjectSearchSpecification;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Service
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	ProjectRepository projectRepository;
	
	@Autowired
	ImgThumbnailRepository imgThumbnailRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;
	
	@Override
	public Page<Project> getProjects(ProjectSearchCriteria projectSearchCriteria) {
		
		if (projectSearchCriteria == null) {
			projectSearchCriteria = new ProjectSearchCriteria();
		} else {
			System.out.println(projectSearchCriteria.getName() + projectSearchCriteria.getPage() + projectSearchCriteria.getSize());
		}
		return projectRepository.findAll(ProjectSearchSpecification.findByCriteria(projectSearchCriteria), 
				PageRequest.of(projectSearchCriteria.getPage(),  projectSearchCriteria.getSize()));
	}

	@Override
	public Project getById(Long id) {
		// TODO Auto-generated method stub
		return projectRepository.getOne(id);
	}

	@Override
	public Project saveProject(Project project) throws IOException {
		Project existPj = new Project();
		List<ImgThumbnail> imgThumbnails = project.getImageThumbnails();
		if(project.getId() != null) {
			 existPj = projectRepository.getOne(project.getId());
		}
		if (project.getFile() != null && StringUtils.isNotBlank(project.getFile().getOriginalFilename())) {
			if(existPj != null) {
				if(StringUtils.isNoneEmpty(existPj.getSliderImgUrl()) && Paths.get(Utils.getFilePath(existPj.getSliderImgUrl(), rootLocationDir)) != null) {
					Files.deleteIfExists(Paths.get(Utils.getFilePath(existPj.getSliderImgUrl(), rootLocationDir)));
				}
			}
			
			UploadedFileUtil uploadedFile = new UploadedFileUtil();
			uploadedFile.setUploadedPath(rootLocationDir);
			uploadedFile.setUploadedFileName(project.getFile().getOriginalFilename());
			uploadedFile.setUploadedFileContent(project.getFile().getBytes());
			SpringUploadUtil.uploadFile(uploadedFile);
			project.setSliderImgUrl("/resources/" + project.getFile().getOriginalFilename());
		}
		project = projectRepository.save(project);
		UploadedFileUtil uploadedFile;
		if(!imgThumbnails.isEmpty()) {
			for(ImgThumbnail imgThumbnail:imgThumbnails) {
				if(imgThumbnail.getId() != null) {
					if(StringUtils.isNoneEmpty(imgThumbnail.getImgUrl())) {
						ImgThumbnail existImg = imgThumbnailRepository.getOne(imgThumbnail.getId());
						if(StringUtils.isNotBlank(existImg.getImgUrl()) && Paths.get(Utils.getFilePath(existImg.getImgUrl(), rootLocationDir)) != null) {
							Files.deleteIfExists(Paths.get(Utils.getFilePath(existImg.getImgUrl(), rootLocationDir)));
						}
					}
				}
				if(imgThumbnail.getFile()!= null &&!imgThumbnail.getFile().isEmpty()) {
					uploadedFile = new UploadedFileUtil();
					uploadedFile.setUploadedPath(rootLocationDir);
					uploadedFile.setUploadedFileName(imgThumbnail.getFile().getOriginalFilename());
					uploadedFile.setUploadedFileContent(imgThumbnail.getFile().getBytes());
					SpringUploadUtil.uploadFile(uploadedFile);
					imgThumbnail.setImgUrl("/resources/" + imgThumbnail.getFile().getOriginalFilename());
					imgThumbnail.setProject(project);
					imgThumbnail = imgThumbnailRepository.save(imgThumbnail);
				}
			}
		}
		List<Long> deleteImgId = new ArrayList<>();
		if(existPj != null && existPj.getImageThumbnails() != null) {
			existPj.getImageThumbnails().forEach(existImgThumbNail -> {
				boolean checkDelete = false;
				System.out.println("===>" +imgThumbnails);
				if(!imgThumbnails.isEmpty()) {
					for(ImgThumbnail imgThumbnail:imgThumbnails) {
						if(imgThumbnail.getId() == existImgThumbNail.getId()) {
							checkDelete = true;
							break;
						}
					}
				}
				if(!checkDelete) {
					deleteImgId.add(existImgThumbNail.getId());
					System.out.println("===>" +existImgThumbNail.getImgUrl());
					if(StringUtils.isNoneEmpty(existImgThumbNail.getImgUrl()) && Paths.get(Utils.getFilePath(existImgThumbNail.getImgUrl(), rootLocationDir)) != null) {
						try {
							Files.deleteIfExists(Paths.get(Utils.getFilePath(existImgThumbNail.getImgUrl(), rootLocationDir)));
						} catch (IOException e) {
							// TODO Auto-generated catch block
							System.out.println(e.getMessage());
						}
					}
				}
			});
		}
		
		if(!deleteImgId.isEmpty()) {
			for(long id: deleteImgId) {
				imgThumbnailRepository.deleteById(id);
			}
		}
		return project;
	}

	@Override
	public void deleteProject(Project project) {
		// TODO Auto-generated method stub
		projectRepository.delete(project);;
	}

	@Override
	public List<Project> getTopNew(Integer isDisplay) {
		// TODO Auto-generated method stub
		return projectRepository.findTop6ByIsDisplayOrderByIdDesc(isDisplay);
	}

	@Override
	public List<Project> getProjectsByType(String type) {
		// TODO Auto-generated method stub
		return projectRepository.findByProjectType(type);
	}

	@Override
	public long countAllProject() {
		// TODO Auto-generated method stub
		return projectRepository.countAllProject();
	}

}
