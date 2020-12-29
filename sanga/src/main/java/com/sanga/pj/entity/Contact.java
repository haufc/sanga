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
@Table(name = "contact")
public class Contact {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;	
	
	@Column (name = "address")
	private String address;
	
	@Column (name = "address_kr")
	private String addressKr;
	
	@Column (name = "phone")
	private String phone;
	
	@Column (name = "email")
	private String email;
	
	@Column (name = "main_branch")
	private String mainBranch;
	
	@Transient
	MultipartFile file;
	
	public Contact() {
		super();
	}

	public Contact(Long id) {
		super();
		this.id = id;
	}
}
