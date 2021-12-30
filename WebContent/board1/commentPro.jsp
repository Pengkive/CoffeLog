<%@page import="com.coffeelog.board.CommentDAO"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
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
	int num = Integer.parseInt(request.getParameter("num")); //board 번호
	int pageNum = Integer.parseInt(request.getParameter("pageNum")); //board 페이지 번호
	
%>
<jsp:useBean id="cb" class="com.coffeelog.board.CommentBean"/>
<jsp:setProperty property="*" name="cb"/>

<%

	CommentDAO cdao = new CommentDAO();
	
	cdao.commentWrite(cb);
	
	response.sendRedirect("");
%>
</body>
</html>