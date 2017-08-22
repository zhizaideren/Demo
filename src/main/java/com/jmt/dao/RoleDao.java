package com.jmt.dao;

import java.util.List;

import com.jmt.pojo.Role;
import com.jmt.pojo.RoleMenu;
import com.jmt.pojo.RoleOfficeVo;
import com.jmt.pojo.User;

/**
 * 角色dao层接口
 * @author T430
 *
 */
public interface RoleDao {
	public Role findRoleMenuByRoleId(String id) throws Exception;//根据用户角色编号查询用户信息
	public List<Role> findAllRole()throws Exception;//查询所有的角色
	public List<Role> findRoleInfoByUserId(String id)throws Exception;//根据用户编号查询用户所拥有的角色操作权
	public Role finRoleOfficeByUserId(String id) throws Exception;//根据角色编号查询角色信息和（机构）的信息
	public void updateRoleInfo(Role role) throws Exception;//修改角色信息
	public Role getRole(String id) throws Exception;//根据用户角色编号查询
	public boolean outUserInRole(User user,Role role) throws Exception;//从角色中移除用户
}
