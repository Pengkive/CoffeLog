<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- jquery 준비 끝 -->



<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="../main/main.jsp" style="margin-left: 5%;">CoffeeLog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../board1/list1.jsp">정보공유</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../board2/writeForm2.jsp">로그쓰기</a>
        </li>
  		<li class="nav-item">
          <a class="nav-link" href="../searchAPI/searchAPI.jsp">가게찾기</a>
        </li>	
      </ul>
    
       <div class="col"> </div>
       <div class="col"></div> 
 
<!-- id session 이 있는지 파악--> 
 <%
	String id = (String)session.getAttribute("id");
%>    
       <% 
    		if(id==null){
    	%>
     	<button class="btn btn-outline-success m-2" type="button" onclick="location.href='../LogIn/LoginForm.jsp'">로그인</button>      
     	<button class="btn btn-outline-primary" type="button" style="margin-right: 5%;" onclick="location.href='../member/signUpForm.jsp'">회원가입</button>      
      	<%} else{ %>
    	<%=id %>님 환영합니다!  
    	<button class="btn btn-outline-info " type="button" style="margin-left: 0.5%; " onclick="location.href='../member/info.jsp'">회원정보</button>
    	<button class="btn btn-outline-danger " type="button" style="margin-right: 5%; margin-left: 0.4%;" onclick="location.href='../member/logOut.jsp'">로그아웃</button>
    	<%} %>
     
    </div>
  </div>
</nav>
</head>

<body>
	<br>
</body>
</html>