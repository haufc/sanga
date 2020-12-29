package com.sanga.pj.search;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;

import java.util.List;

import org.springframework.data.domain.PageRequest;

public class EmployeeSearchCriteria {
	public EmployeeSearchCriteria() {
		sort = "id";
	}
	
	Integer size;
    Integer page;
    String sort;
    String sortDir;
    
    String name;
    String position;
    
    
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}
    
//    PageRequest toPageRequest(){
//        if(size == null){
//            size = Integer.MAX_VALUE; // may or may not be a good idea for your usecase
//        }
//        return new PageRequest(page, size, Sort.by(sort));
//    }
    
    
}
