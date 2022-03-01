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
<jsp:useBean id="cb" class="com.coffeelog.board.CommentBean"/>
<jsp:setProperty property="*" name="cb"/>

<%
	request.setCharacterEncoding("utf-8");
	int info_b_num = Integer.parseInt(request.getParameter("info_b_num")); //board 번호
	String c_content = request.getParameter("c_content");
	String c_id = request.getParameter("c_id");	

	CommentDAO cdao = new CommentDAO();
	System.out.println("cb 정보" + cb);
	cdao.commentWrite(cb);
%>

</body>
</html>