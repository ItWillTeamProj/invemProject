<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp"%>

</style>

<%
	String condition = (String)request.getAttribute("condition");
	String keyword = (String)request.getAttribute("keyword");
	String sort = (String)request.getAttribute("sort");
	String isNotice = (String)request.getAttribute("isNotice");
	List <BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	PagingVO pageVo = (PagingVO)request.getAttribute("pageVo");
	String code = (String)request.getParameter("code");
	String rowNum = request.getParameter("rowNum");
	if(rowNum == null || rowNum.isEmpty()){
		rowNum = "10";
	}
	
	if(!"N".equals(sort) && !"B".equals(sort)){
		sort = "N";
	}
	
	
	
	int num = pageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int curPos = pageVo.getCurPos();	//페이지당 시작 인덱스 번호
	BoardService boardServ = new BoardService();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">
$(function(){
	$('#rowNum').change(function(){
		var pageRow = $('#rowNum option:selected').val();
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?rowNum="+pageRow+"&code="+"<%=code%>";
	});
	
	$('#newest').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>&sort=N";
	});
	$('#best').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>&sort=B";
	});

	$('#notice').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>&isNotice=Y";
	});
	
	$('#toBlog').click(function(){
		var sId = $('#uId').html();
		$('#blogId').val(sId);
		window.open('<%=request.getContextPath()%>/blog/blog.gg?sId='+sId, 'viewer', 'width=780, height=580, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=500, top=200');
		
	
	});
	
	$('#toList').click(function(){
		var sId = $('#uId').html();
		location.href = '<%=request.getContextPath()%>/board/boardList.gg?code=F&searchCondition=userid&searchKeyword='+sId;
	});
	
});




</script>

<article>
	<%
	String boardName = "";
	switch(code){
		case "F":
			boardName = "자유게시판";
			break;
		case "E":
			boardName = "기타게시판";
			break;
		case "T":
			boardName = "Top 게시판";
			break;
		case "M":
			boardName = "Mid 게시판";
			break;	
		case "J":
			boardName = "Jungle 게시판";
			break;
		case "B":
			boardName = "Bot 게시판";
			break;
		case "S":
			boardName = "Support 게시판";
			break;
		case "P":
			boardName = "챔피언 공략 게시판";
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
	
	<div style = "margin: 10px 10px 10px 10px;">
		<input type = "button" value = "최신순" id = "newest">
		<input type = "button" value = "인기글" id = "best" style="margin-left: 3px;">
		<input type = "button" value = "공지" id = "notice" style="margin-left: 3px;">
		<span style = "float: right"><a href = "<%=request.getContextPath()%>/board/boardWrite.gg?code=<%=code%>"><img src="<%=request.getContextPath()%>/images/writeIcon.png" style="width: 20px; height: auto"></a></span><!-- 추후 아이콘으로 대체 예정 -->
		<select style = "float: right; margin-right: 10px" id = "rowNum">
			<option value = "10" <%if(rowNum.equals("10")){ %>
			selected="selected"<%} %>>10개</option>
			<option value = "20" <%if(rowNum.equals("20")){ %>
			selected="selected"<%} %>>20개</option>
			<option value = "50" <%if(rowNum.equals("50")){ %>
			selected="selected"<%} %>>50개</option>
		</select>
	</div><br>
	<div style="margin-left:10px;">
	<table style = "width: 700px" class="table table-striped table-sm table-hover">
		<colgroup>
			<col style = "width: 8%">
			<col style = "width: 43%">
			<col style = "width: 18%">
			<col style = "width: 17%">
			<col style = "width: 7%">
			<col style = "width: 7%">
		</colgroup>
		<tr>
			<th style = "text-align: center">번호</th>
			<th style = "text-align: center">제목</th>
			<th style = "text-align: center">작성자</th>
			<th style = "text-align: center">작성일</th>
			<th style = "text-align: center">조회</th>
			<th style = "text-align: center">추천</th>
		</tr>
		<%
		if(list == null || list.isEmpty()){%>
			<tr>
				<td colspan="6">게시물이 없습니다.</td>
			</tr>
		<%}else{
			for(int i = 0; i < pageVo.getPageSize(); i++){
				if(num -- < 1)	break;

				BoardVO vo = list.get(curPos++);%>

					<tr>
						<td style = "text-align: center"><%=num + 1 %></td>
				<!-- userid가 null이면 nonuserid 비밀번호 ip주소 를 detail로 보낸다. -->
				<%if(vo.getUserid() == null || vo.getUserid().isEmpty() || "unknown".equals(vo.getUserid())){%>
						<td><a href = "<%=request.getContextPath() %>/board/countUpdate.gg?nonuserid=<%=vo.getNonuserid()%>&ipaddress=<%=vo.getIpaddress()%>&no=<%=vo.getNo() %>&code=<%=code%>&delflag=<%=vo.getDelflag() %>">
						<%if(vo.getDelflag().equals("N")) {%>
						<%=vo.getTitle() %>
						<%}else if(vo.getDelflag().equals("Y")){ %>
						삭제된 게시물 입니다.
						<%} %>
							<!-- 24시간 이내 작성글인경우 new띄우기 -->
							<%if(boardServ.checkRegdate(vo.getNo())==1){ %>
								<span class="badge badge-primary">new</span>
							<%} %>
						</a></td>
						<td style = "text-align: center"><%=vo.getNonuserid() %></td>
				<%}else{ %>
				
				<!-- userid가 있으면 userid만 detail로 보낸다. -->
						<td><a href = "<%=request.getContextPath() %>/board/countUpdate.gg?no=<%=vo.getNo()%>&userid=<%=vo.getUserid()%>&code=<%=code%>&delflag=<%=vo.getDelflag() %>">
						<%if(vo.getDelflag().equals("N")) {%>
						<%=vo.getTitle() %>
						<%}else if(vo.getDelflag().equals("Y")){ %>
						삭제된 게시물 입니다.
						<%} %>
							<!-- 24시간 이내 작성글인경우 new띄우기 -->
							<%if(boardServ.checkRegdate(vo.getNo())==1){ %>
							<span class="badge badge-primary">new</span>
							<%} %>
						</a></td>
						<td style = "text-align: center"><a href = "#" class = "aSelect" ><%=vo.getUserid() %></a></td>
				<%}%>
						<td style = "text-align: center;"><%=sdf.format(vo.getRegdate()) %></td>
						<td style = "text-align: center;"><%=vo.getViews() %></td>
						<td style = "text-align: center;"><%=vo.getRecommend() %></td>
					</tr>
			<%}
			

			}%>
	</table><hr style = "border: 0; height: 2px; background: skyblue">
	</div>
	
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){	%>
			
			 <li class="previous"><a href="<%=request.getContextPath()%>/board/boardList.gg?currentPage=<%=pageVo.getFirstPage() - 1 %>&code=<%=code%>&rowNum=<%=rowNum%>&sort=<%=sort%>
			 <%if("Y".equals(isNotice)){%>
			 	&isNotice=Y
			 	<%}%>
			 ">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/board/boardList.gg?
			currentPage=<%=i%>&code=<%=code%>&rowNum=<%=rowNum%>&sort=<%=sort%>
			<%if("Y".equals(isNotice)){%>
			 	&isNotice=Y
			 	<%}%>
			"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="<%=request.getContextPath() %>/board/boardList.gg?
			currentPage=<%=i%>&code=<%=code%>&rowNum=<%=rowNum%>&sort=<%=sort%>
			<%if("Y".equals(isNotice)){%>
			 	&isNotice=Y
			 	<%}%>
			"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath()%>/board/boardList.gg?
			currentPage=<%=pageVo.getLastPage() + 1 %>&code=<%=code%>&rowNum=<%=rowNum%>&sort=<%=sort%>
			<%if("Y".equals(isNotice)){%>
			 	&isNotice=Y
			 	<%}%>
			">Next</a></li>
		<%} %>
		</ul>
	</div>
	<form name="frmSearch" method="post" action='<%=request.getContextPath() %>/board/boardList.gg' style = "text-align: center;">
        <select name="searchCondition">
            <option value="title"
            	<%if("title".equals(condition)){%>
            		selected = "selected"
            	<%} %>
            	>제목</option>
            	
            <option value="describe"
            	<%if("content".equals(condition)){%>
            		selected = "selected"
            	<%} %>
            >내용</option>
            <option value="userid"
            	<%if("userid".equals(condition)){%>
            		selected = "selected"
            	<%} %>
            >작성자</option>
        </select>
        <!-- 검색 창에 아무것도 없을때 null표시되는것을 없애기 위함 -->
		<%if(keyword == null || keyword.isEmpty()){
			keyword = "";
		}
		%>
		
        <input type="text" name="searchKeyword" title="검색어 입력" value = "<%=keyword%>">
		<input type="submit" value="검색">
		<input type="hidden" name = "code"value="<%=code %>">
    </form>
    
 <div id="divLangSelect" style="background: #fff0">
<ul id="menu">
  <li><div id = "toBlog">블로그 가기</div><div id="uId" style="display: none;"></div></li>
   <li><div><a href="#" id="toList">작성글 보기</a></div></li>
</ul>
</div>   
</article>



<%@ include file = "../inc/bottom.jsp"%>
