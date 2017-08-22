package com.jmt.pojo;
/**
 * 数据entity类
 * @author T430
 *
 * @param <T>
 */
public abstract class TreeEntity<T> extends DataEntity<T> {

	
	private static final long serialVersionUID = 1L;
	
	protected T parent;	// 父级编号
	protected String parentIds; // 所有父级编号
	protected String name; 	// 机构名称
	protected Integer sort;		// 排序
	
	
	public T getParent() {
		return parent;
	}
	public void setParent(T parent) {
		this.parent = parent;
	}
	public String getParentIds() {
		return parentIds;
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}
