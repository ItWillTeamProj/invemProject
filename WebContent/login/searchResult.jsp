<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
p {
	text-align: center;
	margin: 10px;
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
	width: 600px;
	margin: 160px auto;
}
input.form-control.form-control-lg {
    height: 60px;
    border-radius: 10px;
    font-size: 2em;
    text-align: center;
}

</style>
<article>
	<div id="div1">
		<fieldset
			style="margin-bottom: 30px; margin-left: 30px; margin-right: 30px; ">
			<div style="width: 80%; margin: 0 auto; margin-top: 70px; text-align: center;">
				<div>"${mList[0].name }" 님에 해당하는 아이디</div>
				<c:if test="${empty mList }">
					<span>일치하는 회원 정보가 없습니다.</span>
				</c:if>
				<c:if test="${!empty mList }">
					<c:forEach items="${mList }" var="l">
						<p>${l.userid }</p>
					</c:forEach>
				</c:if>
				<span></span>
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