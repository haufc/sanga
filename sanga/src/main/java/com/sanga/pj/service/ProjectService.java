package com.sanga.pj.service;

import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.sanga.pj.entity.Project;
import com.sanga.pj.search.ProjectSearchCriteria;

public interface ProjectService {
	Page<Project> getProjects(ProjectSearchCriteria projectSearchCriteria);
	Project getById(Long id);
	Project saveProject(Project project) throws IOException;
	void deleteProject(Project project);
	List<Project> getTopNew(Integer isDisplay);
	List<Project> getProjectsByType(String type);
	long countAllProject();
}
