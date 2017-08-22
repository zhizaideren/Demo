package com.jmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.dao.DictDao;
import com.jmt.pojo.Dict;
import com.jmt.service.DictService;
/**
 * Dict的service实现层
 * @author T430
 *
 */
@Service
public class DictServiceImpl implements DictService {
	
	@Autowired
	private DictDao dictDao;
	/**
	 * 获得所有的字典集合
	 */
	public List<Dict> findAllList(Dict dict) throws Exception {
	
		return dictDao.findAllList(dict);
	}

}
