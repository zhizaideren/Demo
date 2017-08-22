package com.jmt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jmt.dao.MenuDao;
import com.jmt.pojo.Menu;
import com.jmt.pojo.MenuUser;
import com.jmt.service.MenuService;
import com.jmt.service.RoleService;

/**
 * 
 * @author T430
 *
 */
@Controller
public class MenuController {
		@Resource
		private MenuDao menuDao;
		@Resource
		private MenuService menuService;
		@Resource
		private RoleService roleService;
		
		/**
		 * 根据用户编号和父类菜单编号查询出子类菜单信息
		 * @param id
		 * @param userId
		 * @param model
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("findallChildrenByUserId")
		public String findallChildrenByUserId(String id,String userId,Model model) throws Exception{
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("userId", userId);
			List<Menu> list=menuDao.findallChildrenByUserId(map);
			for (Menu menuUser : list) {
				System.out.println(menuUser.getHref());
			}
			model.addAttribute("children", list);
			return "home/menu/user-menu";
		}
		
		/* *//**
		  * 根据角色编号，显示权限限制到权限列表
		  * 
		  *//*
		@RequestMapping("sys/role/auth")
		public String findAuthInfo(String id,String userId, Model model) throws Exception{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("id", id);
			map.put("userId", userId);
			if(userId.equals("1")){
				model.addAttribute("menuUserlist", menuService.findMenuAll());
			}else{
				model.addAttribute("menuUserlist",menuService.findMenuByUserId(userId));
			}
			return "home/role/role-auth";
			
		}*/
		
}
