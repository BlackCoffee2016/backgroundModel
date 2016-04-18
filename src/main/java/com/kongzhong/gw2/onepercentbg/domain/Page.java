package com.kongzhong.gw2.onepercentbg.domain;
/**
 * 分页信息
 * @author yangcan
 *
 */
public class Page {
	private int pageIndex=1;
	
	private int pageSize=20;
	
	private int totalCount;//总记录数
	
	private int totalPage;//总页数
	
	private int limitIndex;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return (totalCount-1)/pageSize+1;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLimitIndex() {
		return (pageIndex-1)*pageSize;
	}

	public void setLimitIndex(int limitIndex) {
		this.limitIndex = limitIndex;
	}
	
	
}
