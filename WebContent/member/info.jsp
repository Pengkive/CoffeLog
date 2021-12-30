<%@page import="com.coffeelog.member.memberBean"%>
<%@page import="com.coffeelog.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

	<% 
		String id = (String)session.getAttribute("id");
		memberDAO mdao = new memberDAO(); 
		memberBean mb = new memberBean();
		mdao.MemberInfo(mb);
	%>

<body>

<jsp:include page="../Include/nav.jsp"/>

<!-- 본문 내용 -->

<div class="container-sm">
	<!-- 전체 row 시작 -->
	<div class="row">
	 <div class="col-3"></div>
	
		<div class="col-6">
	<form name="Member" action="infoPro.jsp" method="post">
	<div class="row">
		<div class="col-8">
			<label for="inputid" class="form-label">ID</label>
			<input type="text" id="id" name="id" class="form-control" value="<%=id%>" readonly><br>
		</div>
		
	</div>
	<div class="row">
		<label for="inputpw" class="form-label">PW</label>
		<input type="password" id="pw" name="password" class="form-control" aria-describedby="inputpw">
		<div id="passwordHelpBlock" class="form-text">
		비밀번호를 입력해주세요. <br>
		</div>
	</div>
	<br>
	<div align="center">
	 	<input type="submit" class="btn btn-success" value="회원정보 보기" >&nbsp;&nbsp;
		<input type="button" class="btn btn-danger" value="메인으로" onclick="a href='main.jsp'">
	</div>
	</form>
	</div>
		<div class="col-3"></div>
	
	</div>
	<!-- 전체 row 끝 -->

</div>

<!-- 본문 내용 끝 -->


</body>

</html>