<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src = "../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href = 'list.jsp';
		});
		
		$('form[name = frmWrite]').submit(function(){
			if($('#adminpwd').val()==''){
				alert('관리자 비밀번호을 입력하세요');
				$('#adminpwd').focus();
				event.preventDefault();
			}else if($('#boardpwd').val()==''){
				alert('게시물 비밀번호을 입력하세요');
				$('#boardpwd').focus();
				event.preventDefault();
			}else if($('#title').val()==''){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
			}else if($('#title').val()==''){
				alert('내용을 입력하세요');
				$('#title').focus();
				event.preventDefault();
			}
		});
	});
</script>

	<article>
		<div style="margin-top: 10px; width: 720px; height:61px;
			background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
			background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
			<div style="padding: 10px 10px 10px 15px;">
				<b>게시판관리</b>
			</div>
		</div>
		
		<div class="divForm">
			<form name="frmWrite" method="post" action="boardWrite_ok.jsp" >
				<div>
				<table style="font-size: 100%; border-collapse: collapse; margin-left:10px;
					width:700px;">
					
					<colgroup>
						<col style = "width: 150px">
						<col style = "width: 550px">
					</colgroup>	
					
					<tr>
						<td>관리자 아이디</td>
						<td><input type="text" readonly id="id" name="id" value="id"/></td>
					</tr>
					<tr>
						<td>관리자 비밀번호</td>
						<td><input type="password" id="inputadminpwd" name="apwd"/></td>
					</tr>
					<tr>
						<td>게시물 비밀번호</td>
						<td><input type="password" id="inputboardpwd" name="bpwd"/></td>
					</tr>					
					<tr>
						<td>제목</td>
						<td><input type="text" id="title" name="title"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea id="content" name="content" rows="12" cols="55"></textarea></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select name="category">
								<option value="F">자유게시판</option>
								<option value="E">기타게시판</option>
							</select>
						</td>
					</tr>
				</table>
				</div>
				<br>
				<div style="text-align: center;">
					<input type="submit" value="등록"/>
					<input type="Button" value="게시판 선택 페이지" onclick="location.href='<%=request.getContextPath() %>/admin/boardSelect.jsp'" />         
				</div>
			</form>
		</div>   
	</article>
<%@ include file="../inc/bottom.jsp" %>