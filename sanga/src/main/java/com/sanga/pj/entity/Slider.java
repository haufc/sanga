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
@Table(name = "slider")
public class Slider {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="title_kr")
	private String titleKr;
	
	@Column(name="description")
	private String description;
	
	@Column(name="description_kr")
	private String descriptionKr;
	
	@Column(name="sort")
	private String sort;
	
	@Column(name="slider_img_url")
	private String sliderImgUrl;
	
	@Transient
	MultipartFile file;
	
	
	
}
