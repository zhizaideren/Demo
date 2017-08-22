package com.jmt.Util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * 在服务器启动时调用前面写好的定时加载类。
 * Servlet implementation class MapperReloadServlet
 */
@WebServlet("/MapperReloadServlet")
public class MapperReloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MapperReloadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init()throws ServletException
	{
		Logger logger = Logger.getLogger(this.getClass());
		logger.info("The mapper reload timer starting... ");

		try {
			new SqlSessionCache().refreshMapper();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}       
	}
}
