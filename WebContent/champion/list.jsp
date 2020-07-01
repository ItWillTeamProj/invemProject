<%@page import="java.util.List"%>
<%@page import="com.invem.champion.model.ChampionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href='<c:url value="/css/champion/champList.css"/>' type="text/css" rel="stylesheet" >

<%
	List<ChampionVO> champList = (List)request.getAttribute("champList");
	String[] legend = {"all", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", 
			"ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};
	int numOfRow = 7;
	
	String[] role = (String[])request.getAttribute("role");
	String[] skill = (String[])request.getAttribute("skill");
%>
<script type="text/javascript">
	$(function() {
		<%if(role != null && role.length >0){%>
		$("input[name=role]").each(function() {
			<%for(int i = 0; i < role.length; i++){%>
				if($(this).val() == '<%=role[i]%>'){
					$(this).attr("checked","checked");
					console.log = $(this).val();
					console.log = '<%=role[i]%>';
				}
			<%}%>
		});
		<%}%>
		<%if(skill != null && skill.length >0){%>
			$("input[name=skill]").each(function() {
				<%for(int i = 0; i < skill.length; i++){%>
					if($(this).val() == '<%=skill[i]%>'){
						console.log = $(this).val();
						console.log = '<%=skill[i]%>';
						$(this).attr("checked","checked");
					}
				<%}%>
			});
		<%}%>
		
		$('[data-toggle="tooltip"]').tooltip({
			content: function() {
		        return $(this).prop('title');
		   }
		});
		
		$("input[type=checkbox]").change(function(){
	        this.form.submit();
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
		<form action="<c:url value='/champion/list.gg'/>" method="post" name="frmSearch">
		<div id="filter">
			<div>
				<label class="label">역할 필터</label>
				<input type="checkbox" name="role" value="전사">전사
				<input type="checkbox" name="role" value="탱커">탱커 <input
				type="checkbox" name="role" value="암살자">암살자 <input
				type="checkbox" name="role" value="마법사">마법사 <input
				type="checkbox" name="role" value="원거리">원거리 <input
				type="checkbox" name="role" value="서포터">서포터
			</div>
			<div>
				<label class="label">스킬 필터</label>
				<div class="skil">
				<input type="checkbox" name="skill" value="띄우기">띄우기
					<input type="checkbox" name="skill" value="실명">실명 <input
					type="checkbox" name="skill" value="탈출">탈출 <input
					type="checkbox" name="skill" value="공포">공포 <input
					type="checkbox" name="skill" value="치유">치유 <input
					type="checkbox" name="skill" value="던지기">던지기 <input
					type="checkbox" name="skill" value="밀치기">밀치기 <input
					type="checkbox" name="skill" value="정찰">정찰<br>
				<input type="checkbox" name="skill" value="보호막">보호막 <input
					type="checkbox" name="skill" value="침묵">침묵 <input
					type="checkbox" name="skill" value="둔화">둔화 <input
					type="checkbox" name="skill" value="속박">속박 <input
					type="checkbox" name="skill" value="제압">제압 <input
					type="checkbox" name="skill" value="은신">은신 <input
					type="checkbox" name="skill" value="기절">기절 <input
					type="checkbox" name="skill" value="도발">도발
				</div>
			</div>
		</div>
		<div id=champs>
			<%for (int i = 0; i < legend.length; i++) {	%>
					<a href="<%=request.getContextPath() %>/champion/list.gg?val=<%=legend[i]%>">
					<%=legend[i]%></a>
			<%}%>
		</div>
		</form>
			<table id="champList">
			<%for (int i = 0; i < (int)Math.ceil((float)champList.size()/numOfRow); i++) {%><tr><%
				for (int j = 0; j < numOfRow; j++) {
					if((i * numOfRow) + j == champList.size()) break;
					ChampionVO vo = champList.get((i * numOfRow) + j);
					String title = "<img src='../images/championIcon/i"+vo.getChamp_no()
						+ ".png' style='width: 50px; float: left; margin: 5px;'>"
						+ "<div style='float: left; display: inline-block; margin: 5px; font-weight: bold;'>"+vo.getName() + "<br>" + vo.getNickname() + "<br>"
						+ vo.getRole()+vo.getLane()+ "</div><hr style='clear: both; margin-top: 5px;'>" 
						+ "<p style='clear: both; margin-top: 5px; font-size: 14px;'>"+ vo.getDescribe()
						+ "</p>";%>
					<td data-geo="<%=vo.getChamp_no()%>">
						<div class="sel1" data-toggle="tooltip" 
							style="background-image: url('../images/championIcon/i<%=vo.getChamp_no()%>.png');"
							 title="<%=title%>" onclick="detail(<%=vo.getChamp_no()%>)"></div>
						<span><%=vo.getName()%></span>
					</td>
				<%}%> 
				</tr>
			<%}%>
			</table>
<%@ include file="../inc/bottom.jsp"%>