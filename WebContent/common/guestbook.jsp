<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div id="tabs-4">
	<h1>방명록 페이지</h1>
	<h3>다른회원이 방명록을 남길 수 있는 페이지 입니다.</h3>
	<h5>현재 include한 페이지 guestbook.jsp</h5>
	<form name="frmReply" action="<%=request.getContextPath() %>/guestbook/guestbookInsert.gg" method="post" 
		style="overflow: hidden;">
	<div>
	<c:if test="${empty userid }">
		<span style = "float: left; width: 15%">
			<input type = "text" name = "nonuserid" size = "15" style = "margin-left: 5px; margin-top: 5px" value="닉네임"
				onfocus="this.value=''">
			<input type = "text" name = "pwd" size = "15" style = "margin-left: 5px; margin-top: 5px" value="비밀번호"
				onfocus="this.value=''; type = 'password'"> 
		</span>
	</c:if>
	<c:if test="${!empty userid }">
		<span style = "float: left; width: 15%">${userid }</span>
		<input type = "hidden" name = "userid" value = "${userid }">
	</c:if>
		<span style = "float: left; width: 60%; margin-left: 20px">
			<textarea name = "reply" rows="5" cols="60" style = "margin-left: 30px"></textarea>
		</span>
		<input type = "hidden" name = "blogId" value = "<%=blogId%>">
		<span><input type = "submit" value = "등록" 
			style = "width: 100px; height: 30px; float: right; margin-right: 10px">
		<input type = "button" id = "list" value ="목록으로"
		style = "width: 100px; height: 30px; float: right; margin-right: 10px"></span>
	</div>
	</form>
</div>