package com.jmt.pojo;
/**
 * 角色菜单包装类
 * @author T430
 *
 */
public class RoleMenu extends Menu {

	private static final long serialVersionUID = 1L;
	private String loginName;//登录名
	private String password;//密码
	
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
	
		
}
