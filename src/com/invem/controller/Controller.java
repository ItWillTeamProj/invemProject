package com.invem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable;
	
	public boolean isRedirect();
}
