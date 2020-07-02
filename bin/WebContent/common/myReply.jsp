<%@page import="com.invem.board.model.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
%>
<div id="tabs-3">
	<h1>댓글 페이지</h1>
	<h3>회원이 작성한 댓글의 list를 출력할 페이지 입니다.</h3>
	<h5>현재 include한 페이지 myReply.jsp</h5>
	<table table class="table table-hover table-sm">
		<tr>
			<th>번호</th>
			<th>작성댓글</th>
			<th>작성일</th>
		</tr>
		<%
		if(rList != null && !rList.isEmpty()){
			for(int i = 0; i < rList.size(); i++){
				ReplyVO vo = rList.get(i);
			%>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getReply() %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
		<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="/blog/blog.gg#tabs-2?currentPage=<%=pageVo.getFirstPage() - 1 %>">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="/blog/blog.gg#tabs-2?currentPage=<%=i%>"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="/blog/blog.gg#tabs-2?currentPage=<%=i%>"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="/blog/blog.gg#tabs-2?currentPage=<%=pageVo.getLastPage() + 1 %>">Next</a></li>
		<%} %>
		</ul>
	</div>
</div>
