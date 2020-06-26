<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
<div id="tabs-2">
	<h1>게시물 페이지</h1>
	<h3>지금껏 회원이 작성한 게시물의 리스트를 출력할 페이지 입니다.</h3>
	<h5>현재 include한 페이지 myBoard.jsp</h5>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<%
		if(list != null && !list.isEmpty()){
			for(int i = 0; i < list.size(); i++){
				BoardVO vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getDescribe() %></td>
				<td><%=vo.getRegdate() %></td>
				
			</tr>
			<%}
			
		}
		%>
	</table>
</div>
