package ssmDemo;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jmt.pojo.Office;
import com.jmt.service.OfficeService;

public class TestOfficeService {
	 OfficeService service;

	@Before
	public void setUp() throws Exception {
		//这里获取spring总配置文件  
	      ApplicationContext aCtx = new ClassPathXmlApplicationContext  (  
	        "classpath:applicationContext-dao.xml");  
	      //获取在spring注入的service名字  
	      service = (OfficeService) aCtx  
	        .getBean("OfficeService");  	    
	}

	@Test
	public void test() throws Exception {
		List<Office> list=service.findAllOffice();
		for (Office office : list) {
			System.out.println(office.getName());
		}
	}

}
