package com.jmt.Util;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


import org.springframework.beans.factory.annotation.Autowired;










import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;




import com.jmt.dao.OfficeDao;
import com.jmt.dao.UserDao;
import com.jmt.pojo.Office;
import com.jmt.pojo.User;
import com.jmt.realm.myRealm.Principal;





/**
 * 系统安全类
 * @author T430
 *
 */
public class UserUtil {
	/*@Autowired
	private static UserDao userDao;*/
	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
	/*@Autowired
	private static OfficeDao officeDao;*/
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);
	//添加对session的自动注解
	@Autowired  
	private HttpSession session;  
	 //添加对request的自动注解 
	@Autowired  
	private HttpServletRequest request;  
	
	
	
	
	/**
	 * 获取当前用户
	 * @return 取不到返回 new User()
	 * @throws Exception 
	 */
	public static User getUser() throws Exception{
		//通过request获取用户信息
		HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();; 	
		User user=(User) request.getSession().getAttribute("user");
		if (user != null){
			return user;
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
		
		/*Principal principal = getPrincipal();*/
		/*if (principal!=null){
			User user =userDao.findUserInfo(principal.getId());
			HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();; 	
			User user=(User) request.getSession().getAttribute("user");
			if (user != null){
				return user;
			}
			return new User();
		}*/				
	}
	
	
	/**
	 * 获取当前登录者对象（通过request获取用户信息的话，这个就没用了）
	 */
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			System.out.println("当前登录的对象========================："+subject.getPrincipal());
			String uname=(String) subject.getPrincipal();//获取登录名
			if (uname != null){
				Principal principal=new Principal();
				principal.setLoginName(uname);
				return principal;
			}

		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	public static List<Office> getOfficeList(Session session) throws Exception{
		
		List<Office> officeList = new ArrayList<Office>();
		
			User user = getUser();//通过shiro里的session获取用户信息
			if ("1".equals(user.getId())){
				officeList = officeDao.findAllOffice();
				for (Office office : officeList) {
					System.out.println(office.getName()+"=========================测试是否获得管理员办公机构信息++++++++");
				}
				return officeList;
			}else{
				
				//因为数据库根据用户的办公编号查询找不到信息，所以改为查询所有的办公信息
				officeList = officeDao.findAllOffice();
				for (Office office1 : officeList) {
					System.out.println(office1.getName()+"============="+office1.getParentIds()+"============测试是否获得普通用户办公机构信息++++++++");
				}
				return officeList;
			}
			
		
	}
	
	
	
	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	public static List<Office> getOfficeAllList() throws Exception{
		@SuppressWarnings("unchecked")
		List<Office> officeList = new ArrayList<Office>();
		if (officeList == null){
			officeList = officeDao.findOfficeByUserId("1");
		}
		return officeList;
	}
}
