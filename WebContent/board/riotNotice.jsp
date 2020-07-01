<%@page import="com.invem.common.Message"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp"%>

<%
	

	List <Message> list = (List<Message>)request.getAttribute("messages");
	PagingVO pageVo = (PagingVO)request.getAttribute("pageVo");
	String code = (String)request.getParameter("code");
	String rowNum = request.getParameter("rowNum");
	if(rowNum == null || rowNum.isEmpty()){
		rowNum = "10";
	}
	
	
	int num = pageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int curPos = pageVo.getCurPos();	//페이지당 시작 인덱스 번호

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">
$(function(){
	$('#rowNum').change(function(){
		var pageRow = $('#rowNum option:selected').val();
		location.href = "<%=request.getContextPath()%>/board/riotNotice.gg?rowNum="+pageRow+"&code="+"<%=code%>";
	});
	
	$('#all').click(function(){
		location.href = "<%=request.getContextPath()%>/board/riotNotice.gg?code=<%=code%>";
	});
	
});




</script>

<article>
	<%
	String boardName = "";
	switch(code){
		case "R":
		boardName = "LOL 공지사항";
		break;
		default:%>
		<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href = "<%=request.getContextPath()%>/index.jsp";
		</script>
		<%break;
	}
	%>
	<div class="title">
		<h2><%=boardName %></h2>
	</div>
	
	<div style = "margin-right: 20px;">
		<input type = "button" value = "전체글" id = "all"><input type = "button" value = "인기글" id = "best" >
		<input type = "button" value = "공지" id = "notice">
		<span style = "float: right"><a href = "<%=request.getContextPath()%>/board/riotNotice.gg?code=<%=code%>">
			<img src="<%=request.getContextPath()%>/images/writeIcon.png" style="width: 20px; height: auto"></a>
		</span><!-- 추후 아이콘으로 대체 예정 -->
		<select style = "float: right; margin-right: 10px" id = "rowNum">
			<option value = "10" <%if(rowNum.equals("10")){ %>
			selected="selected"<%} %>>10개</option>
			<option value = "20" <%if(rowNum.equals("20")){ %>
			selected="selected"<%} %>>20개</option>
			<option value = "50" <%if(rowNum.equals("50")){ %>
			selected="selected"<%} %>>50개</option>
		</select>
	</div><br>

	<table style = "width: 700px" class="table table-striped table-sm table-hover">
		<!-- caption걸어주는게 좋다고 들음 -->
		<caption><%=boardName %> 목록입니다.</caption>
		<colgroup>
			<col style = "width: 10%">
			<col style = "width: 60%">
			<col style = "width: 30%">
		</colgroup>
		<tr>
			<th style = "text-align: center">번호</th>
			<th style = "text-align: center">제목</th>
			<th style = "text-align: center">업데이트 날짜</th>
		</tr>
		<%
		if(list == null || list.isEmpty()){%>
			<tr>
				<td colspan="6">게시물이 없습니다.</td>
			</tr>
		<%}else{
			for(int i = 0; i < pageVo.getPageSize(); i++){
				if(num -- < 1)	break;

				Message msg = list.get(curPos++);%>

					<tr>
						<td><%=num + 1 %></td>
						<td><a href="<%=%>"><%=msg.getHeading() %></a></td>
						<td><%=msg.getUpdated_at().substring(0, msg.getUpdated_at().indexOf("T")) %></td>
					</tr>
			<%}
			

			}%>
	</table><hr style = "border: 0; height: 2px; background: skyblue">
	
	
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="<%=request.getContextPath()%>/board/riotNotice.gg?currentPage=<%=pageVo.getFirstPage() - 1 %>&code=<%=code%>&rowNum=<%=rowNum%>">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/board/riotNotice.gg?currentPage=<%=i%>&code=<%=code%>&rowNum=<%=rowNum%>"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="<%=request.getContextPath() %>/board/riotNotice.gg?currentPage=<%=i%>&code=<%=code%>&rowNum=<%=rowNum%>"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath()%>/board/riotNotice.gg?currentPage=<%=pageVo.getLastPage() + 1 %>&code=<%=code%>&rowNum=<%=rowNum%>">Next</a></li>
		<%} %>
		</ul>
	</div>
    
</article>



<%@ include file = "../inc/bottom.jsp"%>
