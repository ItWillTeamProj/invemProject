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
	String no = request.getParameter("no");
	String pwd = vo.getPwd();
	
	
	int replyCount = (int)request.getAttribute("replyCount");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
<script type="text/javascript">
$(function(){
	if("<%=vo.getUserid()%>" != "" && "<%=vo.getUserid()%>" != "unknown" && "<%=vo.getUserid()%>" != "<%=userid%>"){
		$('#delete').css("display", "none");
	}
	
	if("<%=vo.getUserid()%>" != "" && "<%=vo.getUserid()%>" != "unknown" && "<%=vo.getUserid()%>" != "<%=userid%>"){
		$('#edit').css("display", "none");
	}
	
	$('#list').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>";
	});
	
	
	$('#edit').click(function(){
		location.href = "<%=request.getContextPath()%>/board/boardEdit.gg?no=<%=no%>&code=<%=code%>";
	});

	$('#delete').click(function(){
		var result = confirm('정말 삭제 하시겠습니까?');
		if("<%=vo.getUserid()%>" == "<%=userid%>"){
			if(result){
				location.href = "<%=request.getContextPath()%>/board/boardDelete_ok.gg?no=<%=no%>&code=<%=code%>";
			}else{
				return false;
			}
		}else{
			if(result){
				window.open('<%=request.getContextPath()%>/board/deleteNonuser.gg?no=<%=no%>&code=<%=code%>', 'viewer', 'width=400, height=400');
			}else{
				return false;
			}
		}
	});
	
	$('.delReply').click(function(){
		
		var rId = $('#rId').html();
		var replyNo = $('#replyNo').html();
		var groupNo = $('#groupNo').html();
		
		var result = confirm('댓글을 정말로 삭제 하시겠습니까?');
		if(rId == "<%=userid%>"){
			if(result){
				location.href = "<%=request.getContextPath()%>/reply/replyDelete_ok.gg?no="+replyNo+"&code=<%=code%>&groupno="+groupNo;
			}else{
				return false;
			}
		}else{
			if(result){
				window.open("<%=request.getContextPath()%>/reply/replyDelNonuser.gg?no="+replyNo+"&code=<%=code%>&groupno="+groupNo, 'viewer', 'width=400, height=400');
			}else{
				return false;
			}
		}
	});
	
	$('#good').click(function(){
		location.href = "<%=request.getContextPath()%>/board/recommend.gg?no=<%=no%>&code=<%=code%>&value=G";
	});
	
	$('#good').click(function(){
		location.href = "<%=request.getContextPath()%>/board/recommend.gg?no=<%=no%>&code=<%=code%>&value=B";
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
		<h4 style = "margin-left: 10px"><%=vo.getTitle() %></h4>
		<a class = "btn btn-danger pull-right" id="delete">삭제</a>
		<a class = "btn btn-info pull-right" id="edit">수정</a>
		
	</div>
	<div>
		<%if(!"unknown".equals(vo.getUserid()) && vo.getUserid() != null && !vo.getUserid().isEmpty()){%>
			<span style = "float: left; margin-left: 30px"><%=vo.getUserid() %> | <%=vo.getRegdate() %></span>
			<span style = "float: right; margin-right: 20px">조회 <%=vo.getViews() %> | 추천 <%=vo.getRecommend() %> | 댓글<%=replyCount %> </span>
		<%}else{%>
			<span style = "float: left; margin-left: 30px"><%=vo.getNonuserid() %>(<%=vo.getIpaddress() %>) | <%=vo.getRegdate() %></span>
			<span style = "float: right; margin-right: 20px">조회 <%=vo.getViews() %> | 추천 <%=vo.getRecommend() %> | 댓글<%=replyCount %>  </span>
		<%} %>
	</div><br><hr style = "border: 0; height: 2px; background: skyblue">
	<div><%=vo.getDescribe() %></div><br>
	<br><hr style = "border: 0; height: 2px; background: skyblue">
	
	<div style="width: 100%; height: 200px; text-align: center;">
		<a href = "#"><img src = "../images/good.png" style = "max-width: 100px; max-height:100px; text-align: center;" alt = "추천"/></a>
		<a href = "#"><img src = "../images/bad.png" style = "max-width: 100px; max-height:100px; text-align: center;" alt = "신고"/></a>

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
					<td style = "text-align: center" id = "rId"><%=rVo.getusername() %></td>
					<td><%=rVo.getReply() %><span style="display: none;" id="groupNo"><%=rVo.getGroupno() %></span><span style="display: none;" id="replyNo"><%=rVo.getRep_no() %></span></td>
					<td style = "text-align: center"><%=sdf.format(rVo.getRegdate()) %>
						<span><a href = "#" class = "delReply"><img style = "width: 20px;height: auto;margin-left: 10px" src = "<%=request.getContextPath()%>/images/deleteIcon.png"></a></span>
					</td>
				</tr>
			<%}%>
		</table>
		<%} %>
	<br>
	
	
	<form name="frmReply" action="<%=request.getContextPath() %>/board/reply_ok.gg" method="post" >
	<div style="overflow: hidden;">
	<%if("unknown".equals(userid) || userid == null || userid.isEmpty()){%>
		<span style = "float: left; width: 15%">
			<input type = "text" name = "nonuserid" size = "15" style = "margin-left: 5px; margin-top: 5px" value="닉네임"
				onfocus="this.value=''">
			<input type = "text" name = "pwd" size = "15" style = "margin-left: 5px; margin-top: 5px" value="비밀번호"
				onfocus="this.value=''; type = 'password'"> 
		</span>
	
	<%}else{%>
		<input type="hidden" value="<%=userid %>">
	<%} %>
		<input type = "hidden" name = "code" value = "<%=code%>">
 		<input type = "hidden" name = "no" value = "<%=Integer.parseInt(no)%>">
		<textarea id="reply" name = "reply" rows="5" cols="60" 
			style = "float: left; width: 60%; margin: 0 20px;"></textarea>
		<div style="float: left;"><input type = "submit" value = "등록" 
			style = "width: 90px; height: 30px;  margin-right: 10px; margin-top: 5px">
		<br><input type = "button" id = "list" value ="목록으로"
		style = "width: 90px; height: 30px; margin-right: 10px; margin-top: 5px">
		</div>
	</div>
	</form>
	<br><br>
	
</article>




<%@ include file = "../inc/bottom.jsp"%>