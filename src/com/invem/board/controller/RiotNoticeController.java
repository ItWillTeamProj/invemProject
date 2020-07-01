package com.invem.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.common.Message;
import com.invem.common.PagingVO;
import com.invem.common.StatusInfo;
import com.invem.controller.Controller;

public class RiotNoticeController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		List<Message> messages = StatusInfo.search();
		
		int currentPage = 1;	//설정된 현재 페이지

		if(request.getParameter("currentPage") != null
				&& !request.getParameter("currentPage").isEmpty()){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	//파라미터로 페이지가 넘어왔다면 1이 아니라 넘어온 값을 읽어서 현재페이지의 값이 된다
		int totalRecord = messages.size();	//전체 게시글 수
		int pageSize = 10;	//한 페이지에 보여줄 게시글 개수
		
		if(request.getParameter("rowNum") != null && !request.getParameter("rowNum").isEmpty()){
			pageSize = Integer.parseInt(request.getParameter("rowNum"));
		}
		int blockSize = 10;	// 페이지의 블럭개수

		PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageVo", pageVo);
		request.setAttribute("code", "R");
		
		
		return "/board/boardList.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
