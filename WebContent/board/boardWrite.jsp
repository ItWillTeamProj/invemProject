<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	userid = (String)session.getAttribute("userid");
	String boardName = (String)request.getAttribute("boardName");
	String code = request.getParameter("code");
	if(userid == null || userid.isEmpty()){
		userid = "unknown";
	}
%>

<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('form[name = frm]').submit(function(){
			if($('#nonuserid').val()=='' || $('#nonuserid').val() == "별명을 입력 해 주세요"){
				alert('별명을 입력하세요');
				event.preventDefault();
			}else if($('#pwd').val() =='' || $('#pwd').val() == "비밀번호를 입력 해 주세요"){
				alert('비밀번호를 입력하세요');
				event.preventDefault();
			}else if($('#title').val()=='' || $('#title').val() == "제목을 입력 해 주세요"){
				alert('제목을 입력하세요');
				event.preventDefault();
			}
		});
		
		
		
		
		
		
		
		
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
			location.href = "<%=request.getContextPath()%>/board/boardList.gg?code=<%=code%>";
		});
	});
</script>
<article style="width: 720px">
	<div class="title">
		<h2><%=boardName %> - 글쓰기</h2>
	</div>
	<div style="margin-top: 10px;">
	<form name="frm" method="post" action="<%=request.getContextPath()%>/board/boardWrite_ok.gg">
		<%if("unknown".equals(userid) || userid == null || userid.isEmpty()){%>
		<input type="text" size="20" style="margin-left: 10px"
			value="별명을 입력 해 주세요" id = "nonuserid" name="nonuserid" onfocus="this.value=''">
		<input type="text" size="20" style="margin-left: 10px"
			value="비밀번호를 입력 해 주세요" name="pwd" id = "pwd"
			onfocus="this.value=''; type = 'password'"><br>
			
		<input type="text" size="45" id="title" style="margin-top:5px; margin-left: 10px" 
			name="title" value="제목을 입력 해 주세요" onfocus="this.value=''"><br>			
		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="<%=code%>"> <br>
		<%}else{%>

		<input type="hidden" name="userid" value="<%=userid %>"> 
		<input type="hidden" name="code" value="<%=code%>"> <br>
		<input type="text" size="50" id="title" style="margin-bottom:10px; margin-left: 10px" id = "title2"
			name="title" value="제목을 입력 해 주세요" onfocus="this.value=''"><br>
		<%}%>
		<div style="margin-left:10px;">
		<textarea name="ir1" id="ir1" rows="10" cols="50" value="입력하세요."
			onfocus="this.value=''"></textarea>
		</div>
		<div style="margin:5px 0px 0px 485px">
			<input type="button" value="취소" id = "cancel">
			<input type="submit" value="등록">
		</div>
	</form>
	</div>
</article>

<%@ include file="../inc/bottom.jsp"%>
