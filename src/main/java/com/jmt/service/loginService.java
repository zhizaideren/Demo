package com.jmt.service;

import java.util.List;
import java.util.Set;








import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;






/**
 * Service层
 * @author T430
 *
 */

public interface loginService {
	/**
	 * 通过登录名获取用户信息
	 * @param loginName
	 * @return
	 */
	public User getUserByUserName(String loginName) throws Exception;
	/**
	 * 通过登录名获取角色信息
	 * @param username
	 * @return
	 */
	public Set<String> getRolesByUserName(String loginName) throws Exception;
	/**
	 * 通过登录名获取权限信息
	 * @param username
	 * @return
	 */
	public Set<String> getPermissionsByUserName(String loginName) throws Exception;
	
	
	
	public List<User> findUserByUser(User user) throws Exception;//通过角色获取用户信息
	
	
	
	
	public List<User> findUserByRoleId(String id) throws Exception;//通过角色编号获取用户信息集合
	
	
	public User getUser(String userId) throws Exception;//通过用户编号获取用户信息
	
}
