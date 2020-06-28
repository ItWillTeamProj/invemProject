<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = (String)request.getAttribute("userid");
	int cnt = (int)request.getAttribute("writeCount");
	String test = request.getParameter("test1");
%>
<div id="tabs-1">
	<h1><%=userid %>님의 블로그 홈 화면입니다.</h1>
	<h3>여기에는 기본적인 회원 정보 와 지금껏 작성한 게시물 수 등을 출력할 예정입니다.</h3>
	<h5>현재 include한 페이지 blogHome.jsp</h5>
	<p>지금까지 작성한 게시물 수는 <%=cnt %>건입니다.</p>
	<p><%=test %></p>
</div>
