package com.jmt.pojo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.jmt.Util.UserUtil;




/**
 * 系统用户实体类
 * @author T430
 *
 */
public class User {
	private String id;//用户编号
	private String companyId;//公司编号
	private String officeId;//办公单位编号
	///////////新增实体属性//////////////
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	////////////////////////
	private String loginName;//登录名
	private String password;//登录密码
	private String no;//工号
	private String name;//名字
	private String email;//邮箱
	private String phone;//手机
	private String mobile;//固话
	private String userType;//用户类型
	private String photo;//头像
	private String loginIp;//登录ip
	private Date loginDate;//登录时间
	private String loginFlag;//登录状态
	private String createBy;//由谁创建
	private Date createDate;//创建时间
	private String updateBy;//由谁修改
	private Date updateDate;//修改时间
	private String remarks;//备注
	private String delFlag;//注销状态
	private String qrcode;//二维码
	private Role role;//角色
	///////////////////////////////
	protected User createBys;	// 创建者
	protected User updateBys;	// 更新者
	protected User currentUser;
	///////////////////////////////
	private List<Role> roleList=Lists.newArrayList();//一个用户可以有多个角色
	
	private List<MenuUser> menulist;//菜单
	private List<Menu> premissions;//权限
	
//////////////////////////////
	public User() {
		super();
	}
	
	public User(Role role){
		super();
		this.role = role;
	}
	
//////////////////////////////////	
	////////////新加入插入方法///////////
	/**
	 * 插入之前执行方法，需要手动调用
	 * @throws Exception 
	 */

	public void preInsert() throws Exception{
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		
			//setId(IdGen.uuid());
	
		User user = UserUtil.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBys = user;
			this.createBys = user;
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}
	
	
	
	
	/**
	 * 更新之前执行方法，需要手动调用
	 * @throws Exception 
	 */

	public void preUpdate() throws Exception{
		User user = UserUtil.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBys = user;
		}
		this.updateDate = new Date();
	}
/////////////////新加的当前用户的setget方法///////////////////////////	
	@JsonIgnore
	@XmlTransient
	public User getCurrentUser() throws Exception {
		if(currentUser == null){
			currentUser = UserUtil.getUser();
		}
		return currentUser;
	}
	
	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}
	
	
	
	
	//////////////////////////////////
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	public String getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getQrcode() {
		return qrcode;
	}
	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	@JsonIgnore
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	public List<MenuUser> getMenulist() {
		return menulist;
	}
	public void setMenulist(List<MenuUser> menulist) {
		this.menulist = menulist;
	}
	public List<Menu> getPremissions() {
		return premissions;
	}
	public void setPremissions(List<Menu> premissions) {
		this.premissions = premissions;
	}
	//////新增实体属性的setget方法//////
	public Office getCompany() {
		return company;
	}
	public void setCompany(Office company) {
		this.company = company;
	}
	public Office getOffice() {
		return office;
	}
	public void setOffice(Office office) {
		this.office = office;
	}

	public User getCreateBys() {
		return createBys;
	}

	public void setCreateBys(User createBys) {
		this.createBys = createBys;
	}

	public User getUpdateBys() {
		return updateBys;
	}

	public void setUpdateBys(User updateBys) {
		this.updateBys = updateBys;
	}
	
	
	
	
	//////////////////////////
	
}
