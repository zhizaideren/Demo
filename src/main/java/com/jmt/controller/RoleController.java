package com.jmt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




import com.jmt.Util.StringUtils;
import com.jmt.Util.UserUtil;
import com.jmt.pojo.Office;
import com.jmt.pojo.Role;
import com.jmt.pojo.RoleMenu;
import com.jmt.pojo.RoleOfficeVo;
import com.jmt.pojo.User;
import com.jmt.service.MenuService;
import com.jmt.service.RoleService;
import com.jmt.service.loginService;


/**
 * 角色controller层
 * @author T430
 *
 */
@Controller
public class RoleController extends BaseController {
	@Resource
	private RoleService roleService;
	@Resource
	private MenuService menuService;
	@Resource
	private loginService logsService;
	
	/**
	 * form表单中 modelAttribute绑定实体时，整形初始化
	 * @return
	 * @throws Exception 
	 */
	@ModelAttribute("role")
	public Role getRole(String id) throws Exception{
		if (StringUtils.isNotBlank(id)){
			return roleService.getRole(id);
		}else{
			return new Role();
		}		
	}
	
	/**
	 * 没有用到
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions(value={"sys:role:view","sys:role:add","sys:role:edit"})
	@RequestMapping("/sys/role/form")
	public String finRoleOfficeByUserId(String id,Model model) throws Exception{
		Role  role=roleService.finRoleOfficeByUserId(id);
		//System.out.println(role.getName()+"==========");
		model.addAttribute("roleMenu",role);
		return "home/role/role-select";
	}
	/**
	 * 根据角色编号获取角色信息遍历该角色的所有信息并显示在修改页面上（修改前）
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/role/edit")
	public String finRoleInfoByUserId(String id,Model model) throws Exception{
		Role  role=roleService.findRoleMenuByRoleId(id);
		System.out.println(role.getName()+"=========="+role.getOfficeId()+"================");
		model.addAttribute("roleMenu",role);
		return "home/role/role-edit";
	}
	 /**
	  * 系统管理员，部门管理员可以查询角色
	  * @param id
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 @RequiresPermissions("sys:role:view")
	 @RequestMapping("sys/role/findAllRole")
	 public String findAllRole(Model model) throws Exception{
		 List<Role> roleList=roleService.findAllRole();
		 for (Role role : roleList) {
			System.out.println(role.getName()+"==========================="+role.getCreateDate());
		}
		 model.addAttribute("roleList", roleList);
		return "/home/admin-role";
		 
	 }
	 /**
	  * 查看角色菜单
	  * @return
	  * @throws Exception
	  */
	 @RequiresPermissions(value={"sys:role:view","sys:role:add","sys:role:edit"})
	 @RequestMapping("/sys/role")
	 public String findRoleList() throws Exception{
	
		return "/home/role/role-menu";
		 
	 }
	 /**
	  * 
	  * 修改角色信息，并返回到角色菜单列表上
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("role/updateRole")
	 public String updateRoleInfo(Role role) throws Exception{
		 roleService.updateRoleInfo(role);
		 
		 return "/home/role/role-menu";
	 }
	 
	 /**
	  * 根据角色编号，显示权限限制到权限列表
	  * 
	  */
	@RequestMapping("sys/role/auth")
	public String findAuthInfo(String id,String userId,Role role, Model model) throws Exception{
		/*	Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("userId", userId);*/
	System.out.println("=============role的值======"+role.getEnname()+"=====================");
		model.addAttribute("role", role);
		if(userId.equals("1")){
			model.addAttribute("menuUserlist", menuService.findMenuAll());
		}else{
			model.addAttribute("menuUserlist",menuService.findMenuByUserId(userId));
		}
		return "home/role/role-auth";		
	}
	
	
	
	/**
	 * 通过角色编号获得用户信息
	 * @param role
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping("sys/role/assign")
	public String findUserByRoleId(String id,Model model) throws Exception{
		List<User> user=logsService.findUserByUser(new User(roleService.getRole(id)));
		Role role=roleService.getRole(id);
		System.out.println("user的所有信息：=====role的编号"+ id+"========"+(role.getName())+"=================");
		//System.out.println("user的所有信息：====="+ user.get(1).getLoginName()+"=========================");
		for (User user2 : user) {
			System.out.println(user2.getLoginName());
		}
		model.addAttribute("userList", user);
		return "home/role/role-assign";
		
	}
	/**
	 * 移除用户
	 * @return
	 * @throws Exception 
	 */
	@RequiresPermissions("sys:role:assign")
	@RequestMapping("sys/role/outrole")
	public String outrole(String userId, String roleId,HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception{
		
		Role role=roleService.getRole(roleId);
		User user=logsService.getUser(userId);
		User user1=(User) request.getSession().getAttribute("user");//通过session获取当前登录的用户
		if(user1.getId().equals(userId)){
			/*addMessage(redirectAttributes, "无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");*/
			redirectAttributes.addFlashAttribute("message","无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");
		}else{
			if(user.getRoleList().size() <= 1){
				/*addMessage(redirectAttributes, "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！这已经是该用户的唯一角色，不能移除。");*/
				redirectAttributes.addFlashAttribute("message","用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！这已经是该用户的唯一角色，不能移除。");
			}else{
				Boolean flag = roleService.outUserInRole(user, role);
				if (!flag) {
					/*addMessage(redirectAttributes, "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");*/
					redirectAttributes.addFlashAttribute("message","用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");
				}else {
					
				/*	addMessage(redirectAttributes, "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除成功！");*/
					redirectAttributes.addFlashAttribute("message","用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除成功！");
				}
			}
		}
		
		return "redirect:/sys/role/assign?id="+role.getId();
		
	}
	
	
}
