<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<div>
	<h2>챔피언 정보</h2>
		<hr>
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
			<%-- <%for (int i = 0; i < legend.length; i++) {	%>
					<a href="chamianList.jsp?val=<%=legend[i]%>"><%=legend[i]%></a>
			<%}%> --%>
		</div>
		</form>
			<table id="champList">
			<!-- <colgroup>
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
			</colgroup> -->
				<%-- <%
					for (int i = 0; i < list.size() / numOfRow; i++) {
				%>
				<tr>
					<%
						for (int j = 0; j < numOfRow; j++) {
								vo = list.get((i * numOfRow) + j);
								String title = "<img src='../images/championIcon/i"+vo.getNo()
									+ ".png' style='width: 50px; float: left; margin: 5px;'>"
									+ "<div style='float: left; display: inline-block; margin: 5px; font-weight: bold;'>"+vo.getChamp() + "<br>" + vo.getNickname() + "<br>"
									+ vo.getRole()+vo.getLane()+ "</div><hr style='clear: both; margin-top: 5px;'>" 
									+ "<p style='clear: both; margin-top: 5px; font-size: 14px;'>"+ vo.getDescribe()
									+ "</p>";
					%>
					<td data-geo="<%=vo.getNo()%>">
						<div class="sel"
							style="background-image: url('../images/championIcon/i<%=vo.getNo()%>.png');"
							 title="<%=title%>" onclick="detail(<%=vo.getNo()%>)"><span>
							<%=vo.getChamp()%>
						</span></div>
					</td>
					<%
						}
					%> 

				</tr>
				<%
					}
				%>--%>
			</table>
</div>
<%@ include file="../inc/bottom.jsp"%>