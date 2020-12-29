package com.sanga.pj.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.sanga.pj.dto.EmployeeDto;
import com.sanga.pj.entity.Employee;
import com.sanga.pj.repository.EmployeeRepository;
import com.sanga.pj.search.EmployeeSearchCriteria;
import com.sanga.pj.service.EmployeeService;
import com.sanga.pj.specification.EmployeeSearchSpecification;
import com.sanga.pj.util.SpringUploadUtil;
import com.sanga.pj.util.UploadedFileUtil;
import com.sanga.pj.util.Utils;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	EmployeeRepository employeeRepository;
	
	@Value("${document.file.location}")
    private String rootLocationDir;


	@Override
	public Page<Employee> getEmployees(EmployeeSearchCriteria employeeSearchCriteria) {
		// TODO Auto-generated method stub
		if(employeeSearchCriteria == null){
			employeeSearchCriteria = new EmployeeSearchCriteria();
		}
		
		return employeeRepository.findAll(EmployeeSearchSpecification.findByCriteria(employeeSearchCriteria), 
				PageRequest.of(employeeSearchCriteria.getPage(),  employeeSearchCriteria.getSize()));
	}

	@Override
	public Employee getById(Long id) {
		// TODO Auto-generated method stub
		Employee employee = employeeRepository.getOne(id);
		return employee;
	}
	
	@Override
	public EmployeeDto getDtoById(Long id) {
		// TODO Auto-generated method stub
		Employee employee = employeeRepository.getOne(id);
		EmployeeDto employeeDto = new EmployeeDto();
//		System.out.println("=>>>:" + employee);
		BeanUtils.copyProperties(employee, employeeDto);
//		System.out.println("=>>>1:" + employeeDto);
		return employeeDto;
	}

	@Override
	public Employee saveEmployee(Employee employee) throws IOException {
		if (employee.getFile() != null && StringUtils.isNotBlank(employee.getFile().getOriginalFilename())) {
			if(employee.getId() != null) {
				Employee existEmployee = employeeRepository.getOne(employee.getId());
				if(StringUtils.isNotBlank(existEmployee.getAvatarUrl()) && Paths.get(Utils.getFilePath(existEmployee.getAvatarUrl(), rootLocationDir)) != null) {
					Files.deleteIfExists(Paths.get(Utils.getFilePath(existEmployee.getAvatarUrl(), rootLocationDir)));
				}
			}
			
			UploadedFileUtil uploadedFile = new UploadedFileUtil();
			uploadedFile.setUploadedPath(rootLocationDir);
			uploadedFile.setUploadedFileName(employee.getFile().getOriginalFilename());
			uploadedFile.setUploadedFileContent(employee.getFile().getBytes());
			SpringUploadUtil.uploadFile(uploadedFile);
			employee.setAvatarUrl("/resources/" + employee.getFile().getOriginalFilename());
		}
		
		return employeeRepository.save(employee);
	}

	@Override
	public void deleteEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employeeRepository.delete(employee);
	}

	@Override
	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return employeeRepository.findAll();
	}

	@Override
	public long countAllEmployee() {
		// TODO Auto-generated method stub
		return employeeRepository.countAllEmployee();
	}
	

}
