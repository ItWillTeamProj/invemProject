<%@page import="com.invem.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<link rel="stylesheet" type="text/css" href="../css/member/edit.css" />
<%
	if(userid == null || userid.isEmpty()){
	%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			location.href = "<%=request.getContextPath()%>/index.gg";
		</script>
	<% return;
	}
	
	MemberDTO memVo = (MemberDTO)request.getAttribute("memVo");
	String hp = memVo.getPhoneno();
	String hp1 = "";
	String hp2 = "";
	String hp3 = "";
	String email = memVo.getEmail();
	String email1 = "";
	String email2 = "";

	if (hp != null && !hp.isEmpty()) {
		hp1 = hp.split("-")[0];
		hp2 = hp.split("-")[1];
		hp3 = hp.split("-")[2];
	}
	if (email != null && !email.isEmpty()) {
		email1 = email.split("@")[0];
		email2 = email.split("@")[1];
	}

	int counter = 0;
	String[] emailList = {"naver.com", "hanmail.net", "nate.com", "gmail.com"};
	boolean isEtc = false;
	if (email != null && !email.isEmpty()) {
		for (int i = 0; i < emailList.length; i++) {
			if (emailList[i].equals(email2)) {
				counter++;
				break;
			}
		}

		if (counter == 0) {
			isEtc = true;
		}
	}
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js">
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if($('#pwd').val()!=$('#pwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwd2').focus();
				event.preventDefault();
			}			
		});//click
	
</script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">

		function openDaumZipAddress() {

			new daum.Postcode({

				oncomplete:function(data) {
					
					jQuery("#zipcode").val(data.zonecode);

					jQuery("#address").val(data.address);

					console.log(data);

				}

			}).open();

		}

	</script>
<style type="text/css">

</style>
<article>
	<div class="divForm">
		<form name="frm1" method="post"
			action="<%=request.getContextPath()%>/login/signup_ok.gg">
			<fieldset>
				<legend style="margin-left: 80px">회원 정보 수정</legend>
				<div>
					<label for="userid">회원ID</label> 
					<span><%=memVo.getUserid() %></span>
				</div>
				<div>
					<label for="nickname">닉네임</label> <input type="text"
						name="nickname" id="nickname" value="<%=memVo.getNickname()%>">
				</div>
				<div>
					<label for="pwd">비밀번호</label> <input type="Password" name="pwd"
						id="pwd">
				</div>
				<div>
					<label for="pwd2">비밀번호 확인</label> <input type="Password"
						name="pwd2" id="pwd2">
				</div>
				<div>
					<label for="name">이름</label> 
					<span><%=memVo.getName() %></span>
				</div>
				<div>
					<label for="dateofbirth">생년월일<br>(yy-mm-dd)
					</label> <input type="text" name="dateofbirth" id="dateofbirth"
						style="margin-top: 15px;" value="<%=memVo.getDateofbirth()%>">
				</div>
				<div style="margin-top: 8px;">
					<label for="phoneno1">핸드폰</label><select name="phoneno1"
						id="phoneno1" title="휴대폰 앞자리">
						<option value="010"<%if(hp1.equals("010")){%> selected="selected" <%} %>>010</option>
			            <option value="011"<%if(hp1.equals("011")){%> selected="selected" <%} %>>011</option>
			            <option value="016"<%if(hp1.equals("016")){%> selected="selected" <%} %>>016</option>
			            <option value="017"<%if(hp1.equals("017")){%> selected="selected" <%} %>>017</option>
			            <option value="018"<%if(hp1.equals("018")){%> selected="selected" <%} %>>018</option>
			            <option value="019"<%if(hp1.equals("019")){%> selected="selected" <%} %>>019</option>
					</select> - <input type="text" name="phoneno2" id="phoneno2" maxlength="4"
						title="휴대폰 가운데자리" class="width_80" style="width: 50px;" value="<%=hp2%>"> -
					<input type="text" name="phoneno3" id="phoneno3" maxlength="4"
						title="휴대폰 뒷자리" class="width_80" style="width: 50px;" value="<%=hp3%>">
				</div>
				<div>
					<label for="email1">이메일 주소</label> <input type="text" name="email1"
						id="email1" title="이메일주소 앞자리" style="width: 90px;" value="<%=email1%>">@ <select
						name="email2" id="email2" title="이메일주소 뒷자리">
						<%for(int i = 0; i < emailList.length; i++){ %>
				            <option value="<%=emailList[i] %>"
				            <%if(email2.equals(emailList[i])){%> 
				            selected="selected" <%} %>
				            ><%=emailList[i] %></option>
			            <%} %>
			            <option value="etc"<%if(isEtc){%> selected="selected" <%} %>>직접입력</option>
					</select> <input type="text" name="email3" id="email3"
						title="직접입력인 경우 이메일주소 뒷자리"
						<%if(isEtc){%> 
			        		style="visibility:visible;" value="<%=email2 %>" 
			        	<%}else{%> 
			        		style="visibility:hidden;" 
			        	<%} %>>
				</div>
				<div>
					<label for="zipcode">우편번호</label>
					<!-- ReadOnly -->
					<input type="text" name="zipcode" id="zipcode" title="우편번호"
						style="margin-top: 1px;" value="<%=memVo.getZipcode()%>"> <input type="Button"
						value="우편번호 찾기" id="btnZipcode" title="새창열림" onClick="openDaumZipAddress();"><br /> <span
						class="sp1">주소</span> <input type="text" id="address" name="address" title="주소"
						class="width_350" style="margin-top: 2px;" value="<%=memVo.getAddress()%>"><br /> <span
						class="sp1">상세주소</span> <input type="text" name="addressDetail"
						title="상세주소" class="width_350" style="margin-top: 4px;">
				</div>
				<div>
					<label for="sum_name">소환사명</label> <input type="text"
						name="sum_name" id="sum_name" style="margin-top: 3px;" value="${memVo.sum_name}">
				</div>
				<div class="center">
					<input type="submit" id="wr_submit" value="회원가입"> <input
						type="reset" value="돌아가기" onclick="history.back(-1);">
				</div>
			</fieldset>

			<input type="hidden" name="chkId" id="chkId"> <input
				type="hidden" name="caution" id="caution">

		</form>
	</div>
</article>

<%@ include file="../inc/bottom.jsp"%>