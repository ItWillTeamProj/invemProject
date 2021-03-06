<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$("form[name=reply]").submit(function() {
			if($("#userid").val()  == '' || $("#userid").val() == '로그인을 하세요'){
				alert("로그인을 하셔야 합니다.");
				location.href = "<c:url value='/login/login.gg' />";
				return false;
			}
			if($("#title").val() == ''){
				alert("제목을 입력하세요");
				$("#title").focus();
				return false;
			}
			if($("#reContent").val() == ''){
				alert("내용을 입력하세요");
				$("#reContent").focus();
				return false;
			}
		});
	});
</script>
<form name="reply" action='<c:url value="/champion/reply_ok.gg" />' method="post">
	<hr>
	<input type="hidden" name="champNo" value="${param.no }">
	<input type="hidden" name="code" value="C">
	<div style="margin-left: 21px;">
		<label for="title">제목</label> 
		<input type="text" name="title" id="title"
			maxlength="100" style="width: 300px;">
	</div>
	<div style="margin-right: 17px;">
		<label for="nickName">아이디</label>
		 <input value="" type="text" name="userid" id="userid" readonly="readonly">
	</div>
	<div style="margin: 0 auto; text-align: center;">
		<textarea id="reContent" rows="4" cols="70" name="reContent"></textarea>
	</div>
	<div>
		<input type="submit" value="등록" style="margin-top: 5px; margin-right: 14px;">
	</div>
</form>