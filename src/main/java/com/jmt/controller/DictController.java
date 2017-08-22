package com.jmt.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jmt.dao.DictDao;

/**
 * 基础字典的controller
 * @author T430
 *
 */
@Controller
public class DictController {
	@Resource
	private DictDao dictDao;
	
	
	
	
}
