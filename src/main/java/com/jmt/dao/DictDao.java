package com.jmt.dao;

import java.util.List;

import com.jmt.pojo.Dict;

/**
 * 基础字典的接口
 * @author T430
 *
 */
public interface DictDao {

	public List<Dict> findAllList(Dict dict) throws Exception;//获取所有的字典信息集合

}
