<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%String id= (String)session.getAttribute("id"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보공유</title>

<jsp:include page="../Include/nav.jsp"></jsp:include>
</head>
<body>


<div class="container-sm">
	<!-- 전체 row 시작 -->
  <div class="row">
	<div class="col-3"></div>
		<div class="col-6">
		
			<form name="board1" action="writePro1.jsp" method="post">
					
					<input type="hidden" name="id" value="<%=id%>">
					
				<div class="row">
					<label for="inputpw" class="form-label">Subject</label> 
					<input type="text" id="subject" name="subject" class="form-control" align="center" required >
				</div><br>
			
				<div class="row">
				  <div class="form-floating">
					<textarea class="form-control" name="content" placeholder="내용을 적어주세요"
							  id="floatingTextarea2" style="height: 350px; width: 750px;" required></textarea>
					<label for="floatingTextarea2">내용</label>
				  </div>
			    </div> <br>
					
				 <div align="center">
					<input type="submit" class="btn btn-success" value="글쓰기">
				 </div>
			</form>
			
		</div>
	<div class="col-3"></div>

	
  </div><!-- 전체 row 끝 -->
</div><!-- 전체 container 끝 -->
</body>
</html>