<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="com.invem.board.model.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
	PagingVO rPageVo = (PagingVO)request.getAttribute("rPageVo");
	
	int rNum = rPageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int rCurPos = rPageVo.getCurPos();	//페이지당 시작 인덱스 번호
	rPageVo.setPageSize(6);
%>
<div id="tabs-3">
	<div style="margin-top: 10px; width: 100%; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px; 
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>댓글 모음</b>
		</div>
	</div>
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
				<td><%=rNum+1 %></td>
				<td><%=vo.getReply() %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
		</table>
		
		

		<div style = "text-align: center;">
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
