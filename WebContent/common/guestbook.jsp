<%@page import="com.invem.common.Utility"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.board.model.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<GuestbookVO> gList = (List<GuestbookVO>)request.getAttribute("gList");
	PagingVO gPageVo = (PagingVO)request.getAttribute("gPageVo");
	
	int gNum = gPageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int gCurPos = gPageVo.getCurPos();	//페이지당 시작 인덱스 번호
	

%>


 <div id="tabs-4">
	<div style="margin-top: 10px; width: 100%; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px; 
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>방명록을 남겨주세요</b>
		</div>
	</div>
	<form name="frmReply" action="<%=request.getContextPath() %>/guestbook/guestbookInsert.gg" method="post" 
		style="overflow: hidden;">
	<div>
	<c:if test="${empty userid }">
		<span style = "float: left; width: 15%">
			<input type = "text" name = "nonuserid" size = "15" style = "margin-left: 5px; margin-top: 5px" value="닉네임"
				onfocus="this.value=''">
			<input type = "text" name = "pwd" size = "15" style = "margin-left: 5px; margin-top: 5px" value="비밀번호"
				onfocus="this.value=''; type = 'password'"> 
		</span>
	</c:if>
	<c:if test="${!empty userid }">
		<span style = "float: left; width: 15%">${userid }</span>
		<input type = "hidden" name = "userid" value = "${userid }">
	</c:if>
		<span style = "float: left; width: 60%; margin-left: 20px">
			<textarea name = "reply" rows="5" cols="60" style = "margin-left: 30px"></textarea>
		</span>
		<input type = "hidden" name = "blogId" value = "<%=blogId%>">
		<span><input type = "submit" value = "등록" 
			style = "width: 100px; height: 30px; float: right; margin-right: 10px">
		<input type = "button" id = "list" value ="목록으로"
		style = "width: 100px; height: 30px; float: right; margin-right: 10px"></span>
	</div>
	</form>
	
	<table table class="table table-hover table-sm">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<%
		if(gList != null && !gList.isEmpty()){
			for(int i = 0; i < gPageVo.getPageSize(); i++){
				if(gNum -- < 1)	break;

				GuestbookVO gVo = gList.get(gCurPos++);%>
			<tr>
				<td><%=gNum+1 %></td>
				<td><%=gVo.getWriter_id() %></td>
				<td><%=Utility.cutString(gVo.getG_comment(), 30) %></td>
				<td><%=gVo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
	</table>
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(gPageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=gPageVo.getFirstPage() - 1 %>#tabs-4">Previous</a></li>
		<%} %>
	
		<%for(int i = gPageVo.getFirstPage(); i <= gPageVo.getLastPage(); i++){
			if(i > gPageVo.getTotalPage()) break;
		%>
			<%if(i != gPageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-4"><%=i %></a></li>
			
		<%}else{ %>	
			<li class="active"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=i%>#tabs-4"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(gPageVo.getLastPage() < gPageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath() %>/blog/blog.gg?sId=${param.userid}&currentPage=<%=gPageVo.getLastPage() + 1 %>#tabs-4">Next</a></li>
		<%} %>
		</ul>
	</div>
	
</div>