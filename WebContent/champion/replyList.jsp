<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("newLine", "\r\n");
%>
<script type="text/javascript">
	$(function() {
		$('.delReply').click(function(){
			
			var rId = $(this).find("span").html();
			
			var result = confirm('댓글을 정말로 삭제 하시겠습니까?');
			var id = '<c:out value="${userid }"/>';
			
			if(result){
				window.open('<%=request.getContextPath()%>/board/deleteNonuser.gg?no=' + rId + '&code=C&userid=' + id, 'viewer', 'width=400, height=400');
			}else{
				return false;
			}
			
			
		});
	});
</script>
<br>
<br>
<hr>
<h2>한줄평</h2>
<table id="reply" class="table">
	<colgroup>
		<col width="10%">
		<col width="50%">
		<col width="15%">
		<col width="25%">
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>닉네임</th>
		<th>작성일</th>
	</tr>
	<c:set var="num" value="${page.num }"></c:set>
	<c:set var="curPos" value="${page.curPos }"></c:set>
	<c:if test="${empty bdList }">
		<tr>
			<td colspan="4" style="text-align: center;">
				<h3>한줄평이 없습니다</h3>
				<p style="color: gray; text-shadow: 3px 3px 14px grey">한줄평을
					작성하셔서 놀라운 일을 경험하세요!</p>
			</td>
		</tr>
	</c:if>
	<c:forEach var="idx" begin="1" end="${page.pageSize }">
		<c:set value="${bdList[curPos] }" var="bdVo"></c:set>
		<c:if test="${num >= 1 }">
			<tr style="cursor: pointer;">
				<td>${num }</td>
				<td class="row1">${bdVo.title }</td>
				<td><a class="aSelect" id="uId">${bdVo.userid }</a></td>
				<td><fmt:formatDate value="${bdVo.regdate }"
						pattern="yyyy-MM-dd" /> <span> <!-- 삭제버튼 --> <c:if
							test="${userid == bdVo.userid }">
							<a href="#" class="delReply" ><img alt="삭제"
								src='<c:url value="/images/deleteIcon.png" />'
								style="margin-left: 20px;"><span style="display: none;">${bdVo.no }</span></a>
						</c:if>
				</span></td>
			</tr>
			<tr class="content1">
				<td colspan="4" style="text-align: left;">${fn:replace(bdVo.describe, newLine, '<br>') }</td>
			</tr>
			<c:set var="curPos" value="${curPos + 1 }"></c:set>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:if>
	</c:forEach>
</table>
<div style="text-align: center">
	<ul class="pagination pagination-sm">
		<c:if test="${page.firstPage} > 1">
			<li class="previous"><a
				href="<c:url value='/champion/detail.gg?currentPage=${page.firstPage-1}&no=${param.no }' />">Previous</a></li>
		</c:if>
		<c:forEach begin="${page.firstPage }" end="${page.lastPage }" var="i">
			<c:if test="${!(i > page.totalPage) }">
				<c:if test="${i != page.currentPage }">
					<li><a
						href="<c:url value='/champion/detail.gg?currentPage=${i}&no=${param.no }' />">${i }</a></li>
				</c:if>
				<c:if test="${i == page.currentPage }">
					<li class="active"><a
						href="<c:url value='/champion/detail.gg?currentPage=${i}&no=${param.no }' />">${i }</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${page.lastPage < page.totalPage }">
			<li class="next"><a
				href="<c:url value='/champion/detail.gg?currentPage=${page.lastPage+1}&no=${param.no }' />">Next</a></li>
		</c:if>
	</ul>
</div>