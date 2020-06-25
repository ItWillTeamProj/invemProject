package com.invem.champion.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.champion.model.AbilityService;
import com.invem.champion.model.AbilityVO;
import com.invem.champion.model.ChampionService;
import com.invem.champion.model.ChampionVO;
import com.invem.controller.Controller;

public class DetailController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String champNo = request.getParameter("no");
		ChampionService service = new ChampionService();
		AbilityService aservService = new AbilityService();
		
		ChampionVO cVo = null;
		List<AbilityVO> list = null;
		try {
			cVo = service.searchByNo(Integer.parseInt(champNo));
			list = aservService.searchByNo(Integer.parseInt(champNo));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("cVo", cVo);
		request.setAttribute("aList", list);
		
		return "/champion/detail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
