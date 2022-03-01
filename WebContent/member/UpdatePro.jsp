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
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	String address3=request.getParameter("address3");
	String address = address1+"/"+address2+"/"+address3;
	
	
%>

	<jsp:useBean id="mb" class="com.coffeelog.member.memberBean"/>
	<jsp:setProperty property="*" name="mb"/>

<%
		mb.setAddress(address);

		request.setCharacterEncoding("utf-8");

		memberDAO mdao = new memberDAO(); // DAO 를 하나 만들어줍니다
		
		mdao.MemberUpdatePro(mb);
		
		response.sendRedirect("../main/main.jsp");
%>

</body>
</html>