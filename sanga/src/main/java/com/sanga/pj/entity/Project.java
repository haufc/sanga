package com.sanga.pj.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "project")
public class Project {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;	
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "title_kr")
	private String titleKr;
	
	@Column(name = "project_type")
	private String projectType;
	
	@Column(name = "project_catelogy_type")
	private String projectCatelogType;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "description_kr")
	private String descriptionKr;
	
	@Column(name = "is_display")
	private Integer isDisplay;
	
	@Column(name = "location")
	private String location;
	
	@Column(name = "location_kr")
	private String locationKr;
	
	@Column(name = "square")
	private String square;
	
	@Column(name = "budget")
	private Double budget;
	
	@Column(name = "partner")
	private String partner;
	
	@Column(name = "architech")
	private String architech;
	
	@Column(name = "slider_img_url")
	private String sliderImgUrl;
	
	@Column(name = "principle_use")
	private String principleUse;
	
	@Column(name = "scale")
	private String scale;
	
	@Column(name = "scale_kr")
	private String scaleKr;
	
	@OneToMany(mappedBy = "project")
	private List<ImgThumbnail> imageThumbnails;
	
	@Transient
	private List<MultipartFile> thumbs;
	
	@Transient
	MultipartFile file;
	
	public Project() {
		super();
	}

	public Project(Long id) {
		super();
		this.id = id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Project [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", title=");
		builder.append(title);
		builder.append(", titleKr=");
		builder.append(titleKr);
		builder.append(", projectType=");
		builder.append(projectType);
		builder.append(", projectCatelogType=");
		builder.append(projectCatelogType);
		builder.append(", description=");
		builder.append(description);
		builder.append(", descriptionKr=");
		builder.append(descriptionKr);
		builder.append(", isDisplay=");
		builder.append(isDisplay);
		builder.append(", location=");
		builder.append(location);
		builder.append(", locationKr=");
		builder.append(locationKr);
		builder.append(", square=");
		builder.append(square);
		builder.append(", budget=");
		builder.append(budget);
		builder.append(", partner=");
		builder.append(partner);
		builder.append(", architech=");
		builder.append(architech);
		builder.append(", sliderImgUrl=");
		builder.append(sliderImgUrl);
		builder.append(", principleUse=");
		builder.append(principleUse);
		builder.append(", scale=");
		builder.append(scale);
		builder.append(", scaleKr=");
		builder.append(scaleKr);
		builder.append("]");
		return builder.toString();
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleKr() {
		return titleKr;
	}

	public void setTitleKr(String titleKr) {
		this.titleKr = titleKr;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getProjectCatelogType() {
		return projectCatelogType;
	}

	public void setProjectCatelogType(String projectCatelogType) {
		this.projectCatelogType = projectCatelogType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescriptionKr() {
		return descriptionKr;
	}

	public void setDescriptionKr(String descriptionKr) {
		this.descriptionKr = descriptionKr;
	}

	public Integer getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(Integer isDisplay) {
		this.isDisplay = isDisplay;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationKr() {
		return locationKr;
	}

	public void setLocationKr(String locationKr) {
		this.locationKr = locationKr;
	}

	public String getSquare() {
		return square;
	}

	public void setSquare(String square) {
		this.square = square;
	}

	public Double getBudget() {
		return budget;
	}

	public void setBudget(Double budget) {
		this.budget = budget;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getArchitech() {
		return architech;
	}

	public void setArchitech(String architech) {
		this.architech = architech;
	}

	public String getSliderImgUrl() {
		return sliderImgUrl;
	}

	public void setSliderImgUrl(String sliderImgUrl) {
		this.sliderImgUrl = sliderImgUrl;
	}

	public String getPrincipleUse() {
		return principleUse;
	}

	public void setPrincipleUse(String principleUse) {
		this.principleUse = principleUse;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getScaleKr() {
		return scaleKr;
	}

	public void setScaleKr(String scaleKr) {
		this.scaleKr = scaleKr;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public List<ImgThumbnail> getImageThumbnails() {
		return imageThumbnails;
	}

	public void setImageThumbnails(List<ImgThumbnail> imageThumbnails) {
		this.imageThumbnails = imageThumbnails;
	}

	public List<MultipartFile> getThumbs() {
		return thumbs;
	}

	public void setThumbs(List<MultipartFile> thumbs) {
		this.thumbs = thumbs;
	}
	
	
}
