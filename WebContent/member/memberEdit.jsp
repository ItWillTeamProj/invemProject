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
	String detail = "";

	if (hp != null && !hp.isEmpty()) {
		hp1 = hp.split("-")[0];
		hp2 = hp.split("-")[1];
		hp3 = hp.split("-")[2];
	}
	if (email != null && !email.isEmpty()) {
		email1 = email.split("@")[0];
		email2 = email.split("@")[1];
	}
	
	if (detail != null && !detail.isEmpty()) {
		detail="";
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
		$('#btnChkId').click(function(){
			var userid=$('#userid').val();
			
			window.open('<%=request.getContextPath()%>/member/checkUserid.gg?userid='+userid,'chk',
				'width=400,height=300,left=0,top=0,location=yes,resizable=yes');	
		});
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<style type="text/css">
	.divForm fieldset {
	  min-width: 0;
	  padding: .35em .625em .75em;
	  margin: 0 2px;
	  margin-top: 30px;
	  border:1px solid silver;
	  border-radius: 0.5em;
	  border-color: #6db92a;
	  background-color:white;
	}
	label{
	font-size:13px;
	}
	body, td, th, span, p{
	font-size:13px;
	}
	.divForm label, .divForm .sp1{
	width:40%;
	}
	form{
	margin-left:50px;
	}
</style>
<article>
	<div class="divForm">
		<form name="frm1" method="post"
			action="<%=request.getContextPath()%>/login/memberEdit_ok.gg">
			<fieldset>
				<h2 style="text-align:center;">회원 정보 수정</h2>
				<div>
					<label for="userid">회원ID</label>
					<input type="text" name="userid" id="userid" value="<%=memVo.getUserid() %>" style="ime-mode:inactive">&nbsp;
        			<input type="button" value="중복확인" id="btnChkId" title="새창열림"> 
				</div>
				<div>
					<label for="nickname">닉네임</label> <input type="text"
						name="nickname" id="nickname" value="<%=memVo.getNickname()%>">
				</div>
				<div>
					<label for="pwd">비밀번호</label> 
					<input type="Password" name="pwd" id="pwd">
				</div>
				<div>
					<label for="pwd2">비밀번호 확인</label> 
					<input type="Password" name="pwd2" id="pwd2">
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
					<input type="text" name="zipcode" id="sample4_postcode" title="우편번호" 
					style="margin-top: 1px;" placeholder="우편번호" value="<%=memVo.getZipcode()%>">
					<input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onClick="openDaumZipAddress();"><br>
					<span class="sp1">주소</span>
					<input type="text" id="address" name="address" title="주소" class="width_350"
					style="margin-top: 2px;" value="<%=memVo.getAddress()%>"><br> 
					<span class="sp1">상세주소</span>
					<input type="text" name="addressDetail"	title="상세주소" class="width_350"
					style="margin-top: 4px;" value="<%=memVo.getDetail()%>">
				</div>
				<div>
					<label for="sum_name">소환사명</label> <input type="text"
						name="sum_name" id="sum_name" style="margin-top: 3px;" value="${memVo.sum_name}">
				</div>
				<div class="center">
					<input type="submit" id="wr_submit" value="수정완료"> <input
						type="reset" value="돌아가기" onclick="history.back(-1);">
				</div>
			</fieldset>

			<input type="hidden" name="chkId" id="chkId">

		</form>
	</div>
</article>

<%@ include file="../inc/bottom.jsp"%>