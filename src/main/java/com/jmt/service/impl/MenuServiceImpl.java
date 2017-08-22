package com.jmt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jmt.dao.MenuDao;
import com.jmt.pojo.Menu;
import com.jmt.pojo.MenuUser;
import com.jmt.service.MenuService;
/**
 * 菜单的serviceImple层
 * @author T430
 *
 */
@Service
public class MenuServiceImpl implements MenuService {
	@Resource
	private MenuDao menuDao;
	/**
	 * 当前用户为admin时，显示所有的菜单
	 * @Override
	 */
	public List<MenuUser> findMenuAll() throws Exception {
		// TODO Auto-generated method stub
		return menuDao.findMenuAll();
	}
	/**
	 * 普通用户时，根据用户编号获得用户的菜单信息
	 * @Override
	 */
	public List<MenuUser> findMenuByUserId(String id) throws Exception {
		// TODO Auto-generated method stub
		return menuDao.findMenuByUserId(id);
	}
	/**
	 * 根据用户编号和父类菜单编号查询出子类菜单信息
	 * @Override
	 */
	public List<Menu> findallChildrenByUserId(Map<String,Object> map)
			throws Exception {
		
		return menuDao.findallChildrenByUserId(map);
	}

}
