package com.jmt.service;

import java.util.List;

import com.jmt.pojo.Office;
import com.jmt.pojo.OfficeArea;
import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;

/**
 * service层
 * @author T430
 *
 */
public interface UserService {
	public User findUserInfo(String id)throws Exception ;//根据用户编号，查询用户的信息
	public void updateUserInfo(User user) throws Exception;//修改用户信息
	public List<Role> findRoleByUserId(String id) throws Exception ;//根据用户编号，查询用户的角色
	public List<Office> findAllOffice() throws Exception;//查询所有的部门机构；
	public List<OfficeArea> findAllOfficeArea()throws Exception;//查询所有的部门信息带地区的
	public int insert(User user) throws Exception;//插入用户信息
	public int update(User user) throws Exception;//跟新用户信息
}
