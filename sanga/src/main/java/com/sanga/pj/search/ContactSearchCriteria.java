package com.sanga.pj.search;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;

import java.util.List;

import org.springframework.data.domain.PageRequest;

public class ContactSearchCriteria {
	public ContactSearchCriteria() {
		sort = "id";
	}
	
	Integer size;
    Integer page;
    String sort;
    String sortDir;
    
    String phone;
    String email;
    Integer mainBranch;
    
    
    Sort buildSort(){
    	
        return Sort.by(new Sort.Order(Sort.Direction.ASC, sort).ignoreCase());
    }


	public Integer getSize() {
		return size;
	}


	public void setSize(Integer size) {
		this.size = size;
	}


	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getSortDir() {
		return sortDir;
	}


	public void setSortDir(String sortDir) {
		this.sortDir = sortDir;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Integer getMainBranch() {
		return mainBranch;
	}


	public void setMainBranch(Integer mainBranch) {
		this.mainBranch = mainBranch;
	}

}
