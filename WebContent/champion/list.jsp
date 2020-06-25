<%@page import="java.util.List"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
<link href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../css/champion/champList.css" type="text/css" rel="stylesheet" >

<%
	List<ChampionVO> champList = (List)request.getAttribute("champList");
	String[] legend = {"all", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", 
			"ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};
	int numOfRow = 7;
%>
<script type="text/javascript">
	$(function() {
		$("#champList .sel").tooltip({
			content: function() {
		        return $(this).prop('title');
		   }
		});
	});
	
	function detail(no) {
		location.href = "detail.gg?no=" + no;
	}
</script>
	<div class="title">
		<h2>챔피언 정보</h2>
	</div>
		<!-- 검색 상자 테이블 -->
		<form action="champianList.jsp" method="post" name="frmSearch">
		<div id="filter">
			<div>
				<label class="label">역할 필터</label>
				<input type="checkbox" name="role" value="warrior">전사
				<input type="checkbox" name="role" value="tanker">탱커 <input
				type="checkbox" name="role" value="assassin">암살자 <input
				type="checkbox" name="role" value="mage">마법사 <input
				type="checkbox" name="role" value="adCarry">원거리 <input
				type="checkbox" name="role" value="supporter">서포터
			</div>
			<div>
				<label class="label">스킬 필터</label>
				<div class="skil">
				<input type="checkbox" name="skill" value="airborne">띄우기
					<input type="checkbox" name="skill" value="blind">실명 <input
					type="checkbox" name="skill" value="escape">탈출 <input
					type="checkbox" name="skill" value="fear">공포 <input
					type="checkbox" name="skill" value="heal">치유 <input
					type="checkbox" name="skill" value="fling">던지기 <input
					type="checkbox" name="skill" value="knockBack">밀치기 <input
					type="checkbox" name="skill" value="scout">정찰<br>
				<input type="checkbox" name="skill" value="shield">보호막 <input
					type="checkbox" name="skill" value="slience">침묵 <input
					type="checkbox" name="skill" value="slow">둔화 <input
					type="checkbox" name="skill" value="bind">속박 <input
					type="checkbox" name="skill" value="ascendancy">제압 <input
					type="checkbox" name="skill" value="hide">은신 <input
					type="checkbox" name="skill" value="faint">기절 <input
					type="checkbox" name="skill" value="taunt">도발
				</div>
			</div>
		</div>
		<div id="searchDiv">
			<label id="searchChamp"  class="label">챔피언 검색</label> <input type="text"
				name="champSearch" /> <input type="button" class="bt1" value="초기화" />
		</div>
		<div id=champs>
			<%for (int i = 0; i < legend.length; i++) {	%>
					<a href="chamianList.jsp?val=<%=legend[i]%>"><%=legend[i]%></a>
			<%}%>
		</div>
		</form>
			<table id="champList">
			<%for (int i = 0; i < (int)Math.ceil((float)champList.size()/numOfRow); i++) {%><tr><%
				for (int j = 0; j < numOfRow; j++) {
					if((i * numOfRow) + j == champList.size()) break;
					ChampionVO vo = champList.get((i * numOfRow) + j);
					String title = "<img src='../images/championIcon/i"+vo.getNo()
						+ ".png' style='width: 50px; float: left; margin: 5px;'>"
						+ "<div style='float: left; display: inline-block; margin: 5px; font-weight: bold;'>"+vo.getChamp() + "<br>" + vo.getNickname() + "<br>"
						+ vo.getRole()+vo.getLane()+ "</div><hr style='clear: both; margin-top: 5px;'>" 
						+ "<p style='clear: both; margin-top: 5px; font-size: 14px;'>"+ vo.getDescribe()
						+ "</p>";%>
					<td data-geo="<%=vo.getNo()%>">
						<div class="sel"
							style="background-image: url('../images/championIcon/i<%=vo.getNo()%>.png');"
							 title="<%=title%>" onclick="detail(<%=vo.getNo()%>)"></div>
						<span><%=vo.getChamp()%></span>
					</td>
				<%}%> 
				</tr>
			<%}%>
			</table>
<%@ include file="../inc/bottom.jsp"%>