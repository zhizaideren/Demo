package com.jmt.pojo;

import java.io.Serializable;

public abstract class BaseEntity<T> implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 实体编号（唯一标示）
	 * 
	 */
	protected String id;
	/**
	 * 当前用户
	 */
	protected User currentUser;
}
