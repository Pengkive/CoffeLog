<%@page import="com.coffeelog.member.memberDAO"%>
<%@page import="com.coffeelog.member.memberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String id = request.getParameter("id");
System.out.println("전달된 값 : " +id);
// 한글처리
request.setCharacterEncoding("utf-8");
// 전달정보를 저장(자바빈객체 - 액션태그) id, pw
%>
<jsp:useBean id="mb" class="com.coffeelog.member.memberBean"/>
<jsp:setProperty property="*" name="mb"/>

	<%
	System.out.println("전달 정보 : " + mb);
	memberDAO mdao = new memberDAO();
	
	int idCheck = mdao.idCheck(id);      
	%><%=idCheck %>