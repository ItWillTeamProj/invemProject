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

<%
	String condition = (String)request.getAttribute("condition");
	String keyword = (String)request.getAttribute("keyword");


	List <BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	PagingVO pageVo = (PagingVO)request.getAttribute("pageVo");
	String code = (String)request.getParameter("code");
	
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
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?rowNum="+pageRow;
	});
	
	$('#all').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg";
	});

$('#toBlog').click(function(){
	var sId = $('#uId').html();
	$('#blogId').html(sId);
	window.open('<%=request.getContextPath()%>/blog/blog.gg?userid='+sId, 'viewer', 'width=1000, height=700');
});
});



function postPopUp(formName) {
	var check=document.form2;
	frm = document.getElementById(formName);
	window.open('<%=request.getContextPath()%>/blog/blog.gg', 'viewer', 'width=1000, height=700');
	frm.action = "<%=request.getContextPath()%>/blog/blog.gg";
	frm.target = "form";
	frm.method = "post";
	frm.submit();
}
</script>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<article>
	<%
	String boardName = "";
	switch(code){
		case "F":
		boardName = "자유게시판";
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
		<input type = "button" value = "전체글" id = "all"><input type = "button" value = "인기글" id = "best" ><input type = "button" value = "공지" id = "notice">
		<span style = "float: right"><a href = "<%=request.getContextPath()%>/board/boardWrite.gg"><img src="<%=request.getContextPath()%>/images/writeIcon.png" style="width: 20px; height: auto"></a></span><!-- 추후 아이콘으로 대체 예정 -->
		<select style = "float: right; margin-right: 10px" id = "rowNum">
			<option value = "10">10개</option>
			<option value = "20">20개</option>
			<option value = "50">50개</option>
		</select>
	</div><br>

	<table style = "width: 700px" class="table table-hover table-sm">
		<!-- caption걸어주는게 좋다고 들음 -->
		<caption><%=boardName %> 목록입니다.</caption>
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
			<th>제목</th>
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
						<td><a href = "<%=request.getContextPath() %>/board/detail.gg?nonuserid=<%=vo.getNonuserid()%>&pwd=<%=vo.getPwd()%>
							&ipaddress=<%=vo.getIpaddress()%>&no=<%=vo.getNo() %>&code=<%=code%>"><%=vo.getTitle() %>
							<%if(boardServ.checkRegdate(vo.getNo())==1){ %>
								<span class="badge badge-pill badge-primary">new</span>
							<%} %>
						</a></td>
						<td style = "text-align: center"><%=vo.getNonuserid() %></td>
				<%}else{ %>
				<!-- userid가 있으면 userid만 detail로 보낸다. -->
						<td><a href = "<%=request.getContextPath() %>/board/detail.gg?no=<%=vo.getNo()%>&userid=<%=vo.getUserid()%>&code=<%=code%>"><%=vo.getTitle() %>
						<!-- 24시간 이내 작성글인경우 new띄우기 -->
						<%if(boardServ.checkRegdate(vo.getNo())==1){ %>
						<span class="badge badge-pill badge-primary">new</span>
						<%} %>
						</a></td>
						<td style = "text-align: center"><a href = "#" class = "aSelect" id = "uId"><%=vo.getUserid() %></a></td>
				<%}%>
						<td style = "text-align: center;"><%=sdf.format(vo.getRegdate()) %></td>
						<td style = "text-align: center;"><%=vo.getViews() %></td>
						<td style = "text-align: center;"><%=vo.getRecommend() %></td>
					</tr>
			<%}
			

			}%>
	</table><hr style = "border: 0; height: 2px; background: skyblue">
	
	
	<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<%if(pageVo.getFirstPage() > 1){ %>
			 <li class="previous"><a href="<%=request.getContextPath()%>/board/boardList.gg?currentPage=<%=pageVo.getFirstPage() - 1 %>&code=<%=code%>">Previous</a></li>
		<%} %>
	
		<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
			if(i > pageVo.getTotalPage()) break;
		%>
			<%if(i != pageVo.getCurrentPage()){ %>
			<li><a href="<%=request.getContextPath() %>/board/boardList.gg?currentPage=<%=i%>&code=<%=code%>"><%=i %></a></li>
			
		<%}else{ %>
			<li class="active"><a href="<%=request.getContextPath() %>/board/boardList.gg?currentPage=<%=i%>&code=<%=code%>"><%=i %></a></li>
			<%}//if %>
		<%}//for %>
	
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<li class="next"><a href="<%=request.getContextPath()%>/board/boardList.gg?currentPage=<%=pageVo.getLastPage() + 1 %>&code=<%=code%>">Next</a></li>
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
            	<%if("name".equals(condition)){%>
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

    </form>
    
<form name="form2" method="post">
테스트값1&nbsp;<input type="text" name="test1" id = "blogId" ><br>
테스트값2&nbsp;<input type="text" name="test2" value="aa"><br><br>

</form>
 <div id="divLangSelect" style="background: #fff0">
<ul id="menu">
  <li><div id = "toBlog">블로그 가기</div></li>
  <li><div>작성글, 댓글보기</div></li>
  <li><div>댓글 삭제</div></li>
</ul>
</div>   
</article>

<script type ="text/javascript" src = "../js/bootstrap/bootstrap.js"></script> 


<%@ include file = "../inc/bottom.jsp"%>
