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
			if($('#title').val()==''){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
			}else if($('#name').val()==''){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
			}else if($('#pwd').val()==''){
				alert('비밀번호을 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}
		});
	});
</script>

	<article>
		<div class="divForm">
			<form name="frmWrite" method="post" action="boardWrite_ok.jsp" >
				<div>
					<label for="name">아이디</label>
					<input type="text" readonly id="name" name="name" value="admin"/>
				</div>
				<div>
					<label for="pwd">비밀번호</label>
					<input type="password" id="pwd" name="pwd" />
				</div>
				<div>
					<label for="title">제목</label>
					<input type="text" id="title" name="title"  />
				</div>
				<div>  
					<label for="content">내용</label>        
					<textarea id="content" name="content" rows="12" cols="40"></textarea>
				</div>
				<div>
					<label for="category">게시판종류</label>
					<select name="category">
						<option value="F">자유게시판</option>
						<option value="E">기타게시판</option>
					</select>
				</div>
				<div class="center">
					<input type = "submit" value="등록"/>
					<input type = "Button" class = "btList" value="게시판 선택 페이지"  />         
				</div>
			</form>
		</div>   
	</article>
<%@ include file="../inc/bottom.jsp" %>