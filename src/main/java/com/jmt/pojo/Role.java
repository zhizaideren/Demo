package com.jmt.pojo;

import java.util.List;












import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;




/**
 * 角色实体
 * @author T430
 *
 */
public class Role extends DataEntity<Role> {

	private static final long serialVersionUID = 1L;
	private String id;//角色编号
	private String officeId;
	private Office office;	// 归属机构
	private String name; 	// 角色名称
	private String enname;	// 英文名称
	private String roleType;// 权限类型
	private String dataScope;// 数据范围
	////////新加测试属性//////////
	private String menuIds;
	private String officeIds;
	/////////////////
	private String sysData; 		//是否是系统数据
	private String useable; 		//是否是可用
	
	private List<User> users= Lists.newArrayList();	//拥有的用户列表
	private List<Menu> menuList = Lists.newArrayList(); // 拥有菜单列表
	private List<Office> officeList = Lists.newArrayList(); // 按明细设置数据范围

	
	
	public Role() {
		super();
	}
	
	public Role(String id){
		super();
		this.id = id;
	}
	
	/*public Role(String id, Office office, String name, String enname,
			String roleType, String dataScope, String menuIds, String sysData,
			String useable, List<User> users, List<Menu> menuList,
			List<Office> officeList) {
		super();
		this.id = id;
		this.office = office;
		this.name = name;
		this.enname = enname;
		this.roleType = roleType;
		this.dataScope = dataScope;
		this.menuIds = menuIds;
		this.sysData = sysData;
		this.useable = useable;
		this.users = users;
		this.menuList = menuList;
		this.officeList = officeList;
	}*/

	public Office getOffice() {
		return office;
	}
	public void setOffice(Office office) {
		this.office = office;
	}
	///////////////////////////////////////////////
	
	

	
	public String getName() {
		return name;
	}
	
	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	/////////////////////////////////////////////////
	public void setName(String name) {
		this.name = name;
	}
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	public String getDataScope() {
		return dataScope;
	}
	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}

	public String getSysData() {
		return sysData;
	}
	public void setSysData(String sysData) {
		this.sysData = sysData;
	}
	public String getUseable() {
		return useable;
	}
	public void setUseable(String useable) {
		this.useable = useable;
	}
	
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	
	public List<String> getMenuIdList() {
		List<String> menuIdList = Lists.newArrayList();
		for (Menu menu : menuList) {
			menuIdList.add(menu.getId());
			//System.out.println(	"======测试======"+menuIdList);
		}
		return menuIdList;
	}

	public void setMenuIdList(List<String> menuIdList) {
		menuList = Lists.newArrayList();
		for (String menuId : menuIdList) {
			Menu menu = new Menu();
			menu.setId(menuId);
			menuList.add(menu);
		}
	}
	public String getMenuIds() {
		return StringUtils.join(getMenuIdList(), ",");
	}
	
	public void setMenuIds(String menuIds) {
		menuList = Lists.newArrayList();
		if (menuIds != null){
			String[] ids = StringUtils.split(menuIds, ",");
			setMenuIdList(Lists.newArrayList(ids));
		}
	}
	
	public List<Office> getOfficeList() {
		return officeList;
	}
	public void setOfficeList(List<Office> officeList) {
		this.officeList = officeList;
	}
	//////////////
	//获得办公编号的集合
	public List<String> getOfficeIdList() {
		List<String> officeIdList = Lists.newArrayList();
		for (Office office : officeList) {
			officeIdList.add(office.getId());
		}
		return officeIdList;
	}

	public void setOfficeIdList(List<String> officeIdList) {
		officeList = Lists.newArrayList();
		for (String officeId : officeIdList) {
			Office office = new Office();
			office.setId(officeId);
			officeList.add(office);
		}
	}

	public String getOfficeIds() {
		return StringUtils.join(getOfficeIdList(), ",");
	}
	
	public void setOfficeIds(String officeIds) {
		officeList = Lists.newArrayList();
		if (officeIds != null){
			String[] ids = StringUtils.split(officeIds, ",");
			setOfficeIdList(Lists.newArrayList(ids));
		}
	}
	
	////////////////
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}
