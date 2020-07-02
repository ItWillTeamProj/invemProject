<%@page import="com.invem.admincommon.model.AdminPagingVO"%>
<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	String code = request.getParameter("code");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	AdminBoardService adminBoardService = new AdminBoardService();
	List<AdminBoardDTO> list = null;
	
	try{
		list = adminBoardService.selectAll(code, condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	*/
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	List<AdminBoardDTO> list = (List<AdminBoardDTO>)request.getAttribute("list");
	String code = (String)request.getAttribute("code");
	String condition = (String)request.getAttribute("condition");
	String keyword = (String)request.getAttribute("keyword");
	
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null 
		&& !request.getParameter("currentPage").isEmpty()){
		currentPage
		=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize = 5; //한 페이지에 보여줄 레코드 개수
	int blockSize = 10; //블럭 사이즈 1~10, 11~20 => 10
	int totalRecord = list.size(); //전체 레코드 개수, 예)17
	
	
	AdminPagingVO pageVo = new AdminPagingVO(currentPage, totalRecord, pageSize, blockSize);		
	/*
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);
	//=> 전체 페이지 개수
	//현재 페이지를 이용하는 변수
	int firstPage = currentPage-(currentPage-1)%blockSize;
	//=> 블럭의 시작 페이지 1,11,21..
	int lastPage = firstPage+(blockSize-1); //10,20,30...
	//=> 블럭의 마지막 페이지 10, 20, 30...
	int curPos = (currentPage-1)*pageSize;
	//=> ArrayList에서의 시작 인덱스 0,5,10,... currentPosition (현재위치)
	int num=totalRecord - curPos;
	//=> 페이지당 글 리스트 시작번호 17, 12, 7, 2	
	*/
%>        
    
<%@ include file="../inc/top.jsp" %>  
	<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header2.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리 <%if(code.equals("F")){ %>
						- 자유게시판 목록
					  <%}else if(code.equals("E")){%>
						- 기타게시판 목록
					  <%}else if(code.equals("A")){%>
						- 공지사항 목록
					  <%} %>
			
			</b>
		</div>
	</div>
	
	<%if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
	<%}else{ 
		keyword="";
	} %>
	
	
	<div>
	<table class="boardBox"
		style="border-top :1px solid gray; border-bottom: 1px solid gray;
			font-size: 100%; border-collapse: collapse; margin-left: 10px; margin-right: 10px">
		<colgroup>
			<col style="width:80px;" />
			<col style="width:120px;" />
			<col style="width:210px;" />
			<col style="width:130px;" />
			<col style="width:90px;" />
			<col style="width:80px;" />
		</colgroup>
		<thead style="background-color: lightgray; text-align: left;">
		  <tr>
		    <th scope="col">번호</th>
		    <th scope="col">아이디</th>
		    <th scope="col">제목</th>
		    <th scope="col">작성일</th>
		    <th scope="col">조회수</th>
		    <th scope="col">분류</th>
		  </tr>
		</thead>
		<tbody>
			<%if(list==null || list.isEmpty()){ %>
				<tr style="text-align: center;">
					<td colspan="6" >게시물이 존재하지 않습니다.</td>
				</tr>			
			<%}else{
				
		  	int num=pageVo.getNum();
		  	int curPos=pageVo.getCurPos();	
		  	
			for(int i=0;i<pageSize;i++){
				if(num-- < 1) break;	
					
				AdminBoardDTO dto = list.get(curPos++);
			%>
								
					<tr onclick="location.href='<%=request.getContextPath()%>/admin/boardDetail.gg?no=<%=dto.getNo() %>&code=<%=dto.getCat_code()%>'"
						onmouseover="this.style.background='white'" 
						onmouseout="this.style.background='whitesmoke'"
						style="text-align: left; cursor:pointer;">
						<td><%=dto.getNo() %></td>
						<td><%=dto.getUserid() %></td>
						<td><%=dto.getTitle() %></td>					
						<td><%=sdf.format(dto.getRegdate()) %></td>
						<td><%=dto.getViews() %></td>
						<%if(code.equals("F")){%>
						<td>자유게시판</td>
						<%}else if(code.equals("E")){%>
						<td>기타게시판</td>
						<%}else if(code.equals("A")){%>
						<td>공지사항</td>
						<%} %>
						
					</tr>
					
				<%}//for 
			}%>
			  	<!--반복처리 끝  -->
		  </tbody>
	</table>
	</div>
	
	
	<div style="text-align: center; margin-top: 5px;">
		<div style="display: inline-block;">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 ◀ -->
		<ul style="float:left; list-style:none;">
			<%if(pageVo.getFirstPage()>1){ %>
				<a href="<%=request.getContextPath() %>/admin/boardList.gg?currentPage=<%=pageVo.getFirstPage()-1%>&code=<%=code %>">
					<li style="text-align:center; border:1px solid lightgray; margin:3px;
					width: 26px; height: 26px; padding-top: 1px;">
					◀</li><!-- <img src="../images/first.JPG" alt="이전 블럭으로 이동">  -->
				</a>
			<%} %>
		</ul>
		</div>
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<div style="display: inline-block;">
		<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
			if(i > pageVo.getTotalPage()) break;
		%>	<ul style="float:left; list-style:none;">
			<%if(i!=currentPage){%>
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
					<a href="<%=request.getContextPath() %>/admin/boardList.gg?currentPage=<%=i%>&code=<%=code %>" style="color: black;"><%=i %></a>
				</li>
			<%}else{ %>
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; background-color: red; padding-top: 1px;">
					<span style="font-weight:bold; color: white"><%=i %></span>
				</li>
			<%}//if %>
			</ul>					
		<%}//for %>	
		</div>
		
		<!-- 다음 블럭으로 이동 ▶ -->
		<div style="display: inline-block;">
		<ul style="float:right; list-style:none;">
			
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href="<%=request.getContextPath() %>/admin/boardList.gg?currentPage=<%=pageVo.getLastPage()+1%>&code=<%=code %>">
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
				▶</li><!-- <img src="../images/last.JPG" alt="다음 블럭으로 이동"> -->
			</a>
		<%} %>
			
		</ul>
		</div>
		<!--  페이지 번호 끝 -->
	</div>
	
	
	<div class="divSearch" style="text-align: center;">
	   	<form name="frmSearch" method="post" action='<%=request.getContextPath() %>/admin/boardList.gg'>
	        <input type="hidden" name="code" value="<%=code%>">
	        <select name="searchCondition" style="height:24px;">
	            <option value="title" 
	            	<%if("title".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >제목</option>
	            <option value="describe" 
	            	<%if("describe".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >내용</option>
	            <option value="userid" 
	            	<%if("userid".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >아이디</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="<%=keyword%>">   
			<input type="submit" value="검색">
	    </form>
	</div>
	<div style="text-align: center; margin: 10px 10px 10px 10px;">
		<%if(userid=="admin"){%>
		<input type="Button" value="작성" onclick="location.href='<%=request.getContextPath() %>/admin/boardWrite.gg'" />  
		<%}%>
		<input type="Button" value="뒤로" onclick="location.href='<%=request.getContextPath() %>/admin/boardSelect.gg'" />  
	</div>
	
	</article>
<%@ include file="../inc/bottom.jsp" %>