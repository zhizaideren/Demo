package com.jmt.service.impl;



import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;













import com.jmt.dao.loginDao;
import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;
import com.jmt.service.loginService;

@Service
public class loginServiceImpl implements loginService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private loginDao logindao;

	/**
	 * 通过登录名获取用户信息
	 * @Override
	 */
	public User getUserByUserName(String loginName) throws Exception{
		// TODO Auto-generated method stub
		return logindao.getUserByUserName(loginName);
	}

	/**
	 * 通过登录名获取角色信息
	 * @param loginName
	 * @return
	 */
	public Set<String> getRolesByUserName(String loginName) throws Exception {
		// TODO Auto-generated method stub
		return logindao.getRolesByUserName(loginName);
	}

	/**
	 * 通过登录名获取权限信息
	 * @param loginName
	 * @return
	 * @throws Exception 
	 */
	public Set<String> getPermissionsByUserName(String loginName) throws Exception {
		// TODO Auto-generated method stub
		return logindao.getPermissionsByUserName(loginName);
	}

	/**
	 * 通过角色编号获取用户信息
	 * @Override
	 */
	public List<User> findUserByUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return logindao.findUserByUser(user);
	}

	/**
	 * 通过角色编号获取用户信息集合
	 * @Override
	 */
	public List<User> findUserByRoleId(String id) throws Exception {
		// TODO Auto-generated method stub
		return logindao.findUserByRoleId(id);
	}

	/**
	 * 通过用户编号获取用户信息
	 * @Override
	 */
	public User getUser(String userId) throws Exception {
		User user=logindao.getUser(userId);
		return user;
	}

	
	
	
	
	
	
	


}
