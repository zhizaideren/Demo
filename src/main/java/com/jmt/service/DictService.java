package com.jmt.service;

import java.util.List;

import com.jmt.pojo.Dict;

/**
 * 基础字典的service层
 * @author T430
 *
 */
public interface DictService {
	public List<Dict> findAllList(Dict dict) throws Exception;//获取所有的字典信息集合
}
