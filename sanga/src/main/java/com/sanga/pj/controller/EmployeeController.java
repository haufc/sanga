package com.sanga.pj.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sanga.pj.dto.EmployeeDto;
import com.sanga.pj.entity.Employee;
import com.sanga.pj.search.EmployeeSearchCriteria;
import com.sanga.pj.service.EmployeeService;
import com.sanga.pj.specification.EmployeeSearchSpecification;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class EmployeeController extends BaseController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/admin/employee/list*")
	public ModelAndView getEmployee(EmployeeSearchCriteria employeeSearchCriteria,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "size", required = false) String size,
			HttpServletRequest request) {
		
		
		ModelAndView modelAndView = new ModelAndView("employee-list");
		Integer pageVal = StringUtils.isEmpty(page) == true? null : Integer.parseInt(page); 
		Integer sizeVal = StringUtils.isEmpty(size) == true? null : Integer.parseInt(size); 
		if (pageVal  == null) {
			pageVal = 0;
		}
		
		if (sizeVal == null) {
			sizeVal = 20;
		}
		
		employeeSearchCriteria.setPage(pageVal);
		employeeSearchCriteria.setSize(sizeVal);
		modelAndView.addObject("page", employeeService.getEmployees(employeeSearchCriteria));
		modelAndView.addObject("employeeSearchCriteria", employeeSearchCriteria);
		return modelAndView;
	}
	
	@GetMapping("/admin/employee/form*")
	public ModelAndView showForm(@RequestParam(value="id", required = false)Long id) {
		ModelAndView modelAndView = new ModelAndView("employee-form");
		Employee employee = new Employee();
		if (id != null) {
			employee = employeeService.getById(id);
		}
		modelAndView.addObject("employee", employee);
		return modelAndView;
	}
	
	@PostMapping("/admin/employee/save")
	public ModelAndView save(@Valid Employee employee,BindingResult bindingResult, HttpServletRequest request) throws RuntimeException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/employee/list");
		
		if (bindingResult.hasErrors()) {
        	addError(request, bindingResult.getAllErrors().toString());
            return modelAndView;
        }
		
		
		boolean isNew = (employee.getId() == null);
		
		// Save category data to database
		try {
			Employee newEmployee = employeeService.saveEmployee(employee);
			if (isNew) {
				addMessage(request, getText("employee.msg.added", request.getLocale()));
			} else {
				addMessage(request, getText("employee.msg.updated", request.getLocale()));
			}
		} catch (Exception e) {
			addError(request, getText("employee.msg.error", request.getLocale()));
		}
		
		return modelAndView;
	}
	
	@GetMapping("/admin/employee/delete/{id}")
	public ModelAndView del(@PathVariable(value="id", required=true) Long id, HttpServletRequest request) throws RuntimeException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/employee/list");
		try {
			Employee employee = new Employee(id);
			employeeService.deleteEmployee(employee);
			addMessage(request, getText("employee.msg.deketed", request.getLocale()));
			
		} catch (Exception e) {
			addError(request, getText("employee.msg.error", request.getLocale()));
		}
		return modelAndView;
	}
	
	@RequestMapping("/front/employee/list*")
	public ModelAndView getEmployees() {
		log.info("--process=GET, entering getEmployees....");
		ModelAndView modelAndView = new ModelAndView("/front/people");
		modelAndView.addObject("employees", employeeService.getAllEmployees());
		return modelAndView;
	}
	
	@GetMapping("/front/employee/{id}")
	public @ResponseBody EmployeeDto getEmployeeById(@PathVariable(value="id", required = true) Long id) throws Exception {
		log.info("process=GET, entering getEmployeeById");
		EmployeeDto employee = employeeService.getDtoById(id);
		System.out.println(employee);
		return employee;
	}
}
