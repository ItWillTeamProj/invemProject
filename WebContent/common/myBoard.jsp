<%@page import="com.invem.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	PagingVO pageVo = (PagingVO)request.getAttribute("pageVo");
	int bNum = pageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int bCurPos = pageVo.getCurPos();	//페이지당 시작 인덱스 번호
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>
<div id="tabs-2">
	<div style="margin-top: 10px; width: 100%; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px; 
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>작성글 모음</b>
		</div>
	</div>
	<table table class="table table-hover table-sm">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<%
		if(list != null && !list.isEmpty()){
			for(int i = 0; i < pageVo.getPageSize(); i++){
				if(bNum -- < 1)	break;

				BoardVO vo = list.get(bCurPos++);%>
			<tr>
				<td><%=bNum+1 %></td>
				<td><%=vo.getTitle() %></td>
				<td><%=Utility.cutString(vo.getDescribe(), 30) %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
	</table>
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=pageVo.getFirstPage() - 1 %>#tabs-2">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-2"><%=i %></a></li>
			
		<%}else{ %>	
			<li class="active"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-2"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=pageVo.getLastPage() + 1 %>#tabs-2">Next</a></li>
		<%} %>
		</ul>
	</div>
	
</div>
