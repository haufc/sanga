package com.sanga.pj.service;

import java.io.IOException;

import org.springframework.data.domain.Page;

import com.sanga.pj.entity.Contact;
import com.sanga.pj.search.ContactSearchCriteria;

public interface ContactService {
	Page<Contact> getContacts(ContactSearchCriteria contactSearchCriteria);
	Contact getById(Long id);
	Contact saveContact(Contact contact) throws IOException ;
	void deleteContact(Contact contact);
	Contact getByMainBranch(String mainBranch);
}
