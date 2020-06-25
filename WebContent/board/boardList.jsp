<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.common.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp"%>
<jsp:useBean id="boardServ" class="com.invem.board.model.BoardService" scope="session"></jsp:useBean>

<%
	//메인화면에서 게시판 이름 클릭시 get방식으로 넘어옴(userid와, 게시판 카테고리 함께 넘길것)
	//검색을 눌렀을때 post로 submit
	//글작성 완료시 get방식으로 넘어옴(userid와, 게시판 카테고리 합께 넘길것)
	request.setCharacterEncoding("utf-8");

	//코드를 받아와서 게시판의 이름을 적는다 일단 페이지 확인때문에 code임의로 F로 넣음
	String code = request.getParameter("code");
	code = "F";

	//검색 버튼을 눌렀을때 option의 이름과 검색어를 받아온다.
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");

	//db작업
	List <BoardVO> list = new ArrayList<BoardVO>();

	try{
		list = boardServ.searchall(keyword, condition, code);
	}catch(SQLException e){
		e.printStackTrace();
	}

	//페이징 처리
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

	int num = pageVo.getNum();	//페이지당 시작 글 번호가 될수도 있지만 게시판별로
	// 나눴을때 num + 1 로 no를 대체할 수 있다.
	int curPos = pageVo.getCurPos();	//페이지당 시작 인덱스 번호
	int totalPage = pageVo.getTotalPage();	//총 페이지 수
	int firstPage = pageVo.getFirstPage();	//각 페이지 블럭의 시작 페이지
	int lastPage = pageVo.getLastPage();	//각 페이지 블럭의 마지막 페이지

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(pageSize);
%>
<script type="text/javascript" src = "jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#rowNum').change(function(){
		var pageRow = $('#rowNum option:selected').val();
		location.href = "boardList.jsp?rowNum=" + pageRow;
	});
	
	$('#all').click(function(){
		location.href = "boardList.jsp";
	});
	

	
});

function popup(frm)
{
  var url    ="blog.jsp";
  var title  = "testpop";
  var status = "toolbar=yes,directories=no,scrollbars=yes,resizable=yes,status=no,menubar=yes,width=600, height=400, top=0,left=20";
  window.open("blog.jsp", title,status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
                                            //인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
                                            //가능합니다.
  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다.
  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
  frm.method = "post";
  frm.submit();    
  }

</script>
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
			location.href = "../index.jsp";
		</script>
		<%break;
	}
	%>
	<h3><%=boardName %></h3>

	
	<div style = "margin-right: 20px">
		<input type = "button" value = "전체글" id = "all"><input type = "button" value = "인기글" id = "best" ><input type = "button" value = "공지" id = "notice">
		<span style = "float: right"><a href = "writeTest.jsp">글쓰기</a></span><!-- 추후 아이콘으로 대체 예정 -->
		<select style = "float: right" id = "rowNum">
			<option value = "10">10개</option>
			<option value = "20">20개</option>
			<option value = "50">50개</option>
		</select>
	</div><hr style = "border: 0; height: 2px; background: skyblue">

	<table style = "width: 700px">
		<!-- caption걸어주는게 좋다고 들었는데 병신같이 나옴 -->
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
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
		</tr>
		<%
		if(list == null || list.isEmpty()){%>
			<tr>
				<td colspan="6">게시물이 없습니다.</td>
			</tr>
		<%}else{
			for(int i = 0; i < pageSize; i++){
				if(num -- < 1)	break;

				BoardVO vo = list.get(curPos++);%>

					<tr>
						<td style = "text-align: center"><%=num + 1 %></td>
				<!-- userid가 null이면 nonuserid 비밀번호 ip주소 를 detail로 보낸다. -->
				<%if(vo.getUserid() == null || vo.getUserid().isEmpty() || vo.getUserid().equals("unknown")){%>
						<td><a href = "countUpdate.jsp?nonuserid=<%=vo.getNonuserid()%>&pwd=<%=vo.getPwd()%>
							&ipaddress=<%=vo.getIpaddress()%>&no=<%=vo.getNo() %>"><%=vo.getTitle() %></a></td>
						<td style = "text-align: center"><%=vo.getNonuserid() %></td>
				<%}else{ %>
				<!-- userid가 있으면 userid만 detail로 보낸다. -->
						<td><a href = "countUpdate.jsp?no=<%=vo.getNo()%>&userid=<%=vo.getUserid()%>"><%=vo.getTitle() %></a></td>
						<td style = "text-align: center"><a href = "#" onclick="javascript:popup(this.form);"><%=vo.getUserid() %></a></td>
				<%}%>
						<td style = "text-align: center;"><%=sdf.format(vo.getRegdate()) %></td>
						<td style = "text-align: center;"><%=vo.getViews() %></td>
						<td style = "text-align: center;"><%=vo.getRecommend() %></td>
					</tr>
			<%}


			}%>
	</table><hr style = "border: 0; height: 2px; background: skyblue">
	<div style = "text-align: center">
	<%if(firstPage > 1){ %>
		<a href = "boardList.jsp?currentPage=<%=firstPage - 1 %>">
		<img src = "../images/first.JPG" alt = "이전 블럭으로 이동">
		</a>
	<%} %>

	<%for(int i = firstPage; i <= lastPage; i++){
		if(i > totalPage) break;
	%>
		<%if(i != currentPage){ %>
		<a href ="boardList.jsp?currentPage=<%=i%>">[<%=i %>]</a>
	<%}else{ %>
		<span style = "color: blue;font-weight: bold"><%=i %></span>
		<%}//if %>
	<%}//for %>

	<%if(lastPage < totalPage){ %>
		<a href = "boardList.jsp?currentPage=<%=lastPage + 1 %>">
		<img src = "../images/last.JPG" alt = "다음 블럭으로 이동">
		</a>
	<%} %>
	</div>
	<form name="frmSearch" method="post" action='boardList.jsp' style = "text-align: center;">
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
테스트값1&nbsp;<input type="text" name="test1" value=""><br>
테스트값2&nbsp;<input type="text" name="test2" value=""><br><br>

</form>
    
</article>




<%@ include file = "../inc/bottom.jsp"%>
