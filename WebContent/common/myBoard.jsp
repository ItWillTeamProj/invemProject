<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
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


	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>
<div id="tabs-2">
	<h1>게시물 페이지</h1>
	<h3>지금껏 회원이 작성한 게시물의 리스트를 출력할 페이지 입니다.</h3>
	<h5>현재 include한 페이지 myBoard.jsp</h5>
	<table table class="table table-hover table-sm">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<%
		if(list != null && !list.isEmpty()){
			for(int i = 0; i < list.size(); i++){
				BoardVO vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getDescribe() %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
	</table>
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="/common/myBoard.jsp?currentPage=<%=pageVo.getFirstPage() - 1 %>">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="/common/myBoard.jsp?currentPage=<%=i%>"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="/common/myBoard.jsp?currentPage=<%=i%>"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="/common/myBoard.jsp?currentPage=<%=pageVo.getLastPage() + 1 %>">Next</a></li>
		<%} %>
		</ul>
	</div>
	
</div>
