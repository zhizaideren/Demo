package com.jmt.pojo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jmt.Util.UserUtil;







/**
 * 机构实体
 * @author T430
 *
 */
public class Office  {

	
	private String id;//机构编号
		private String parentId;	// 父级编号
	private String parentIds; // 所有父级编号
	///////////////////////////
/*	private Office parent;//父级
*/	//////////////////////////
	/*private String areaId;		// 归属区域
*/	private String code; 	// 机构编码
	private String name; 	// 机构名称
	private Integer sort;		// 排序
	private String type; 	// 机构类型（1：公司；2：部门；3：小组）
	private String grade; 	// 机构等级（1：一级；2：二级；3：三级；4：四级）
	private String address; // 联系地址
	private String zipCode; // 邮政编码
	private String master; 	// 负责人
	/*private Area area;		// 归属区域
*/	private String phone; 	// 电话
	private String fax; 	// 传真
	private String email; 	// 邮箱
	private String useable;//是否可用
	private String primaryPerson;//主负责人
	private String deputyPerson;//副负责人
	private List<String> childDeptList;//快速添加子部门
	protected String remarks;	// 备注
	protected String createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected String updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
	//////////////////////////////
	protected User createBys;	// 创建者
	protected User updateBys;	// 更新者
	
	/**
	 * 当前用户
	 */
	protected User currentUser;
	///////////////////////////////

	public Office(){
		super();
//		this.sort = 30;
		this.type = "2";
	}

	public Office(String id){
		this();
		this.id=id;
	}
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUseable() {
		return useable;
	}
	public void setUseable(String useable) {
		this.useable = useable;
	}
	
	public String getPrimaryPerson() {
		return primaryPerson;
	}
	public void setPrimaryPerson(String primaryPerson) {
		this.primaryPerson = primaryPerson;
	}
	public String getDeputyPerson() {
		return deputyPerson;
	}
	public void setDeputyPerson(String deputyPerson) {
		this.deputyPerson = deputyPerson;
	}
	public List<String> getChildDeptList() {
		return childDeptList;
	}
	public void setChildDeptList(List<String> childDeptList) {
		this.childDeptList = childDeptList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
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
	
	
	
	/////////////添加新的属性////////////////
	@JsonBackReference
/*	public Office getParent() {
		return parent;
	}
	public void setParent(Office parent) {
		this.parent = parent;
	}*/
	
/*	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}*/

	@JsonIgnore
	public User getCreateBys() throws Exception {
		if(currentUser == null){
			currentUser = UserUtil.getUser();
		}
		return createBys;
	}
	@JsonIgnore
	public User getCurrentUser() {
		return currentUser;
	}
	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}
	public void setCreateBys(User createBys) {
		this.createBys = createBys;
	}
	@JsonIgnore
	public User getUpdateBys() {
		return updateBys;
	}
	public void setUpdateBys(User updateBys) {
		this.updateBys = updateBys;
	}
	
	/////////////////////////////////////////
	
	@Override
	public String toString() {
		return name;
	}
	
	
}
