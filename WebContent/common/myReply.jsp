<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="com.invem.board.model.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
	PagingVO rPageVo = (PagingVO)request.getAttribute("rPageVo");
	int currentPage = 1;	//설정된 현재 페이지
	
	int rNum = rPageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int rCurPos = rPageVo.getCurPos();	//페이지당 시작 인덱스 번호
	rPageVo.setPageSize(6);
%>
<div id="tabs-3">
	<h1>댓글 페이지</h1>
	<h3>회원이 작성한 댓글의 list를 출력할 페이지 입니다.</h3>
	<h5>현재 include한 페이지 myReply.jsp</h5>
	<table class="table table-hover table-sm">
		<tr>
			<th>번호</th>
			<th>작성댓글</th>
			<th>작성일</th>
		</tr>
		<%
		if(rList != null && !rList.isEmpty()){
			for(int i = 0; i < rPageVo.getPageSize(); i++){
				if(rNum -- < 1)	break;

				ReplyVO vo = rList.get(rCurPos++);
			%>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getReply() %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
		</table>
		<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(rPageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=rPageVo.getFirstPage() - 1 %>#tabs-3">Previous</a></li>
		<%} %>
	
		<%for(int i = rPageVo.getFirstPage(); i <= rPageVo.getLastPage(); i++){
			if(i > rPageVo.getTotalPage()) break;
		%>
			<%if(i != rPageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-3"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-3"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(rPageVo.getLastPage() < rPageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=rPageVo.getLastPage() + 1 %>#tabs-3">Next</a></li>
		<%} %>
		</ul>
	</div>
</div>
