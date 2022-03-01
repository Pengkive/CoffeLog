<%@page import="com.coffeelog.member.memberDAO"%>
<%@page import="com.coffeelog.member.memberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CafeLog</title>

</head>
<body>

	<jsp:useBean id="mb" class="com.coffeelog.member.memberBean"/>
	<jsp:setProperty property="*" name="mb"/>

	<%
	//	System.out.println("회원 : " + mb);

	memberDAO mdao = new memberDAO();
	
    // 로그인 성공 시 , 
	if(mdao.login(mb)==1){
		
		// id 정보를 session 내장객체에 저장
	    session.setAttribute("id", mb.getId() );
	   
    //main.jsp 페이지 이동 
    %>
  	     <script type="text/javascript">
  	        alert("<%=mb.getId()%>님 환영합니다!");
  	        location.href="../main/main.jsp";
  	     </script>
   	<%
   	}else if(mdao.login(mb) == 0){
    		 //비밀번호 다름.(+ 회원이다)
    %>
    		 <script type="text/javascript">
    		   alert(" 비밀번호 오류!!! ");
    		   history.back();
    		 </script>    		 
    <%
    	 // 비회원이다.
     }else{
    %>
		 	<script type="text/javascript">
		    // confirm(" 비회원 입니다. 회원가입 하겠습니까? ")
		    // Y - 회원가입 페이지 이동, N -페이지 뒤로가기
		    var result = confirm(" 비회원 입니다. 회원가입 하겠습니까? ");
		    
		    if(result){
		    	location.href="../member/signUpForm.jsp";
		    }else{
		    	 history.back();
		    }
		   //alert(" 비회원 입니다 !!! ");
		  
		 </script>    		 
	<%
	}
	%>
</body>
</html>