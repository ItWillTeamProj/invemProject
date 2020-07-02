package com.invem.blog.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.board.model.GuestbookVO;
import com.invem.board.model.ReplyVO;
import com.invem.common.LeagueInfo;
import com.invem.common.LeagueVO;
import com.invem.common.PagingVO;
import com.invem.common.SummonerInfo;
import com.invem.common.SummonerVO;
import com.invem.controller.Controller;
import com.invem.member.model.MemberDTO;
import com.invem.member.model.MemberService;

public class BlogController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("sId");
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
		
		PagingVO bPageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
		
		//3. myReply.jsp
		List<ReplyVO> rList = new ArrayList<ReplyVO>();
		try {
			rList = boardServ.selectAllReply(userid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		currentPage = 1;	//설정된 현재 페이지
		
		totalRecord = rList.size();	//전체 게시글 수
		pageSize = 10;	//한 페이지에 보여줄 게시글 개수
		if(request.getParameter("rowNum") != null && !request.getParameter("rowNum").isEmpty()){
			pageSize = Integer.parseInt(request.getParameter("rowNum"));
		}
		blockSize = 10;	// 페이지의 블럭개수
		
		PagingVO rPageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
		//4. guestbook.jsp
		MemberService serv = new MemberService();
		//riot api
		MemberDTO vo=serv.selectMember(userid);
		
		Gson gson = new GsonBuilder().create();
		if(vo.getSum_name() != null && !vo.getSum_name().isEmpty()) {
			
			String sInfo = SummonerInfo.search(vo.getSum_name());
			
			SummonerVO smVo = null;
			LeagueVO lgVo = null;
			List<LeagueVO> lgList = null;
			if(sInfo.indexOf("message") == -1) {
				smVo = gson.fromJson(sInfo, SummonerVO.class);
				
				String lInfo = LeagueInfo.search(smVo.getId());
				System.out.println("결과 = " + lInfo);
				lgList = gson.fromJson(lInfo, new TypeToken<List<LeagueVO>>(){}.getType());
				lgVo = lgList.get(0);
			}
		
			request.setAttribute("smVo", smVo);
			request.setAttribute("lgVo", lgVo);
		}
		request.setAttribute("curPage", curPage);
		request.setAttribute("writeCount", writeCount);
		request.setAttribute("list", list);
		request.setAttribute("rList", rList);
		request.setAttribute("pageVo", bPageVo);
		request.setAttribute("rPageVo", rPageVo);
		
		//게스트 북
		List<GuestbookVO> gList = new ArrayList<GuestbookVO>();
		gList = boardServ.guestbookList(userid);
		System.out.println(gList);
		
		
		currentPage = 1;	//설정된 현재 페이지
		
		if(request.getParameter("currentPage") != null
				&& !request.getParameter("currentPage").isEmpty()){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	//파라미터로 페이지가 넘어왔다면 1이 아니라 넘어온 값을 읽어서 현재페이지의 값이 된다
		totalRecord = gList.size();	//전체 게시글 수
		pageSize = 6;	//한 페이지에 보여줄 게시글 개수
		blockSize = 10;	// 페이지의 블럭개수
		
		PagingVO gPageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		request.setAttribute("gPageVo", gPageVo);
		request.setAttribute("gList", gList);
		
		
		return "/blog/blog.jsp?userid="+userid;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
