<%@page import="com.coffeelog.member.memberDAO"%>
<%@page import="com.coffeelog.member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String address=address1+"/"+address2+"/"+address3;
		
		memberBean mb = new memberBean();
		
		mb.setId(id);
		mb.setPassword(password);
		mb.setName(name);
		mb.setGender(gender);
		mb.setEmail(email);
		mb.setPhone(phone);
		mb.setAddress(address);
		
		memberDAO mdao = new memberDAO();
		
		mdao.insertSign(mb);
		
		response.sendRedirect("../main/main.jsp");
%>
