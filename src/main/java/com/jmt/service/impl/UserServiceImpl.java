package com.jmt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jmt.dao.UserDao;
import com.jmt.pojo.Office;
import com.jmt.pojo.OfficeArea;
import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;
import com.jmt.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	
	
	@Resource
	private UserDao userDao;
	/**
	 * 根据用户编号查询用户信息
	 */
	@Override
	public User findUserInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findUserInfo(id);
	}
	/**
	 * 修改用户信息
	 * @Override
	 */
	public void updateUserInfo(User user) throws Exception {
		userDao.updateUserInfo(user);
		
	}
	/**
	 * 根据用户编号查询用户角色
	 * @Override
	 */
	public List<Role> findRoleByUserId(String id) throws Exception {
		List<Role> roleList=new ArrayList<Role>();
		roleList=userDao.findRoleByUserId(id);
		return roleList;
	}
	/**
	 * 查询所有的部门信息
	 * @Override
	 */
	public List<Office> findAllOffice() throws Exception {
		List<Office>  officelist=userDao.findAllOffice();
		return officelist;
	}
	/**
	 * 查询所有带地区的部门信息
	 * @Override
	 */
	public List<OfficeArea> findAllOfficeArea() throws Exception {
		List<OfficeArea> officeAreaList=userDao.findAllOfficeArea();
		return officeAreaList;
	}
	/**
	 * 插入用户信息
	 * @Override
	 */
	public int insert(User user) throws Exception {
		int indexs=userDao.insert(user);
		return indexs;
	}
	/**
	 * 更新用户信息
	 * @Override
	 */
	public int update(User user) throws Exception {
		int indexs=userDao.update(user);
		return indexs;
	}
	
}
