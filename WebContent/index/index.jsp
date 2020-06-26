<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<article>
	<style>
	.grid{
		border: 1px solid gray;
		width:348px;
		height:348px;
		margin: 5px 5px 5px 5px;
	}
	</style>
	<%-- 첫 화면 입니다 --%>
	<div class="grid" id="grid1" style="float:left; text-align: center;">
		<span>새로운 챔피언 '세나' 소개 글</span><br><br>
		<span>세나는 어린 시절부터 초자연적인 검은 안개에게 쫓기는 저주에 걸렸고, 이 때문에 빛의 감시단이라는 성스러운 결사단에 들어가 검은 안… </span>		
		<br><br>
		<span>새로운 챔피언 '세나' 소개 영상</span>
		<br><br>
		<iframe width="340px" height="auto" src="https://www.youtube.com/embed/arJbRqeeYG4" 
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
			allowfullscreen>
		</iframe>
	</div>
	<div class="grid" id="grid2" style="float:right; text-align: center;">
		invem 인기글
	</div>
	
	<div>
		<a href="../admin/admin.jsp">관리자</a>
	</div>
</article>
<%@ include file="../inc/bottom.jsp" %>