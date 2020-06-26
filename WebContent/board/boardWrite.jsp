<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	userid = (String)request.getAttribute("userid");
	String boardName = (String)request.getAttribute("boardName");
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
		
		$("form[name=frm]").submit(function() {
			//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			
			// 에디터의 내용에 대한 값 검증은 이곳에서
			//document.getElementById("ir1").value를 이용해서 처리한다.
			console.log(document.getElementById("ir1"));
			
			try {
				  elClickedObj.form.submit();
			} catch(e) {}
		});
		
		$('#cancel').click(function(){
			location.href = "<%=request.getContextPath()%>/board/boardList.gg";
		});
	});
</script>
<article style="width: 800px">
	
	<h3><%=boardName %></h3>
	<hr style="border: 0; height: 2px; background: skyblue">
	<form name="frm" method="post" action="<%=request.getContextPath()%>/board/boardWrite_ok.gg">
		<%if(userid.equals("unknown") || userid == null || userid.isEmpty()){%>
		<input type="text" size="20" style="margin-left: 10px"
			value="별명을 입력 해 주세요" name="nonuserid" onfocus="this.value=''">
		<input type="text" size="20" style="margin-left: 10px"
			value="비밀번호를 입력 해 주세요" name="pwd"
			onfocus="this.value=''; type = 'password'">
		<input type="text" size="70" id="title" style="margin-left: 10px"
			name="title" value="제목을 입력 해 주세요" onfocus="this.value=''"><br>			
		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="F"> <br>
		<%}else{%>

		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="F"> <br>
		<input type="text" size="70" id="title" style="margin-left: 10px"
			name="title" value="제목을 입력 해 주세요" onfocus="this.value=''"><br>
		<%}%>
			<hr style="border: 0; height: 2px; background: skyblue">
		<textarea name="ir1" id="ir1" rows="10" cols="50" value="입력하세요."
			onfocus="this.value=''"></textarea>
			<hr style="border: 0; height: 2px; background: skyblue">
		<div style="float: right; margin-right: 220px">
			<input type="button" value="취소" id = "cancel">
			<input type="submit" value="등록">
		</div>
	</form>
</article>

<%@ include file="../inc/bottom.jsp"%>
