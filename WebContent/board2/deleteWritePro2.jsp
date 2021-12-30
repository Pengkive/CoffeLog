<%@page import="com.coffeelog.board.BoardDAO"%>
<%@page import="com.coffeelog.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro.jsp</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.WriteLogDelete(num);
		
		
		response.sendRedirect("list2.jsp");
		
	%>
	







</body>
</html>