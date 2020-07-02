<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
p {
    text-align: center;
    font-size: 3.5em;
    color: #efeeee;
    text-shadow: 0px 0px 20px #09096775;
}

fieldset {
	clear: both;
	min-width: 0;
	padding: .35em .625em .75em;
	margin: 0 2px;
	margin-top: 30px;
	border: 1px solid silver;
	border-radius: 0.5em;
	border-color: #6db92a;
	background-color: white;
	background-image: url('<%=request.getContextPath()%>/images/back3.png')
}

#div1 {
	width: 700px;
	margin: 50px auto;
}
input.form-control.form-control-lg {
    height: 60px;
    border-radius: 10px;
    font-size: 2em;
    text-align: center;
}
#notice{
	border-radius: 10px;
    height: 60px;
    margin-bottom: 40px;
}

#notice h2{
	padding-top: 14px;
    color: black;
    text-shadow: 0px 0px 20px #ffe1e1;
    font-weight: 900;
    font-size: 3em;
}
.btn-primary {
    color: #fff;
    background-color: #090967;
    border-color: #00003c;
    width: 150px;
    margin: 0 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			location.href = "<c:url value='/login/login.gg'/>";
		});
		
		$("#searchPwd").click(function() {
			location.href = "<c:url value='/login/munhi_ok.gg?search=pwd'/>";
		});
		
		$("#searchId").click(function() {
			location.href = "<c:url value='/login/munhi_ok.gg?search=id'/>";
		});
	});

</script>
<article>
<div class="title">
		<h2>아이디·비밀번호 찾기</h2>
	</div>
	<div id="div1">
		<fieldset
			style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px; ">
			<div style="width: 80%; margin: 0 auto; margin-top: 50px; text-align: center;">
				<div id="notice"><h2>${mList[0].name }님의 아이디</h2></div>
				<div style="background: #3535358f; width: 66%; margin: 0 auto; height: 100px;
    				border: 7px solid #cdbee3; padding: 1px;">
				<c:if test="${empty mList }">
					<p>일치하는 회원 정보가 없습니다.</p>
				</c:if>
				<c:if test="${!empty mList }">
					<c:forEach items="${mList }" var="l">
						<p>${l.userid }</p>
					</c:forEach>
				</c:if>
				</div>
			</div>
			<div style="text-align: center; margin: 50px 0;">
				<c:if test="${empty mList }">
					<input class="btn btn-primary btn-lg" type="button" value="아이디 찾기" id="searchId">
				</c:if>
				<c:if test="${!empty mList }">
					<input class="btn btn-primary btn-lg" type="button" value="로그인" id="login">
					<input class="btn btn-primary btn-lg" type="button" value="비밀번호 찾기" id="searchPwd">
				</c:if>
			</div>
		</fieldset>
	</div>
</article>

<%@ include file="../inc/bottom.jsp"%>