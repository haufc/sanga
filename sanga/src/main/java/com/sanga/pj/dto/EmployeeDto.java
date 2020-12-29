package com.sanga.pj.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class EmployeeDto {
    private Long id;	
	
	private String name;
	
	private String position;
	
	private String projectType;
	
	private String project;
	
	private String avatarUrl;
	
	private String positionKr;
	private String profileKr;

	private String projectKr;
	private String profile;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getAvatarUrl() {
		return avatarUrl;
	}
	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}
	public String getPositionKr() {
		return positionKr;
	}
	public void setPositionKr(String positionKr) {
		this.positionKr = positionKr;
	}
	public String getProfileKr() {
		return profileKr;
	}
	public void setProfileKr(String profileKr) {
		this.profileKr = profileKr;
	}
	public String getProjectKr() {
		return projectKr;
	}
	public void setProjectKr(String projectKr) {
		this.projectKr = projectKr;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
