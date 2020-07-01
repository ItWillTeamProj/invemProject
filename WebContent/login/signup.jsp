<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if(!validate_userid($('#userid').val())){
				alert('아이디는 영문대소문자,숫자,_만 가능합니다!');
				$('#userid').focus();
				event.preventDefault();
			}else if($('#nickname').val().length<1){
				alert('닉네임을 입력해주세요!');
				$('#nickname').focus();
				event.preventDefault();
			}else if($('#pwd').val().length<1){
				alert('비밀번호를 입력해주세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if($('#pwd').val()!=$('#pwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwd2').focus();
				event.preventDefault();
			}else if($('#name').val().length<1){
				alert('이름을 입력해주세요!');
				$('#name').focus();
				event.preventDefault();
			}else if($('#dateofbirth').val().length<1){
				alert('생일을 입력해주세요!');
				$('#dateofbirth').focus();
				event.preventDefault();
			}else if($('#postcode').val().length<1){
				alert('우편번호을 입력해주세요!');
				$('#zipcode').focus();
				event.preventDefault();
			}else if($('#roadAddress').val().length<1){
				alert('주소를 입력해주세요!');
				$('#address').focus();
				event.preventDefault();
			}else if($('#chkId').val()!=='Y'){
				alert('아이디 중복확인을 하셔야 합니다.');
				$("#btnChkId").focus();
				event.preventDefault();
			}			
		});
		$('#email2').change(function(){
			if($(this).val()=='etc'){
				$('#email3').val("");
				$('#email3').css('visibility','visible');
				$('#email3').focus();				
			}else{
				$('#email3').css('visibility','hidden');
			}
		});
		
		$('#btnChkId').click(function(){
			var userid=$('#userid').val();
			
			window.open('<%=request.getContextPath()%>/member/checkUserid.gg?userid='+userid,'chk',
	'width=400,height=300,left=0,top=0,location=yes,resizable=yes');	
		});
		
	});
	
	function validate_userid(id){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);
	}

	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	
	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
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
<form name="frm1" method="post" action="<%=request.getContextPath() %>/login/signup_ok.gg">
<fieldset>
	<h2 style="text-align:center;">회원 가입</h2>
    <div>
        <label for="userid">회원ID(필수)</label>
        <input type="text" name="userid" id="userid" placeholder="중복확인(필)" style="ime-mode:inactive">&nbsp;
        <input type="button" value="중복확인" id="btnChkId" title="새창열림">
    </div>
    <div>        
        <label for="nickname">닉네임(필수)</label>
        <input type="text" name="nickname" id="nickname" >
    </div>
    <div>
        <label for="pwd">비밀번호(필수)</label>
        <input type="Password" name="pwd" id="pwd">
    </div>
    <div>
        <label for="pwd2">비밀번호 확인(필수)</label>
        <input type="Password" name="pwd2" id="pwd2">
    </div>
    <div>        
        <label for="name">이름(필수)</label>
        <input type="text" name="name" id="name" >
    </div>
    <div>        
        <label for="dateofbirth">생년월일(필수)<br>(yy-mm-dd)</label>
        <input type="text" name="dateofbirth" id="dateofbirth" placeholder="(-)을 넣어주세요" style="margin-top: 15px;">
    </div>
   	<div style="margin-top: 8px;">
        <label for="phoneno1">핸드폰</label><select name="phoneno1" id="phoneno1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="phoneno2" id="phoneno2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" style="width:50px;">
        -
        <input type="text" name="phoneno3" id="phoneno3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" style="width:50px;">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리" style="width:90px;">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>
    <div>
        <label for="zipcode">우편번호(필수)</label><!-- ReadOnly -->
    	<input type="text" name="zipcode" id="postcode" title="우편번호" style="margin-top: 1px;" placeholder="우편번호">
		<input type="button" id="btnZipcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
        <span class="sp1">주소</span>
		<input type="text" name="address" id="roadAddress" placeholder="도로명주소" style="width: 255px; margin-top: 2px;"><br>
		<span class="sp1">상세주소</span>
		<input type="text" name="detail" id="addressDetail" placeholder="상세주소" style="margin-top: 4px; width:255px;">
    </div>
    <div>        
        <label for="sum_name">소환사명</label>
        <input type="text" name="sum_name" id="sum_name" style="margin-top: 3px;">
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="회원가입">
         <input type="reset" value="돌아가기" onclick="history.back(-1);">
    </div>
</fieldset>
    <input type ="text" name="chkId" id="chkId">
    <input type ="hidden" name="caution" id="caution">
        
</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp" %>