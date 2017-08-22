package com.jmt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



import com.jmt.dao.RoleDao;
import com.jmt.dao.UserDao;
import com.jmt.pojo.Role;
import com.jmt.pojo.RoleMenu;
import com.jmt.pojo.RoleOfficeVo;
import com.jmt.pojo.User;
import com.jmt.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roleDao;
	@Resource
	private UserDao userDao;
	/**
	 * 根据角色编号查询用户角色信息
	 * @Override
	 */
	public Role findRoleMenuByRoleId(String id) throws Exception {
		// TODO Auto-generated method stub
		return roleDao.findRoleMenuByRoleId(id);
	}
	/**
	 * 查询所有的角色信息
	 * @Override
	 */
	public List<Role> findAllRole() throws Exception {
		// TODO Auto-generated method stub
		return roleDao.findAllRole();
	}
	/**
	 * 根据用户编号，查询他所拥有的角色或者他所拥有的可管理角色
	 * @Override
	 */
	public List<Role> findRoleInfoByUserId(String id) throws Exception {
		// TODO Auto-generated method stub
		return roleDao.findRoleInfoByUserId(id);
	}
	/**
	 * 根据用户编号查询所对应的角色（机构）信息
	 * @Override
	 */
	public Role finRoleOfficeByUserId(String id) throws Exception {
		// TODO Auto-generated method stub
		return roleDao.finRoleOfficeByUserId(id);
	}
	/**
	 * 修改角色信息
	 * @Override
	 */
	public void updateRoleInfo(Role role) throws Exception {
		roleDao.updateRoleInfo(role);
		
	}
	/**
	 * 根据角色编号查询
	 * @Override
	 */
	public Role getRole(String id) throws Exception {
		
		return roleDao.getRole(id);
	}
	
	public void saveUser(User user) throws Exception{
		if (com.jmt.Util.StringUtils.isBlank(user.getId())){
			user.preInsert();
			userDao.insert(user);
		}else{
		
		//	User oldUser = userDao.findUserInfo(user.getId());
			
			// 更新用户数据
			user.preUpdate();
			userDao.update(user);
		}
	}
	
	
	
	
	/**
	 * 从角色中移除用户
	 * @Override
	 */
	public boolean outUserInRole(User user, Role role) throws Exception {
		List<Role> roles = user.getRoleList();
		for (Role e : roles){
			if (e.getId().equals(role.getId())){
				roles.remove(e);
				saveUser(user);
				return true;
			}
		}
		return false;
	}
	

}
