package com.jmt.pojo;

import java.util.Date;

import javax.persistence.FetchType;
import javax.persistence.OneToOne;



/**
 * 字典实体类
 * @author T430
 *
 */
public class Dict {
	private String id;//编号
	private String value;	// 数据值
	private String label;	// 标签名
	private String type;	// 类型
	private String description;// 描述
	private Integer sort;	// 排序
	private String parentId;//父Id
	
	protected String remarks;	// 备注
	protected User createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected User updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
	
	
	
	public Dict() {
		super();
	}

	public Dict(String id){
		super();
		this.id=id;
	}
	
	public Dict(String value, String label){
		this.value = value;
		this.label = label;
	}

	
	public String getValue() {
		return value;
	}



	public void setValue(String value) {
		this.value = value;
	}



	public String getLabel() {
		return label;
	}



	public void setLabel(String label) {
		this.label = label;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Integer getSort() {
		return sort;
	}



	public void setSort(Integer sort) {
		this.sort = sort;
	}



	public String getParentId() {
		return parentId;
	}



	public void setParentId(String parentId) {
		this.parentId = parentId;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	
	public User getCreateBy() {
		return createBy;
	}



	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public User getUpdateBy() {
		return updateBy;
	}



	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	public String getDelFlag() {
		return delFlag;
	}



	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	
	
}
