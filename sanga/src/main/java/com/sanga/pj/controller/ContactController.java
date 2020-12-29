package com.sanga.pj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.entity.Contact;
import com.sanga.pj.search.ContactSearchCriteria;
import com.sanga.pj.service.ContactService;

@Controller
public class ContactController extends BaseController{
	@Autowired
	ContactService contactService;
	
	@RequestMapping("/admin/contact/list*")
	public ModelAndView getContact(ContactSearchCriteria contactSearchCriteria,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "size", required = false) String size,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("contact-list");
		
		Integer pageVal = StringUtils.isEmpty(page) == true? null : Integer.parseInt(page); 
		Integer sizeVal = StringUtils.isEmpty(size) == true? null : Integer.parseInt(size); 
		if (pageVal  == null) {
			pageVal = 0;
		}
		
		if (sizeVal == null) {
			sizeVal = 20;
		}
		
		contactSearchCriteria.setPage(pageVal);
		contactSearchCriteria.setSize(sizeVal);
		modelAndView.addObject("contactSearchCriteria", contactSearchCriteria);
		modelAndView.addObject("page", contactService.getContacts(contactSearchCriteria));
		return modelAndView;
	}
	
	@GetMapping("/admin/contact/form*")
	public ModelAndView showForm(@RequestParam(value="id", required = false)Long id) {
		ModelAndView modelAndView = new ModelAndView("contact-form");
		Contact contact = new Contact();
		if (id != null) {
			contact = contactService.getById(id);
		}
		modelAndView.addObject("contact", contact);
		return modelAndView;
	}
	
	@PostMapping("/admin/contact/save")
	public ModelAndView save(@Valid Contact contact, HttpServletRequest request,BindingResult bindingResult) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/contact/list");
		if (bindingResult.hasErrors()) {
        	addError(request, bindingResult.getAllErrors().toString());
            return modelAndView;
        }
		boolean isNew = (contact.getId() == null);
		
		// Save category data to database
		try {

			Contact newContact = contactService.saveContact(contact);
			if (isNew) {
				addMessage(request, getText("contact.msg.added", request.getLocale()));
			} else {
				addMessage(request, getText("contact.msg.updated", request.getLocale()));
			}
		} catch (Exception e) {
			addError(request, getText("contact.msg.error", request.getLocale()));
		}
		
		return modelAndView;
	}
	
	@GetMapping("/admin/contact/delete/{id}")
	public ModelAndView del(@PathVariable(value="id", required=true) Long id, HttpServletRequest request) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/contact/list");

		try {
			Contact contact = new Contact(id);
			contactService.deleteContact(contact);
			addMessage(request, getText("contact.msg.deleted", request.getLocale()));
			
		} catch (Exception e) {
			addError(request, getText("contact.msg.error", request.getLocale()));
		}

		return modelAndView;
	}
	
	@RequestMapping("/front/contact")
	public ModelAndView getContactFront() {
		ModelAndView modelAndView = new ModelAndView("/front/contact");
		modelAndView.addObject("contact", contactService.getByMainBranch("1"));
		return modelAndView;
	}
	
	@PostMapping("front/sendmail")
	@ResponseBody
	public ResponseEntity<String> sendMail() {
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
