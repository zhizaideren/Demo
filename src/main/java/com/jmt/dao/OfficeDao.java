package com.jmt.dao;

import java.util.List;

import com.jmt.pojo.Office;

/**
 * Officedao层接口
 * @author T430
 *
 */
public interface OfficeDao {
		public Office getOfficeById(String id) throws Exception;//通过编号获取办公机构信息
		public List<Office> findAllOffice() throws Exception;//查询到所有的办公机构信息
		public List<Office> findOfficeByUserId(String id) throws Exception;//通过用户编号获取办公信息
		public List<Office> findOfficeByParentIdsLike(Office office) throws Exception;//通过子类编号获取办公机构信息
}
