<%@page import="com.invem.board.model.BoardService"%>
<%@page import="com.invem.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	String boardName = (String)request.getAttribute("boardName");
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	userid = vo.getUserid();	
	String nonuserid = vo.getNonuserid();
	String code = (String)request.getAttribute("code");
	String delflag = (String)request.getAttribute("delflag");

%>

<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){

		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "ir1",
		 sSkinURI: "../se2/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});

		<%-- $("#ir1").html("<%=vo.getDescribe()%>"); --%>
			

		$("form[name=frmEdit]").submit(function() {
			//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			
			// 에디터의 내용에 대한 값 검증은 이곳에서
			//document.getElementById("ir1").value를 이용해서 처리한다.
			console.log(document.getElementById("ir1"));
			
			try {
				  elClickedObj.form.submit();
			} catch(e) {}
			
			location.href ="<%=request.getContextPath()%>/board/boardEdit_ok.gg";
		});
		
		$('#cancel').click(function(){
			location.href = '<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>';
		}); 
		
	});
	
	
	
	
</script>
<article style="width: 800px">
	
	<h3>게시글 수정 : <%=boardName %></h3>
	<hr style="border: 0; height: 2px; background: skyblue">
	<form name="frmEdit" method="post" onsubmit="check()" action = "<%=request.getContextPath()%>/board/boardEdit_ok.gg">
	
		<%if("unknown".equals(userid) || userid == null || userid.isEmpty()){%>
		<input type="text" size="20" style="margin-left: 10px"
			value="<%=vo.getNonuserid()%>" name="nonuserid" disabled>
		<input type="text" size="20" style="margin-left: 10px"
			value="비밀번호를 입력 해 주세요" name="pwd"
			onfocus="this.value=''; type = 'password'"><br>
		<input type="text" size="70" id="title" style="margin-left: 10px"
			name="title" value="<%=vo.getTitle()%>"><br>			
		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="<%=vo.getCat_code()%>"> <br>
		<%}else{%>
		
		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="<%=vo.getCat_code()%>"> <br>
		<input type="text" size="70" id="title" style="margin-left: 10px"
			name="title" value="<%=vo.getTitle()%>"><br>
		<%}%>
		<input type="hidden" name="no" value="<%=vo.getNo() %>">
			<hr style="border: 0; height: 2px; background: skyblue">
		<input type="hidden" name="delflag" value="<%=delflag%>">
		<textarea name="ir1" id="ir1" rows="10" cols="50"><%=vo.getDescribe()%></textarea>
			<hr style="border: 0; height: 2px; background: skyblue">
		<div style="float: right; margin-right: 220px">
			<input type="button" value="취소" id = "cancel">
			<input type="submit" value="수정">
		</div>
	</form>
</article>

<%@ include file="../inc/bottom.jsp"%>
