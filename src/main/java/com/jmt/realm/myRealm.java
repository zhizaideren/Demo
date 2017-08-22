package com.jmt.realm;


import java.io.Serializable;
import java.security.Principal;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;

import com.jmt.Util.Encodes;
import com.jmt.pojo.Menu;
import com.jmt.pojo.MenuUser;
import com.jmt.pojo.Role;
import com.jmt.pojo.User;
import com.jmt.pojo.UserRole;
import com.jmt.service.MenuService;
import com.jmt.service.loginService;
/**
 * 安全验证类
 * realm
 * @author T430
 *
 */
public class myRealm extends AuthorizingRealm{
	@Resource
	private loginService logins;
	@Resource
	private MenuService menuService;



	/**
	 * 第一步，验证登录的用户，只有身份认证成功后，才进行授权和角色
	 * @Override
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken tokens =  (UsernamePasswordToken) token;
		//获取用户名
		String username=(String) token.getPrincipal();
		try{
			User 	user=logins.getUserByUserName(tokens.getUsername());//通过token令牌获得用户名，然后根据用户名查询用户
			//System.out.println(username+"的信息为："+user.getName()+"======================");
			if(user!=null){
				//把信息封装到AuthenticationInfo中
				AuthenticationInfo authInfo=new SimpleAuthenticationInfo(user.getLoginName(),user.getPassword(),"ooo");
				//////////////////////////////////
				//加盐处理
				//	byte[] salt=Encodes.decodeHex(user.getPassword().substring(0,16));
				//	return new SimpleAuthenticationInfo(user.getLoginName(),ByteSource.Util.bytes(salt), getName());
				//////////////////////////////////
				return authInfo;//返回认证信息
			}else{
				return null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * 当用户验证通过后登录进去给予角色和权限
	 * 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		//////////////////////////////
		String uname= (String) getAvailablePrincipal(principals);//获得登录名
		//通过用户名获取用户信息
		User user=null;
		try {
		user=logins.getUserByUserName(uname);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Principal principal=new Principal();
		principal.setId(user.getId());
		principal.setLoginName(uname);
		principal.setName(user.getName());
		/////////////////////////////
	/*	Principal principal = (Principal) getAvailablePrincipal(principals);

		//获取当前用户
		User user;
		try {
			user=logins.getUserByUserName(principal.getName());
			if(user!=null){
				SimpleAuthorizationInfo Info=new SimpleAuthorizationInfo();//要把信息封装到里面
				List<MenuUser> list = null;
				if(user.getId()=="1"){
					user.setMenulist(menuService.findMenuAll());//查询是管理员的所有的菜单信息
					list=menuService.findMenuAll();
					System.out.println("用户权限有：");
					for (MenuUser menuUser : list) {
						System.out.println(menuUser.getMenu().getPermission());
						if (StringUtils.isNotBlank(menuUser.getMenu().getPermission())){
							// 添加基于Permission的权限信息
							for (String permission : StringUtils.split(menuUser.getMenu().getPermission(),",")){
								Info.addStringPermission(permission);
							}
						}
					}


				}else{
					user.setMenulist(menuService.findMenuByUserId(user.getId()));//不是管理员的所有菜单信息
					list=menuService.findMenuByUserId(user.getId());
					System.out.println("用户权限有：");
					for (MenuUser menuUser : list) {
						System.out.println(menuUser.getMenu().getPermission());
						if (StringUtils.isNotBlank(menuUser.getMenu().getPermission())){
							// 添加基于Permission的权限信息
							for (String permission : StringUtils.split(menuUser.getMenu().getPermission(),",")){
								Info.addStringPermission(permission);
							}
						}
					}
				}
				
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}*/
		/////////////////////////////
		//获取登录名
		String loginName=(String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();//要把信息封装到里面
		try{
			authorizationInfo.setRoles(logins.getRolesByUserName(loginName));;//设置角色信息
			System.out.println(loginName+"的角色有："+logins.getRolesByUserName(loginName)+"======================");			
			///////////////////////////////
			Set<String> setli=logins.getPermissionsByUserName(loginName);
			
			authorizationInfo.setStringPermissions(setli);;//设置所有的权限信息
			System.out.println(loginName+"的权限有："+setli+"============================");
		}catch(Exception e){
			e.printStackTrace();
		}
		return authorizationInfo;//返回封装好的角色权限
	}

	/**
	 * 授权用户信息
	 */
	public static class Principal implements Serializable {

		private static final long serialVersionUID = 1L;
		
		private String id; // 编号
		private String loginName; // 登录名
		private String name; // 姓名
		
		public Principal() {
			super();
		}

		
		
		public Principal(String id, String loginName, String name) {
			super();
			this.id = id;
			this.loginName = loginName;
			this.name = name;
		}



		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getLoginName() {
			return loginName;
		}

		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		
		
		
		
	}

}
