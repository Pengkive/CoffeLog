<%@page import="com.coffeelog.board.BoardBean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../Include/nav.jsp"></jsp:include>
<body>

  <%
   // 전달방식에 따라서 한글처리(post)
   // updateForm.jsp?num=14&pageNum=1
   // 전달된 정보(파라미터)있으면 저장
   
   int num = Integer.parseInt(request.getParameter("num"));
  
   // DB에서 글번호에 해당하는 정보를 가져와서 출력
   
   // DAO 객체 생성
   BoardDAO bdao = new BoardDAO();
   
   // 글번호에 해당하는 정보를 가져오는 메서드 
   BoardBean bb = bdao.getBoard(num);
 
  
  %>
  
  <!-- Db에 처리해야하는 데이터 폼태그 안에 저장(hidden)
            "  안하는 경우  주소줄에 저장(url)
   -->
  <div class="container-sm">
	<!-- 전체 row 시작 -->
  <div class="row">
	<div class="col-3"></div>
		<div class="col-6">
		
			<form name="board1" action="updatePro.jsp" method="post">
					<input type="hidden" name="num" value="<%=num%>">
				<div class="row">
					<label for="input-subject" class="form-label">제목</label> 
					<input type="text" id="subject" name="subject" class="form-control" align="center" value="<%=bb.getSubject() %>" required >
				</div><br>
			
				<div class="row">
				  <div class="form-floating">
					<textarea class="form-control" name="content"
							  id="floatingTextarea2" style="height: 350px; width: 750px;" required><%=bb.getContent() %></textarea>
					<label for="floatingTextarea2">내용</label>
				  </div>
			    </div> <br>
					
				 <div align="center">
					<input type="submit" class="btn btn-success" value="수정">
				 </div>
					<input type="button" class="btn btn-success" value="취소" onclick="location.href='content.jsp?num=<%=bb.getNum()%>&subject=<%=bb.getSubject()%>';">
			</form>
			
		</div>
	<div class="col-3"></div>

	
  </div><!-- 전체 row 끝 -->
</div><!-- 전체 container 끝 -->

</body>
<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp" />
</html>