package com.jmt.service;

import java.util.List;
import java.util.Map;

import com.jmt.pojo.Menu;
import com.jmt.pojo.MenuUser;

/**
 * 菜单的service层
 * @author T430
 *
 */
public interface MenuService {
	public List<MenuUser> findMenuAll() throws Exception;//获得菜单集合信息，当前用户为admin
	public List<MenuUser> findMenuByUserId(String id) throws Exception;//普通用户时，根据用户编号获得用户的菜单信息
	public List<Menu> findallChildrenByUserId(Map<String,Object> map) throws Exception;//根据用户编号遍历用户的子类菜单信息

}
