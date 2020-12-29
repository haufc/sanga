package com.sanga.pj.search;

public class BaseSearchCriteria {
public static final Integer DEFAULT_QUERY_SIZE = 40;
	
	private Integer page = 0;
	private Integer size = 10; // DEFAULT_PAGE_SIZE
	
	/**
	 * @return the page
	 */
	public Integer getPage() {
		return page;
	}
	
	/**
	 * @param page the page to set
	 */
	public void setPage(Integer page) {
		this.page = page;
	}
	
	/**
	 * @return the size
	 */
	public Integer getSize() {
		return size;
	}
	
	/**
	 * @param size the size to set
	 */
	public void setSize(Integer size) {
		this.size = size;
	}
}
