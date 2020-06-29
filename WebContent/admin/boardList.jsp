<%@page import="com.invem.adminboard.model.AdminBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.adminboard.model.AdminBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");

	
	AdminBoardService adminBoardService = new AdminBoardService();
	List<AdminBoardDTO> list = null;
	
	try{
		list = adminBoardService.selectAll(code);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	//list.jsp?currentPage=2
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null 
		&& !request.getParameter("currentPage").isEmpty()){
		currentPage
		=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize = 5; //한 페이지에 보여줄 레코드 개수
	int blockSize = 10; //블럭 사이즈 1~10, 11~20 => 10
	int totalRecord = list.size(); //전체 레코드 개수, 예)17
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
	
%>        
    
<%@ include file="../inc/top.jsp" %>  
	<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>게시판관리</b>
		</div>
	</div>
	
	<%if(code.equals("F")){ %>
		<h3>자유게시판</h3>	
	<%}else if(code.equals("E")){%>
		<h3>기타게시판</h3>	
	<%} %>
	
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="게시판 선택 페이지" onclick="location.href='<%=request.getContextPath() %>/admin/boardSelect.jsp'" />  
	</div>
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
			for(int i=0;i<pageSize;i++){
				if(num-- < 1) break;	
					
				AdminBoardDTO dto = list.get(curPos++);
			%>
					<tr style="text-align: left;">
						<td><%=dto.getNo() %></td>
						<td><%=dto.getUserid() %></td>
						<td><a href="boardDetail.jsp?no=<%=dto.getNo() %>&code=<%=dto.getCat_code()%>"><%=dto.getTitle() %></a></td>					
						<td><%=sdf.format(dto.getRegdate()) %></td>
						<td><%=dto.getViews() %></td>
						<%if(code.equals("F")){%>
						<td>자유게시판</td>
						<%}else if(code.equals("E")){%>
						<td>기타게시판</td>
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
			<%if(firstPage>1){ %>
				<a href="boardList.jsp?currentPage=<%=firstPage-1%>&code=<%=code %>">
					<li style="text-align:center; border:1px solid lightgray; margin:3px;
					width: 26px; height: 26px; padding-top: 1px;">
					◀</li><!-- <img src="../images/first.JPG" alt="이전 블럭으로 이동">  -->
				</a>
			<%} %>
		</ul>
		</div>
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<div style="display: inline-block;">
		<%for(int i=firstPage;i<=lastPage;i++){ 
			if(i > totalPage) break;
		%>	<ul style="float:left; list-style:none;">
			<%if(i!=currentPage){%>
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
					<a href="boardList.jsp?currentPage=<%=i%>&code=<%=code %>" style="color: black;"><%=i %></a>
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
			
		<%if(lastPage < totalPage){ %>
			<a href="boardList.jsp?currentPage=<%=lastPage+1%>&code=<%=code %>">
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
				▶</li><!-- <img src="../images/last.JPG" alt="다음 블럭으로 이동"> -->
			</a>
		<%} %>
			
		</ul>
		</div>
		<!--  페이지 번호 끝 -->
	</div>
	</article>
<%@ include file="../inc/bottom.jsp" %>