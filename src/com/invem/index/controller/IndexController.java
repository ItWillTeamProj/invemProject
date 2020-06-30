package com.invem.index.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.champion.model.ChampionService;
import com.invem.champion.model.ChampionVO;
import com.invem.controller.Controller;

public class IndexController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int champNo = (int)(Math.random()*148) + 1;
		
		ChampionService service = new ChampionService();
		ChampionVO vo = null;
		
		String resource = request.getSession().getServletContext().getRealPath("/config/preview.properties");
		resource = "preview.properties";
		System.out.println(resource);
		Properties properties = new Properties();
		
		try {
			vo = service.searchByNo(champNo);
			InputStream reader = getClass().getResourceAsStream(resource);
            properties.load(reader);
            
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("champVo", vo);
		request.setAttribute("prop", properties);
		
		return "/index/index.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
