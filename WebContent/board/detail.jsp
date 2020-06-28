<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.invem.board.model.ReplyVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp"%>

<%
	String code = request.getParameter("code");
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");
	userid = (String)request.getAttribute("userid");
	String no = request.getParameter("no");
	
	int replyCount = (int)request.getAttribute("replyCount");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#list').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>";
	});
	
	$('#edit').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardEdit.gg?no=<%=no%>&code=<%=code%>";
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
		default:%>
		<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href = "<%=request.getContextPath()%>/index.jsp";
		</script>
		<%break;
	}
	%>
	<h3><%=boardName %></h3>	
	<hr style = "border: 0; height: 2px; background: skyblue">
	<div>
		<h4 style = "margin-left: 10px"><%=vo.getTitle() %></h4><a class = "btn btn-default pull-right" id="edit">수정</a>
	</div>
	<div>
		<%if(!"unknown".equals(userid) && userid != null && !userid.isEmpty()){%>
			<span style = "float: left; margin-left: 30px"><%=vo.getUserid() %> | <%=vo.getRegdate() %></span>
			<span style = "float: right; margin-right: 20px">조회 <%=vo.getViews() %> | 추천 <%=vo.getRecommend() %> | 댓글<%=replyCount %> </span>
		<%}else{%>
			<span style = "float: left; margin-left: 30px"><%=vo.getNonuserid() %>(<%=vo.getIpaddress() %>) | <%=vo.getRegdate() %></span>
			<span style = "float: right; margin-right: 20px">조회 <%=vo.getViews() %> | 추천 <%=vo.getRecommend() %> | 댓글<%=replyCount %>  </span>
		<%} %>
	</div><br><hr style = "border: 0; height: 2px; background: skyblue">
	<div><%=vo.getDescribe() %></div><br>
	<br><hr style = "border: 0; height: 2px; background: skyblue">
	
	<div style="width: 100%; height: 200px; text-align: center; float:right">
		<a href = "#"><img src = "../images/good.jpg" style = "max-width: 100px; max-height:100px;float: left" alt = "추천"/></a>
		<a href = "#"><img src = "../images/bad.jpg" style = "max-width: 100px; max-height:100px; float: left" alt = "신고"/></a>
	</div>
	
	<%if(list != null && !list.isEmpty()){%>
		<b>댓글 목록</b><br><br>
		<table style = "width: 100%;" class="table table-hover table-sm">
		<colgroup>
			<col style = "width: 20%; ">
			<col style = "width: 60%; ">
			<col style = "width: 20%; ">
		</colgroup>
			<tr>
				<th style = "text-align: center">작성자</th>
				<th>댓글</th>
				<th style = "text-align: center">작성일</th>
			</tr>
			<%for(int i = 0; i < list.size(); i++){ 
				ReplyVO rVo = list.get(i);
			%>
				<tr>
					<td style = "text-align: center"><%=rVo.getUserid() %></td>
					<td><%=rVo.getReply() %></td>
					<td style = "text-align: center"><%=sdf.format(rVo.getRegdate()) %>
						<a href = "#"><img src = "<%=request.getContextPath()%>/images/deleteIcon.png"></a>
					</td>
				</tr>
			<%}%>
		</table>
		<%} %>
	<br>
	
	
	<form name="frmReply" action="<%=request.getContextPath() %>/board/reply_ok.gg" method="post" >
	<div>
	<%if(userid != null && !userid.isEmpty()){%>
		<span style = "float: left; width: 15%">
			<input type = "text" name = "nonuserid" size = "15" style = "margin-left: 5px; margin-top: 5px" value="닉네임"
				onfocus="this.value=''">
			<input type = "text" name = "pwd" size = "15" style = "margin-left: 5px; margin-top: 5px" value="비밀번호"
				onfocus="this.value=''; type = 'password'"> 
		</span>
	
	<%}else{%>
		<span style = "float: left; width: 15%"><%=userid %></span>
	<%} %>
		<input type = "hidden" name = "code" value = "<%=code%>">
 		<input type = "hidden" name = "no" value = "<%=Integer.parseInt(no)%>">
		<input type = "hidden" name = "userid" value = "<%=userid%>">
		<span style = "float: left; width: 60%; margin-left: 20px">
			<textarea name = "reply" rows="5" cols="60" style = "margin-left: 30px"></textarea>
		</span>
		<span><input type = "submit" value = "등록" 
			style = "width: 90px; height: 30px; float: right; margin-right: 10px; margin-top: 5px">
		<input type = "button" id = "list" value ="목록으로"
		style = "width: 90px; height: 30px; float: right; margin-right: 10px; margin-top: 5px"></span>
	</div>
	</form>
	<br><br>
	
</article>



<script type ="text/javascript" src = "../js/bootstrap/bootstrap.js"></script> 
<%@ include file = "../inc/bottom.jsp"%>