package com.jmt.pojo;
/**
 * 用户角色实体类
 * @author T430
 *
 */
public class UserRole extends Role{
	
	private static final long serialVersionUID = 1L;
	private String loginName;
	private String password;
	private String id;//用户编号
	private User user;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
