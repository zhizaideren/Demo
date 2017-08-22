package com.jmt.pojo;

import java.util.List;

/**
 * 菜单和用户的包装类
 * @author T430
 *
 */
public class MenuUser  {
	
	private static final long serialVersionUID = 1L;
	private String id;//用户编号
	private String name;//用户名
	private Role role;//一个菜单对应一个角色
	private String prantId;//父类菜单编号
	private List<Menu> menulist;//菜单
	private List<Menu> premissions;//权限
	
	private Menu menu;//菜单信息
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Menu> getMenulist() {
		return menulist;
	}
	public void setMenulist(List<Menu> menulist) {
		this.menulist = menulist;
	}
	public List<Menu> getPremissions() {
		return premissions;
	}
	public void setPremissions(List<Menu> premissions) {
		this.premissions = premissions;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getPrantId() {
		return prantId;
	}
	public void setPrantId(String prantId) {
		this.prantId = prantId;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	
}
