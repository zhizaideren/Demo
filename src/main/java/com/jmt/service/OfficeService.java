package com.jmt.service;

import java.util.List;

import com.jmt.pojo.Office;

/**
 * 办公机构的service层
 * 
 * * @author T430
 *
 */
public interface OfficeService {
	public Office getOfficeById(String id) throws Exception;//通过编号获取办公机构信息
	public List<Office> findAllOffice() throws Exception;//查询到所有的办公机构信息
	public List<Office> findOfficeByUserId(String id) throws Exception;//通过用户编号获取办公信息
	
	public List<Office> findList(Boolean isAll) throws Exception;//一个通过判断是否是管理员来获取所有集合的方法
	
	public List<Office> findOfficeListByOffice(Office office) throws Exception;//通过办公机构信息获取办公集合的方法
	
	public List<Office> findOfficeByParentIdsLike(Office office) throws Exception;//通过子类编号获取办公机构信息

}
