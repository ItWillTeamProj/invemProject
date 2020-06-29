package com.invem.blog.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.board.model.ReplyVO;
import com.invem.common.PagingVO;
import com.invem.controller.Controller;

public class BlogController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		String curPage = request.getParameter("currentPage");
		
		
		
		//1. myBoard.jsp
		
		
		
		
		BoardService boardServ = new BoardService();
		int writeCount = boardServ.countByUserid(userid);
		//2. myBoard.jsp
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			list = boardServ.selectById(userid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
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
		
		
		//3. myReply.jsp
		List<ReplyVO> rList = new ArrayList<ReplyVO>();
		try {
			rList = boardServ.selectAllReply(userid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		//4. guestbook.jsp
		
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("writeCount", writeCount);
		request.setAttribute("list", list);
		request.setAttribute("rList", rList);
		request.setAttribute("userid", userid);
		request.setAttribute("pageVo", pageVo);
		
		return "/blog/blog.jsp?userid="+userid;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
