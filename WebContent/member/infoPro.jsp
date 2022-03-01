<%@page import="com.coffeelog.board.BoardDAO"%>
<%@page import="com.coffeelog.board.BoardBean"%>
<%@page import="com.coffeelog.member.memberBean"%>
<%@page import="com.coffeelog.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
	
		memberDAO mdao = new memberDAO();
		memberBean mb = new memberBean();
	
		mb.setId(id);
		mb.setPassword(password);
		
		if (mdao.MemberInfo(mb) == 1) {
			response.sendRedirect("UpdateForm.jsp");
		} else if (mdao.MemberInfo(mb) == 0) {
			%>
			<!-- 비밀번호 일치 하지않을때 -->
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다");
				history.back();
			</script>
			<%
		} else {
	%>
	<!-- 세션 종료됐을시 (아이디값x) -->
	<script type="text/javascript">
		alert("로그인을 해주세요");
		location.href = "LogIn/logInForm.html";
	</script>
	<%
		}
	%>

</body>
</html>