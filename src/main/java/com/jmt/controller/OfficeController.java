package com.jmt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jmt.Util.StringUtils;
import com.jmt.pojo.Office;
import com.jmt.service.OfficeService;

/**
 * 办公单位的控制器
 * @author T430
 *
 */
@Controller
public class OfficeController {


	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private OfficeService officeService;
	
	/**
	 * 整体实例化offie，为所有的页面所用
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ModelAttribute("office")
	public Office getOfficeById(String id) throws Exception{
		if (StringUtils.isNotBlank(id)){
			return officeService.getOfficeById(id);
		}else{
			return new Office();
		}
	}
	/**
	 * 进入机构管理的页面
	 * @return
	 */
	@RequiresPermissions("sys:office:index")
	@RequestMapping("/sys/office")
	public String index(Office office, Model model){
		//model.addAttribute("list", officeService);
		return "home/office/officeIndex";
		
	}
	/**
	 * 获得办公单位的集合
	 * @param office
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("sys/office/list")
	public String getlist(Office office, Model model) throws Exception{
		if(office==null || office.getParentIds() == null){
			List<Office> li=officeService.findList(false);
			System.out.println("办公集合lei+++++++++++++++++++++++++++++++++++++++");
			for (Office office2 : li) {
				System.out.println(office2.getName());
			}
			 model.addAttribute("list", officeService.findList(false));
		}else{
			List<Office> lii=officeService.findOfficeListByOffice(office);
			System.out.println("办公集合+++++++++++++++++++++++++++++++++++++++");
			for (Office office3 : lii) {
				System.out.println(office3.getName());
			}
			model.addAttribute("list", lii);
		}
		 return "home/office/officeList";
	}
	/**
	 * 根据办公机构编号获取办公机构的详细信息
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("sys/office/form")
	public String findOfficeInfoById(String id,Model model)throws Exception{
		
		return id;
		
	}
	
	
	
	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param type 类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade 显示级别
	 * @param isAll 是否是缓存
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/sys/office/treeData")
	@ResponseBody
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
			@RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) throws Exception{
		List<Map<String, Object>> mapList = Lists.newArrayList();//设置map集合
		List<Office> list = officeService
				.findList(isAll);
		
		for (int i=0; i<list.size(); i++){
			Office e = list.get(i);
			System.out.println(e.getParentIds()+e.getName()+"办公名字=================zilei ===========");
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))
					&& (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true)))
					&& (grade == null || (grade != null && Integer.parseInt(e.getGrade()) <= grade.intValue()))
		){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				if (type != null && "3".equals(type)){
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
		return mapList;
		
	}
}
