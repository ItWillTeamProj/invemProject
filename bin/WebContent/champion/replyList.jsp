<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<br><br>
<hr>
<h2>한줄평</h2>
<table id="reply">
	<colgroup>
	<col width="10%">
	<col width="55%">
	<col width="15%">
	<col width="20%">
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>닉네임</th>
		<th>작성일</th>
	</tr>
	<c:set var="num" value="${page.num }"></c:set>
	<c:set var="curPos" value="${page.curPos }"></c:set>
	<c:forEach var="idx" begin="1" end="${page.pageSize }">
		<c:set value="${bdList[curPos] }" var="bdVo"></c:set>
		<c:if test="${num >= 1 }">
			<tr>
				<td>${num }</td>
				<td class="row1">${bdVo.title }</td>
				<td><a class="aSelect">${bdVo.userid }</a></td>
				<td><fmt:formatDate value="${bdVo.regdate }" pattern="yyyy-MM-dd"/>
				<span>
				<!-- 삭제버튼 -->
				<a href="#"><img alt="삭제" src="" style="margin-left: 20px;"></a>
				</span></td>
			</tr>
			<tr class="content1"><td colspan="4">${bdVo.describe }</td></tr>
			<c:set var="curPos" value="${curPos + 1 }"></c:set>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:if>
	</c:forEach>
</table>
<div style = "text-align: center">
		<ul class="pagination pagination-sm">
		<c:if test="${page.firstPage} > 1">
			<li class="previous"><a href="<c:url value='/champion/detail.gg?currentPage=${page.firstPage-1}&no=${param.no }' />">Previous</a></li>
		</c:if>
		<c:forEach begin="${page.firstPage }" end="${page.lastPage }" var="i">
			<c:if test="${!(i > page.totalPage) }">
				<c:if test="${i != page.currentPage }">
					<li><a href="<c:url value='/champion/detail.gg?currentPage=${i}&no=${param.no }' />">${i }</a></li>
				</c:if>
				<c:if test="${i == page.currentPage }">
					<li class="active"><a href="<c:url value='/champion/detail.gg?currentPage=${i}&no=${param.no }' />">${i }</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${page.lastPage < page.totalPage }">
			<li class="next"><a href="<c:url value='/champion/detail.gg?currentPage=${page.lastPage+1}&no=${param.no }' />">Next</a></li>
		</c:if>
		</ul>
	</div>