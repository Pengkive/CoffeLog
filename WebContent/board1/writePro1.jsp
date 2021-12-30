<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bb" class="com.coffeelog.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%

	BoardDAO bdao = new BoardDAO();
	
	bdao.insertWrite(bb);
	
	response.sendRedirect("list1.jsp");
%>




