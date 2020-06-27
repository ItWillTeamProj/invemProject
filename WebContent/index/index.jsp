<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<article>
	<style>
	.grid{
		border: 1px solid lightgray;
		width:348px;
		height:348px;
		margin: 10px 5px 0px 5px;
		background: white;
		font-size: 90%
	}
	</style>
	<%-- 첫 화면 입니다 --%>

	<div class="grid" id="grid1" style="float:left;">
	
		<div style="border-bottom: 1px solid lightgray; padding-top:3px;
			width:348px; height:25px; ">
			<div style="padding-top:2px;">
				<span style="text-align: left; padding-left: 10px;">새로운 챔피언 : 세나</span>
				<a href="#" style="padding-left: 142px;">자세히</a>
			</div>
		</div>
		
		<div>
			<span>세나는 어린 시절부터 초자연적인 검은 안개에게 쫓기는 저주에 걸렸고, 이 때문에 빛의 감시단이라는 성스러운 결사단에 들어가 검은 안… </span>		
		</div>
			<br>
			<span>세나 소개 영상</span>	
		<div>
			<iframe style="width:348px; height:auto;"
			src="https://www.youtube.com/embed/arJbRqeeYG4" 
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
			allowfullscreen>
			</iframe>
		</div>
	</div>
	<div class="grid" id="grid2" style="float:right; text-align: center;">
		invem 인기글
	</div>
	
	<div>
		<a href="../admin/admin.jsp">관리자</a>
	</div>
</article>
<%@ include file="../inc/bottom.jsp" %>