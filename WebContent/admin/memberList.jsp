<%@page import="com.invem.admincommon.model.AdminPagingVO"%>
<%@page import="com.invem.adminmember.model.AdminMemberService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.invem.adminmember.model.AdminMemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	AdminMemberService adminMemberService = new AdminMemberService();
	List<AdminMemberDTO> list = null;
	
	try{
		list = adminMemberService.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	//list.jsp?currentPage=2
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null 
		&& !request.getParameter("currentPage").isEmpty()){
		currentPage
		=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize = 5; //한 페이지에 보여줄 레코드 개수
	int blockSize = 10; //블럭 사이즈 1~10, 11~20 => 10
	int totalRecord = list.size(); //전체 레코드 개수, 예)17
	
	
	AdminPagingVO pageVo = new AdminPagingVO(currentPage, totalRecord, pageSize, blockSize);	
%>    
    
<%@ include file="../inc/top.jsp" %>

<article>
	<div style="margin-top: 10px; width: 720px; height:61px;
		background-size:100%; color:white; font-size: 30px; margin-bottom:10px;
		background-image: url('<%=request.getContextPath() %>/images/champion/header.png');">
		<div style="padding: 10px 10px 10px 15px;">
			<b>회원관리</b>
		</div>
	</div>
	
	<%if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
	<%}else{ 
		keyword="";
	} %>
	
	<p style="font-size: 18.7px; font-weight: bold; margin-top: 15px;">회원목록</p> <!-- 억지로맞춤 -->
	<div style="text-align: right; margin: 0px 10px 10px 10px;">
		<input type="Button" value="관리자 메인 페이지" onclick="location.href='admin.jsp'" />  
	</div>
	<div>
	<table class="memberBox"
		style="border-top :1px solid gray; border-bottom: 1px solid gray;
			font-size: 100%; border-collapse: collapse; margin-left: 10px; margin-right: 10px">
		<colgroup>
			<col style="width:110px;" />
			<col style="width:110px;" />
			<col style="width:110px;" />		
			<col style="width:210px;" />
			<col style="width:110px;" />
			<col style="width:50px;" />
		</colgroup>
		<thead style="background-color: lightgray; text-align: left;">
		  <tr>
		    <th scope="col">아이디</th>
		    <th scope="col">닉네임</th>
		    <th scope="col">이름</th>	    
		    <th scope="col">이메일</th>
		    <th scope="col">가입일</th>
		    <th scope="col">경고</th>
		  </tr>
		</thead>
		<tbody>
			<%if(list==null || list.isEmpty()){ %>
				<tr style="text-align: center;">
					<td colspan="6" >
						회원이 존재하지 않습니다.</td>
				</tr>			
			<%}else{
				
				int num=pageVo.getNum();
			  	int curPos=pageVo.getCurPos();	
					
				for(int i=0;i<pageSize;i++){
					if(num-- < 1) break;	
								
					AdminMemberDTO dto = list.get(curPos++);%>
			
					<tr style="text-align: left;">
						<td><a href="memberDetail.jsp?id=<%=dto.getUserid() %>"><%=dto.getUserid() %></a></td>
						<td><%=dto.getNickname() %></td>
						<td><%=dto.getName() %></td>					
						<td><%=dto.getEmail() %></td>
						<td><%=sdf.format(dto.getRegdate()) %></td>
						<td>&nbsp;<%=dto.getCaution() %>회</td>
					</tr>
					
				<%}//for 
			}%>
			  	<!--반복처리 끝  -->
		  </tbody>
	</table>	   
	</div>
	
	<div style="text-align: center; margin-top: 5px;">
		<div style="display: inline-block;">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 ◀ -->
		<ul style="float:left; list-style:none;">
			<%if(pageVo.getFirstPage()>1){ %>
				<a href="memberList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>">
					<li style="text-align:center; border:1px solid lightgray; margin:3px;
					width: 26px; height: 26px; padding-top: 1px;">
					◀</li><!-- <img src="../images/first.JPG" alt="이전 블럭으로 이동">  -->
				</a>
			<%} %>
		</ul>
		</div>
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<div style="display: inline-block;">
		<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
			if(i > pageVo.getTotalPage()) break;
		%>	<ul style="float:left; list-style:none;">
			<%if(i!=currentPage){%>
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
					<a href="memberList.jsp?currentPage=<%=i%>" style="color: black;"><%=i %></a>
				</li>
			<%}else{ %>
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; background-color: red; padding-top: 1px;">
					<span style="font-weight:bold; color: white"><%=i %></span>
				</li>
			<%}//if %>
			</ul>					
		<%}//for %>	
		</div>
		
		<!-- 다음 블럭으로 이동 ▶ -->
		<div style="display: inline-block;">
		<ul style="float:right; list-style:none;">
			
		<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href="memberList.jsp?currentPage=<%=pageVo.getLastPage()+1%>">
				<li style="text-align:center; border:1px solid lightgray; margin:3px;
				width: 26px; height: 26px; padding-top: 1px;">
				▶</li><!-- <img src="../images/last.JPG" alt="다음 블럭으로 이동"> -->
			</a>
		<%} %>
			
		</ul>
		</div>
		<!--  페이지 번호 끝 -->
	</div>
	
	<div class="divSearch" style="text-align: center;">
	   	<form name="frmSearch" method="post" action='<%=request.getContextPath() %>/admin/memberList.jsp'>
	        <select name="searchCondition" style="height:24px;">
	            <option value="userid" 
	            	<%if("userid".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >아이디</option>
	            <option value="name" 
	            	<%if("name".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >이름</option>
	            <option value="email" 
	            	<%if("email".equals(condition)){ %>
	            		selected="selected"
	            	<%} %>
	            >이메일</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="<%=keyword%>">   
			<input type="submit" value="검색">
	    </form>
	</div>
	
</article>
<%@ include file="../inc/bottom.jsp" %>