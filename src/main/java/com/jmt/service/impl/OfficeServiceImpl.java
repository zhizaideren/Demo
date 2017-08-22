package com.jmt.service.impl;

import java.util.List;

import javax.annotation.Resource;






import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;












import com.jmt.Util.UserUtil;
import com.jmt.dao.OfficeDao;
import com.jmt.pojo.Office;
import com.jmt.service.OfficeService;
/**
 * 办公机构的实现层
 * @author T430
 *
 */
@Service
public class OfficeServiceImpl implements OfficeService {
	

	@Autowired
	private OfficeDao officeDao;

	/**
	 * 通过编号获取办公机构信息
	 * @Override
	 */
	public Office getOfficeById(String id) throws Exception {

		return officeDao.getOfficeById(id);
	}

	/**
	 * 查询所有的办公信息
	 * @Override
	 */
	public List<Office> findAllOffice() throws Exception {

		return officeDao.findAllOffice();
	}

	/**
	 * 根据用户编号获取办公集合
	 * @Override
	 */
	public List<Office> findOfficeByUserId(String id) throws Exception {
		
		return officeDao.findOfficeByUserId( id);
	}

	/**
	 * 一个通过判断是否是管理员来获取所有集合的方法
	 * @Override
	 */
	public List<Office> findList(Boolean isAll) throws Exception {
		//////////////////新添加通过shiro的session获取用户信息/////////////////////////
		Subject subject=SecurityUtils.getSubject();
		Session session = subject.getSession();
		//////////////////////////////////////////
		if (isAll != null && isAll){
			return UserUtil.getOfficeAllList();
		}else{
		return UserUtil.getOfficeList(session);
		}
	}
	
	

	/**
	 * 通过子类编号获取办公机构信息
	 * @Override
	 */
	public List<Office> findOfficeByParentIdsLike(Office office)
			throws Exception {
		
		return officeDao.findOfficeByParentIdsLike(office);
	}

	/**
	 * 通过办公机构信息获取办公集合的方法
	 * @Override
	 */
	public List<Office> findOfficeListByOffice(Office office) throws Exception {
		office.setParentIds(office.getParentIds()+"%");
	return officeDao.findOfficeByParentIdsLike(office);
	}
}
