package com.sanga.pj.service;

import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.sanga.pj.dto.EmployeeDto;
import com.sanga.pj.entity.Employee;
import com.sanga.pj.search.EmployeeSearchCriteria;

public interface EmployeeService {
	Page<Employee> getEmployees(EmployeeSearchCriteria employeeSearchCriteria);
	Employee getById(Long id);
	
	EmployeeDto getDtoById(Long id);
	Employee saveEmployee(Employee employee) throws IOException;
	void deleteEmployee(Employee employee);
	List<Employee> getAllEmployees();
	long countAllEmployee();
}
