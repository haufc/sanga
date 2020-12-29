package com.sanga.pj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Entity
@Table(name = "img_thumbnail")
public class ImgThumbnail {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;	
	
	@Column (name = "img_url")
	private String imgUrl;
	
	@Column (name = "sort")
	private Integer sort;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="project_id")
	private Project project;
	
	@Transient
	MultipartFile file;
	
	public ImgThumbnail() {
		super();
	}

	public ImgThumbnail(Long id) {
		super();
		this.id = id;
	}
	
	

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public ImgThumbnail(Project project, MultipartFile file) {
		super();
		this.project = project;
		this.file = file;
	}
	

}
