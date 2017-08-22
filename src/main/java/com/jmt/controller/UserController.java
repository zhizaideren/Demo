package com.jmt.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jmt.pojo.MenuUser;
import com.jmt.pojo.Office;
import com.jmt.pojo.OfficeArea;
import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;
import com.jmt.service.MenuService;
import com.jmt.service.UserService;
import com.jmt.service.loginService;
/**
 * controller
 * @author T430
 *
 */
@Controller
public class UserController {

	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());


	@Resource
	private loginService logins;
	@Resource
	private UserService userService;
	@Resource
	private MenuService menuService;
	/**
	 * 登录验证
	 * @param loginName
	 * @return
	 */
	@RequestMapping(value="login")
	public String login(String loginName,String password,HttpServletRequest request,Model model){
		//先获取主体
		Subject subject=SecurityUtils.getSubject();
		//获取token令牌
		UsernamePasswordToken token=new UsernamePasswordToken(loginName, password);
		User users;
		try{
			//登录成功
			subject.login(token);
			users=logins.getUserByUserName(loginName);
			//获取session
			Session session=subject.getSession();
	
			System.out.println("sessionId:"+session.getId());
			System.out.println("session的Host:===="+session.getHost());
			System.out.println("session的失效时长：====="+session.getTimeout());
			System.out.println("用户编号：==========="+users.getId());
				if(users.getId()=="1"){
					users.setMenulist(menuService.findMenuAll());//查询是管理员的所有的菜单信息
					List<MenuUser> li=menuService.findMenuAll();
					
					System.out.println("用户权限有：");
					for (MenuUser menuUser : li) {
						System.out.println(menuUser.getMenu().getPermission());
					}
				
					model.addAttribute("menuUserlist",users.getMenulist());
				}else{
					users.setMenulist(menuService.findMenuByUserId(users.getId()));//不是管理员的所有菜单信息
					
					model.addAttribute("menuUserlist",users.getMenulist());
				}
				
				//登录成功，放到session中用户信息
				request.getSession().setAttribute("user", users);
			//登录成功，转发到成功界面
			return "home/admin-index";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("登录失败");
			request.setAttribute("msg", "用户名或者密码不正确");
			return "redirect:login.jsp";
		}		
	}
		/**
		 * 退出登录
		 * @param request
		 * @return
		 */
	 @RequestMapping("loginout")
	    public String logout(HttpServletRequest request) {
	        request.removeAttribute("user");;
	        return "redirect:login.jsp";
	    }  
	 
	 /**
	  *通过用户编号查询用户信息
	  * @param id
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/sys/user/info/findUserInfo" )
	 public String findUserInfo(String id,Model model) throws Exception{
		User user= userService.findUserInfo(id);
		model.addAttribute("User",user);
		return "/home/admin-user";
	 }
	 /**
	  * 修改用户信息
	  * @param user
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/sys/user/info/updateUserInfo" )
	 public String updateUserInfo(User user) throws Exception{
		 userService.updateUserInfo(user);
		 return "redirect:home/admin-index.jsp";
	 }
	 /**
	  * 系统管理员，部门管理员可以查询角色，查询用户角色
	  * @param id
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("sys/role/findAllOffice")
	 public String findAllOffice(Model model) throws Exception{
		 List<Office> officeList=userService.findAllOffice();
		 for (Office office : officeList) {
			System.out.println(office.getName()+"==========================="+office.getCreateDate());
		}
		 model.addAttribute("officeList", officeList);
		return "/home/admin-role";
		 
	 }
	 /**
	  * 遍历所有的办公信息
	  * @param model
	  * @return
	 * @throws Exception 
	  */
	 @RequestMapping("/sys/office/findAllOfficeInfo")
	 public String findAllOfficeInfo(Model model) throws Exception{
		 List<OfficeArea> officeAreaList=userService.findAllOfficeArea();
		 model.addAttribute("officeAreaList", officeAreaList);
		 return "/home/admin-office";
	 }
}
