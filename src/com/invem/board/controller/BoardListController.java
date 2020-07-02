package com.invem.board.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.common.PagingVO;
import com.invem.controller.Controller;

public class BoardListController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//코드를 받아와서 게시판의 이름을 적는다
		String code = request.getParameter("code");

		//검색 버튼을 눌렀을때 option의 이름과 검색어를 받아온다.
		String condition = request.getParameter("searchCondition");
		String keyword = request.getParameter("searchKeyword");

		//db작업
		BoardService boardServ = new BoardService();
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		//공지사항인지 아닌지
		String isNotice = request.getParameter("isNotice");
		
		//최신순, 추천순 정렬
		String sort = request.getParameter("sort");
		
		try{
			if("Y".equals(isNotice)) {
				list = boardServ.selectNotice();
			}else {
				list = boardServ.searchall(keyword, condition, code, sort);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//페이징 처리
		int currentPage = 1;	//설정된 현재 페이지

		if(request.getParameter("currentPage") != null
				&& !request.getParameter("currentPage").isEmpty()){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	//파라미터로 페이지가 넘어왔다면 1이 아니라 넘어온 값을 읽어서 현재페이지의 값이 된다
		int totalRecord = list.size();	//전체 게시글 수
		int pageSize = 10;	//한 페이지에 보여줄 게시글 개수
		if(request.getParameter("rowNum") != null && !request.getParameter("rowNum").isEmpty()){
			pageSize = Integer.parseInt(request.getParameter("rowNum"));
		}
		int blockSize = 10;	// 페이지의 블럭개수

		PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		

		
		
		System.out.println(pageSize);
		
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		request.setAttribute("code", code);
		
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sort", sort);
		request.setAttribute("isNotice", isNotice);
		return "/board/boardList.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
