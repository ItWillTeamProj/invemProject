package com.invem.champion.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.champion.model.AbilityService;
import com.invem.champion.model.AbilityVO;
import com.invem.champion.model.ChampionService;
import com.invem.champion.model.ChampionVO;
import com.invem.common.PagingVO;
import com.invem.controller.Controller;


public class DetailController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String champNo = request.getParameter("no");

		ChampionService service = new ChampionService();
		AbilityService aservService = new AbilityService();
		BoardService bdService = new BoardService();
		
		ChampionVO cVo = null;
		List<AbilityVO> list = null;
		List<BoardVO> bdList = null;
		
		String resource = request.getSession().getServletContext().getRealPath("/config/preview.properties");
		resource = "preview.properties";
		System.out.println(resource);
		Properties properties = new Properties();
		
		
		try {
			cVo = service.searchByNo(Integer.parseInt(champNo));
			list = aservService.searchByNo(Integer.parseInt(champNo));
			
			InputStream reader = getClass().getResourceAsStream(resource);
            properties.load(reader);
            
            bdList = bdService.searchall(Integer.parseInt(champNo), "C");
            
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (IOException e) {
            e.printStackTrace();
        }
        
		int currentPage = 1;	//설정된 현재 페이지
		
		if(request.getParameter("currentPage") != null
				&& !request.getParameter("currentPage").isEmpty()){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	//파라미터로 페이지가 넘어왔다면 1이 아니라 넘어온 값을 읽어서 현재페이지의 값이 된다
		int totalRecord = bdList.size();	//전체 게시글 수
		int pageSize = 10;	//한 페이지에 보여줄 게시글 개수
		int blockSize = 10;	// 페이지의 블럭개수
		PagingVO page = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
		request.setAttribute("cVo", cVo);
		request.setAttribute("aList", list);
		request.setAttribute("previewProp", properties);
		request.setAttribute("bdList", bdList);
		request.setAttribute("page", page);
		
		return "/champion/detail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
