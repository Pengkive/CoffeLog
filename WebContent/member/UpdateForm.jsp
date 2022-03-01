<%@page import="com.coffeelog.member.memberBean"%>
<%@page import="com.coffeelog.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>
</head>
<!-- 우편번호 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수
						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address2').value = fullAddr; // 선택한 주소 들어가는곳
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address3').focus(); //상세주소 동 호수 기입하는곳
					}
				}).open();
	}
</script>
<!-- 우편번호 api  -->

<!-- update() -->
<script type="text/javascript">
	function update() {
		
		var form = document.getElementById('Member');
		var pw = document.getElementById('pw').value;
		var email = document.getElementById('email').value;
		console.log(email);
		var phone = document.getElementById('phone').value;
		
		if (!checkPassword(id, pw)) {
			return false;
		}
		
		if(!checkPassword(pw)){
			return false;
		}
		
		if (!checkPhone(phone)){
			return false;
		}
		if (!checkMail(email)) {
			return false;
		}
		
		form.submit();
	}
	
	// 공백확인 함수
	function checkExistData(text, dataName) {
		if (text == "") {
			alert(dataName + " 입력해주세요!");
			return false;
		}
		return true;
	}
	
	function checkPassword(id, pw) {
		//비밀번호가 입력되었는지 확인하기
		if (!checkExistData(pw, "비밀번호를"))
			return false;
		var pwRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
		if (!pwRegExp.test(pw)) {
			alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			document.Member.pw.value() = "";
			document.Member.pw.focus();
			return false;
		}
		
		//아이디와 비밀번호가 같을 때..
		if (id == pw) {
			alert("아이디와 비밀번호는 같을 수 없습니다!");
			document.Member.pw.value() = "";
			document.Member.pw.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}
	
	function checkPhone(phone) {
		//연락처 형식 확인
		var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if (!phoneRegExp.test(phone)){
			alert("연락처를 확인해주세요 !");
			document.Memer.phone.value = "";
			document.Member.phone.focus();
			return false;
		} else if(phoneRegExp.test(phone).length < 14){
			alert("연락처를 확인해주세요 !");
		}
		return true;
	} 
	
	function checkMail(email) {
		//mail이 입력되었는지 확인하기
		if (!checkExistData(email, "이메일을"))
			return false;
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		
		if (!emailRegExp.test(email)) {
			alert("이메일 형식이 올바르지 않습니다!");
			document.Member.email.value = "";
			document.Member.email.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}
	
/* 탈퇴하기 function */	
	function memberDelete(){
		if(confirm("탈퇴하시겠습니까?")){
			location.href='deletePro.jsp';	
		}else{
			history.back;
		}
	}
	
	


</script> 

<jsp:include page="../Include/nav.jsp" />
<body>

	<!-- 본문 내용 -->

<%
	String id = (String) session.getAttribute("id");
	memberDAO mdao = new memberDAO();
	memberBean mb = new memberBean();
	mdao.MemberUpdate(mb, id);
	String[] addressArr = mb.getAddress().split("/");
%>

<div class="container" >
		<!-- 전체 row 시작 -->

	<form name="Member" action="UpdatePro.jsp" method="post" id="Member">
		<div class="col-6 mx-auto">
				
			<div class="row">
					<label for="inputid" class="form-label">ID</label> 
					<input type="text" id="id" name="id" class="form-control"
						value="<%=id%>" readonly><br>
			</div>
			
			<div class="row">
				<label for="inputpw" class="form-label">PW</label> 
				<input type="password" id="pw" name="password"
					class="form-control" aria-describedby="inputpw">
				<div id="passwordHelpBlock" class="form-text">
					비밀번호는 4자이상 12자 이하로 입력해주세요.<br>
				</div>
			</div>

			<div class="row">
				<label for="inputname" class="form-label">Name</label> <input
					type="text" id="name" name="name" class="form-control"
					value="<%=mb.getName()%>" readonly><br>
			</div>
			<div class="row">
				<label for="inputgender" class="form-label">Gender</label>
			</div>

			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="gender" value="남자" 
					<%if (mb.getGender().equals("남자")) {%> checked <%}%>> <label
					class="form-check-label">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="gender" value="여자"
					<%if (mb.getGender().equals("여자")) {%> checked <%}%>> <label
					class="form-check-label">여자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="gender" value="선택안함"
					<%if (mb.getGender().equals("선택안함")) {%> checked <%}%>> <label
					class="form-check-label">선택안함</label>
			</div>

			<div class="row">
				<label for="inputemail" class="form-label">E-mail</label> 
				<input type="email" id="email" name="email" class="form-control"
					value="<%=mb.getEmail()%>">
			</div>

			<div class="row">
				<label for="inputphone" class="form-label">Phone</label> <input
					type="text" id="phone" name="phone" class="form-control"
					value="<%=mb.getPhone()%>">
			</div>

			<div class="row">
				<label for="inputaddress" class="form-label">Address</label>
				 <input type="text" id="address1" name="address1" class="form-control" value="<%=addressArr[0]%>" readonly>
				 <input type="text" id="address2" name="address2" class="form-control" value="<%=addressArr[1]%>" readonly>
				 <input type="text" id="address3" name="address3" class="form-control" value="<%=addressArr[2]%>">
				 <input type="button" class="btn btn-warning" value="주소 찾기" onclick="DaumPostcode()">
			</div>
			<br>

			<div align="center">
				<input type="button" class="btn btn-success" value="수정완료" onclick="update()">
				<input type="reset" class="btn btn-danger" value="초기화">
				<button type="button" class="btn btn-secondary" onclick="memberDelete()">탈퇴하기</button>
			</div>

		</div>
	</form>
				
</div>
	<!-- 본문 내용 끝 -->

</body>

</html>