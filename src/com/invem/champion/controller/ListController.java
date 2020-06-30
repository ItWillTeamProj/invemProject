package com.invem.champion.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.champion.model.ChampionService;
import com.invem.champion.model.ChampionVO;
import com.invem.controller.Controller;

public class ListController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String[] role = request.getParameterValues("role");
		String[] skill = request.getParameterValues("skill");
		String val = request.getParameter("val");
		
		ChampionService service = new ChampionService();
		List<ChampionVO> list = null;
		try {
			if(val != null && !val.isEmpty()) {
				list = service.searchAll(val);
			}else {
				list = service.searchAll(role, skill);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("champList", list);
		request.setAttribute("role", role);
		request.setAttribute("skill", skill);
		return "/champion/list.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
