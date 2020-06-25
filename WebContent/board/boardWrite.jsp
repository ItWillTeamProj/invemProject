<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	String userid = request.getParameter("userid");

	//코드를 받아와서 게시판의 이름을 적는다 일단 페이지 확인때문에 code임의로 F로 넣음
	String code = request.getParameter("code");
	code = "F";
	if(userid == null || userid.isEmpty()){
		userid = "";
	}
%>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js" charset="utf-8"></script>
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
			location.href = "boardList.jsp";
		});
	});
</script>
<article style="width: 800px">
	<%
	String boardName = "";
	switch(code){
		case "F":
		boardName = "자유게시판";
		break;
		default:%>
	<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href = "../index.jsp";
		</script>
	<%break;
	}
	%>
	<h3><%=boardName %></h3>
	<hr style="border: 0; height: 2px; background: skyblue">
	<form name="frm" method="post" action="boardWrite_ok.jsp">
		<%if(userid == null || userid.isEmpty()){%>
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
