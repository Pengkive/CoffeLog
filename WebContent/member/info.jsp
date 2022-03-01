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

	<% 
		String id = (String)session.getAttribute("id");
		memberDAO mdao = new memberDAO(); 
		memberBean mb = new memberBean();
		mdao.MemberInfo(mb);
	%>

<body>

<jsp:include page="../Include/nav.jsp"/>

<!-- 세션 만료시 로그인 페이지로 안내 -->
	<%
  	if(id==null){
  	%>
  		<script>
	  		location.href="../LogIn/LoginForm.jsp";
  		</script>
  	<%}%>

<!-- 본문 내용 -->

<div class="container">

		<form name="Member" action="infoPro.jsp" method="post">
			<div class="form-group col-6 mx-auto">
				<label for="inputid" class="form-label">ID</label>
				<input type="text" id="id" name="id" class="form-control" value="<%=id%>" readonly><br>
	
				<label for="inputpw" class="form-label">PW</label>
				<input type="password" id="pw" name="password" class="form-control" aria-describedby="inputpw">
				<div id="passwordHelpBlock" class="form-text"> 비밀번호를 입력해주세요. </div><br>
			</div>
			<div class="form-group col-3 mx-auto">
			 	<input type="submit" class="btn btn-success" value="회원정보 보기" >&nbsp;&nbsp;
				<input type="button" class="btn btn-danger" value="메인으로" onclick="location.href='../main/main.jsp'">
			</div>
		</form>
		
</div>

<!-- 본문 내용 끝 -->

</body>

</html>