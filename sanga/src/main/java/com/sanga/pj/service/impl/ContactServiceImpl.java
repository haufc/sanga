package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.sanga.pj.entity.About;
import com.sanga.pj.entity.Contact;
import com.sanga.pj.entity.Project;
import com.sanga.pj.repository.AboutRepository;
import com.sanga.pj.repository.ContactRepository;
import com.sanga.pj.search.ContactSearchCriteria;
import com.sanga.pj.service.AboutService;
import com.sanga.pj.service.ContactService;
import com.sanga.pj.specification.ContactSearchSpecification;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Service
public class ContactServiceImpl implements ContactService{
	@Autowired
	ContactRepository contactRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;

	@Override
	public Page<Contact> getContacts(ContactSearchCriteria contactSearchCriteria) {
		// TODO Auto-generated method stub
		
		if (contactSearchCriteria == null) {
			contactSearchCriteria = new ContactSearchCriteria();
		}
		
		return contactRepository.findAll(ContactSearchSpecification.findByCriteria(contactSearchCriteria), 
				PageRequest.of(contactSearchCriteria.getPage(),  contactSearchCriteria.getSize()));
	}

	@Override
	public Contact getById(Long id) {
		return contactRepository.getOne(id);
	}

	@Override
	public Contact saveContact(Contact contact) throws IOException {
		// TODO Auto-generated method stub
		return contactRepository.save(contact);
	}

	@Override
	public void deleteContact(Contact contact) {
		// TODO Auto-generated method stub
		contactRepository.delete(contact);
	}

	@Override
	public Contact getByMainBranch(String mainBranch) {
		// TODO Auto-generated method stub
		return contactRepository.findTop1ByMainBranch(mainBranch);
	}


	

}
