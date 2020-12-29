package com.sanga.pj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Entity
@Table(name = "about")
public class About {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;	
	
	@Column (name = "about_type")
	private String aboutType;
	
	@Column (name = "description")
	private String description;
	
	@Column (name = "ceo_photo")
	private String ceoPhoto;
	
	@Column (name = "description_kr")
	private String descriptionKr;
	
	@Transient
	MultipartFile file;
	
	public About() {
		super();
	}

	public About(Long id) {
		super();
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAboutType() {
		return aboutType;
	}

	public void setAboutType(String aboutType) {
		this.aboutType = aboutType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCeoPhoto() {
		return ceoPhoto;
	}

	public void setCeoPhoto(String ceoPhoto) {
		this.ceoPhoto = ceoPhoto;
	}

	public String getDescriptionKr() {
		return descriptionKr;
	}

	public void setDescriptionKr(String descriptionKr) {
		this.descriptionKr = descriptionKr;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("About [id=");
		builder.append(id);
		builder.append(", aboutType=");
		builder.append(aboutType);
		builder.append(", description=");
		builder.append(description);
		builder.append(", ceoPhoto=");
		builder.append(ceoPhoto);
		builder.append(", descriptionKr=");
		builder.append(descriptionKr);
		builder.append("]");
		return builder.toString();
	}

}
