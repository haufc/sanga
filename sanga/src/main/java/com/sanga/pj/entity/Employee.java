package com.sanga.pj.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "employee")
public class Employee {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;	
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "position")
	private String position;
	
	@Column(name = "project_type")
	private String projectType;
	
	@Column(name = "project")
	private String project;
	
	@Column(name = "avatar_url")
	private String avatarUrl;
	
	@Column(name = "position_kr")
	private String positionKr;
	
	@Column(name = "profile_kr")
	private String profileKr;
	
	@Column(name = "project_kr")
	private String projectKr;
	
	@Column(name = "profile")
	private String profile;
	
	@Transient
	MultipartFile file;
	
	
	public Employee() {
		super();
	}

	public Employee(Long id) {
		super();
		this.id = id;
	}

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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
