<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#divMainNotice{
		width: 310px;
	}
	#divMainNotice div span:first-of-type{
		padding: 0 0 0 160px;
	}
	#divMainNotice div:nth-of-type(2) img {
		width: 310px;
		height: 5px;
	} 
	#divMainNotice div:nth-of-type(3) ul{
		list-style-type: none;		
		margin: 8px 0 0 0;
		padding: 0;
		font-size:0.9em;
	}
	#divMainNotice div:nth-of-type(3) ul li{
		padding: 3px 0 3px 1px;		
	}
</style>
<jsp:useBean id="boardService" class="com.invem.board.model.BoardService" 
	scope="session"></jsp:useBean> 
<%
	//1	
	//2
	List<BoardVO> list=null;

	try{
		list=boardService.selectMainNotice();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	
%>
<div id="divMainNotice">
	<div>
		<img src="<%=request.getContextPath() %>/images/notice2.JPG" 
			alt="공지사항">
		<span>
			<a href="">
				<img src="<%=request.getContextPath() %>/images/more.JPG" 
					alt="more">
			</a>
		</span>
	</div>	
	<div>
		<img src="<%=request.getContextPath() %>/images/Line.JPG" 
			alt="line">
	</div>
	<div>
		<ul>
			<%if(list==null || list.isEmpty()){ %>
				<li>공지사항이 없습니다.</li>
			<%}else{ %>
				<!-- 반복 시작 -->
				<%for(BoardVO vo : list){ %>
					<li>
						<img src="<%=request.getContextPath() %>/images/last.JPG" alt="표식">
						<a href="<%=request.getContextPath() %>/board/detail.jsp?no=<%=vo.getNo()%>">
							<%=vo.getTitle() %></a> <!-- 상태참조보다 인클루드되는 친구니까 어디서든 쓸수있게 -->
					</li>		
				<%} %>		
				<!-- 반복 끝 -->
			<%} %>
		</ul>
	</div>
</div>


