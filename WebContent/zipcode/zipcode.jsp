<%@page import="com.invem.common.PagingVO"%>
<%@page import="com.invem.zipcode.model.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="zipcodeService" 
	class="com.invem.zipcode.model.ZipcodeService" 
	scope="session"></jsp:useBean> 
<%

	//1
	request.setCharacterEncoding("utf-8");
	String dong=request.getParameter("dong");
	
	//2
	int totalRecord=0;
	List<ZipcodeVO> list=null;
	if(dong!=null && !dong.isEmpty()){
		try{
			list=zipcodeService.selectZipcode(dong);	
			
			totalRecord=list.size(); //전체 레코드 개수, 예)17
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		dong="";
	}
	
	//3
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null 
		&& !request.getParameter("currentPage").isEmpty()){
		currentPage
		=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize=10; //한 페이지에 보여줄 레코드 개수
	int blockSize=10; //블럭 사이즈 1~10, 11~20 => 10
	
	PagingVO pageVo 
		= new PagingVO(currentPage, totalRecord, pageSize, blockSize);
			
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#dong').focus();
		
		$('form[name=frmZip]').submit(function(){
			if($('#dong').val().length<1){
				alert('지역명을 입력하세요');
				$('#dong').focus();
				event.preventDefault();
			}	
		});
	});
	
	function setZipcode(zipcode, address){
		$(opener.document).find("#zipcode").val(zipcode);
		$(opener.document).find("input[name=address]").val(address);
		
		self.close();
	}
</script>
<style type="text/css">
	.box2{
		width: 470px;
	}
	
	#divZip{
		margin: 10px 0;
	}
	label{
		font-size: 0.9em;
	}
	.divPage{
		text-align: center;
		margin: 7px 0;
	}
</style>
</head>
<body>
	<h1>우편번호 검색</h1>
	<p>찾고 싶으신 주소의 동(읍,면)을 입력하세요</p>
	<form name="frmZip" method="post" action="<%=request.getContextPath() %>/zipcode.gg">
		<label for="dong">지역명</label>
		<input type="text" name="dong" id="dong">
		<input type="submit" value="찾기">
	</form>	
	<%if(list!=null){ %>
		<div id="divZip">
			<table class="box2" 
			summary="우편번호 검색 결과에 관한 표로써 우편번호,주소에 대한 정보를 제공합니다">
				<colgroup>
					<col style="width: 20%">
					<col style="width: *">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">우편번호</th>
						<th scope="col">주소</th>
					</tr>
				</thead>	
				<tbody>
					<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="2" class="align_center">
								해당하는 주소가 존재하지 않습니다.
							</td>
						</tr>
					<%}else{ %>
						<!-- 반복 시작 -->
						<%
						int num=pageVo.getNum();
					  	int curPos=pageVo.getCurPos();
					  	
					  	for(int i=0;i<pageVo.getPageSize();i++){
					  		if(num-- < 1) break; 
							ZipcodeVO vo=list.get(curPos++);
							
							String bunji=vo.getStartbunji();
							String endBunji=vo.getEndbunji();
							if(endBunji!=null && !endBunji.isEmpty()){
								bunji = bunji+" ~ "+ endBunji;
							}
									
							String address=vo.getSido()+" "
								+vo.getGugun()+" " + vo.getDong();
						%>
							<tr>
								<td><%=vo.getZipcode() %></td>
								<td>
								<a href="#" onclick="setZipcode('<%=vo.getZipcode()%>','<%=address%>')">
									<%=address %> <%=bunji %>
								</a>
								</td>
							</tr>
						<%}//for %>
						<!-- 반복 끝 -->
					<%}//if %>
				</tbody>
			</table>
			
			<div class="divPage">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 ◀ -->
			<%if(pageVo.getFirstPage()>1){ %>
				<a href="zipcode.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&dong=<%=dong%>">
					<img src="../images/first.JPG" alt="이전 블럭으로 이동">
				</a>
			<%} %>
			
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
				if(i > pageVo.getTotalPage()) break;
			%>
				<%if(i!=currentPage){%>
					<a href="zipcode.jsp?currentPage=<%=i%>&dong=<%=dong%>">[<%=i %>]</a>
				<%}else{ %>
					<span style="color:blue;font-weight:bold"><%=i %></span>
				<%}//if %>					
			<%}//for %>	
			
			<!-- 다음 블럭으로 이동 ▶ -->
			<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
				<a href="zipcode.jsp?currentPage=<%=pageVo.getLastPage()+1%>&dong=<%=dong%>">
					<img src="../images/last.JPG" alt="다음 블럭으로 이동">
				</a>
			<%} %>
			<!--  페이지 번호 끝 -->
		</div>
		</div>
	<%}//if %>	
</body>
</html>






