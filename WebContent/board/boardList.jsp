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
	String code = (String)request.getAttribute("code");
	
	int num = pageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int curPos = pageVo.getCurPos();	//페이지당 시작 인덱스 번호
	BoardService boardServ = new BoardService();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript" src = "jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#rowNum').change(function(){
		var pageRow = $('#rowNum option:selected').val();
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?rowNum=" + pageRow;
	});
	
	$('#all').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg";
	});
	

	
});

$('#toblog').click(function(){
	var sId = (this).html();
	$('#blogId').html(sId);
});


function postPopUp(formName) {
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
	<h3><%=boardName %></h3>

	
	<div style = "margin-right: 20px">
		<input type = "button" value = "전체글" id = "all"><input type = "button" value = "인기글" id = "best" ><input type = "button" value = "공지" id = "notice">
		<span style = "float: right"><a href = "<%=request.getContextPath()%>/board/boardWrite.gg">글쓰기</a></span><!-- 추후 아이콘으로 대체 예정 -->
		<select style = "float: right" id = "rowNum">
			<option value = "10">10개</option>
			<option value = "20">20개</option>
			<option value = "50">50개</option>
		</select>
	</div><hr style = "border: 0; height: 2px; background: skyblue">

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
				<%if(vo.getUserid() == null || vo.getUserid().isEmpty() || vo.getUserid().equals("unknown")){%>
						<td><a href = "<%=request.getContextPath() %>/board/detail.gg?nonuserid=<%=vo.getNonuserid()%>&pwd=<%=vo.getPwd()%>
							&ipaddress=<%=vo.getIpaddress()%>&no=<%=vo.getNo() %>"><%=vo.getTitle() %></a></td>
						<td style = "text-align: center"><%=vo.getNonuserid() %></td>
				<%}else{ %>
				<!-- userid가 있으면 userid만 detail로 보낸다. -->
						<td><a href = "<%=request.getContextPath() %>/board/detail.gg?no=<%=vo.getNo()%>&userid=<%=vo.getUserid()%>"><%=vo.getTitle() %>
						<!-- 24시간 이내 작성글인경우 new띄우기 -->
						<%if(boardServ.checkRegdate(vo.getNo())==1){ %>
						<span class="badge badge-primary">new</span>
						<%} %>
						</a></td>
						<td style = "text-align: center"><a href = "#" onclick="javascript:postPopUp('this.form');" id = "toBlog"><%=vo.getUserid() %></a></td>
				<%}%>
						<td style = "text-align: center;"><%=sdf.format(vo.getRegdate()) %></td>
						<td style = "text-align: center;"><%=vo.getViews() %></td>
						<td style = "text-align: center;"><%=vo.getRecommend() %></td>
					</tr>
			<%}


			}%>
	</table><hr style = "border: 0; height: 2px; background: skyblue">
	<div style = "text-align: center">
	<%if(pageVo.getFirstPage() > 1){ %>
		<a href = "<%=request.getContextPath()%>/board/boardList.gg?currentPage=<%=pageVo.getFirstPage() - 1 %>">
		<img src = "../images/first.JPG" alt = "이전 블럭으로 이동">
		</a>
	<%} %>

	<%for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
		if(i > pageVo.getTotalPage()) break;
	%>
		<%if(i != pageVo.getCurrentPage()){ %>
		<a href ="<%=request.getContextPath() %>/board/boardList.gg?currentPage=<%=i%>">[<%=i %>]</a>
	<%}else{ %>
		<span style = "color: blue;font-weight: bold"><%=i %></span>
		<%}//if %>
	<%}//for %>

	<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
		<a href = "<%=request.getContextPath()%>/board/boardList.gg?currentPage=<%=pageVo.getLastPage() + 1 %>">
		<img src = "../images/last.JPG" alt = "다음 블럭으로 이동">
		</a>
	<%} %>
	</div>
	<form name="frmSearch" method="post" action='<%=request.getContextPath() %>/board/boardList.gg' style = "text-align: center;">
        <select name="searchCondition">
            <option value="title"
            	<%if("title".equals(condition)){%>
            		selected = "selected"
            	<%} %>
            	>제목</option>
            	}
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
    
<form name="form">
테스트값1&nbsp;<input type="text" name="test1" id = "blogId" ><br>
테스트값2&nbsp;<input type="text" name="test2" value="aa"><br><br>

</form>
    
</article>

<script type ="text/javascript" src = "../js/bootstrap/bootstrap.js"></script> 


<%@ include file = "../inc/bottom.jsp"%>
