<%@page import="com.coffeelog.board.CommentBean"%>
<%@page import="com.coffeelog.board.CommentDAO"%>
<%@page import="com.coffeelog.board.BoardBean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if (id == null)
		id = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../Include/nav.jsp" />
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		// DB에서 글번호(num)에 해당하는 글정보를 모두 가져와서 출력	
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = bdao.getBoard(num);
		
		Cookie[] cookieRequest = request.getCookies();
		String cookieValue = null;
		for(int i=0; i<cookieRequest.length; i++){
			
			cookieValue = cookieRequest[0].getValue();
		}
		
		if(session.getAttribute(num+":cookie")== null){
				session.setAttribute(num+":cookie",num + ":" + cookieValue);		
		}else{
			session.setAttribute(num+":cookie ex", session.getAttribute(num+":cookie"));
			if (!session.getAttribute(num+":cookie").equals(num + ":" + cookieValue)) {
			 	session.setAttribute(num+":cookie", num + ":" + cookieValue);
			}
		}
		
		if (!session.getAttribute(num+":cookie").equals(session.getAttribute(num+":cookie ex"))) {
			bdao.updateReadcount(num);
		 	// 가시적으로  조회수 1 추가해줌
		 	bb.setReadcount(bb.getReadcount()+1);
	 	}
		
	%>


	<script type="text/javascript">
	function info_delete(){
			   
   		if(confirm("삭제하시겠습니까?")) {
         	location.href="deleteWritePro.jsp?num=<%=num%>";
		} else {
			return;
		}

	}

	$(function(){
		
		$('#btn_save').click(function(){
		
		var c_id = document.getElementById('c_id').value;
		
		var info_b_num = document.getElementById('info_b_num').value;
		
		var comment = document.getElementById('comment').value;

		<%if(id==""){%>
			alert("로그인 해주세요");
			location.href='../LogIn/LoginForm.jsp';
		<%}else{%>
			
			$.ajax({
				
				url:"commentWritePro.jsp",
				type:"post",
				data : {
					c_id : c_id,
					info_b_num : info_b_num,
					c_content : comment
				},
				sucess:function(data){
					
					console.log("데이터 보내기 성공");
				}
		
			});
		<%}%>
			
		});
	});
	
	
	</script>

	<div class="container">
		<div class="form-group col-6 mx-auto">
		
			<table class="table">
				<tr>
					<td scope="row" class="table-active">글번호</td>
					<td><%=bb.getNum()%></td>
					<td scope="row" class="table-active">조회수</td>
					<td><%=bb.getReadcount()%></td>
				</tr>
				<tr>
					<td scope="row" class="table-active">작성자</td>
					<td><%=bb.getId()%></td>
					<td scope="row" class="table-active">작성일</td>
					<td><%=bb.getReg_date()%></td>
				</tr>
				<tr>
					<td scope="row" class="table-active">글 제목</td>
					<td colspan="3"><%=bb.getSubject()%></td>
				</tr>
				<tr>
					<td scope="row" class="table-active">글내용</td>
					<td colspan="3"><%=bb.getContent()%></td>
				</tr>
				<tr>
					<td colspan="4">
						<%
						   if (bb.getId().equals(id) || id.equals("admin")) {
						%>
						<input type="button" class="btn btn-warning" value="수정하기" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>';">
						<input type="button" class="btn btn-danger" value="삭제하기" onclick="info_delete()">
						<% } 
						%>
						<input type="button" class="btn btn-secondary" value="목록으로" onclick="location.href='list1.jsp';">
					</td>
				</tr>
			</table>
		<!-- 댓글 시작 -->
		<% if(id!=""){%>
				<form id="commentWrite">
					<div class="input-group mb-3">
						<input type="hidden" id="c_id" name="c_id" value="<%=id%>">
						<input type="hidden" id="info_b_num" value="<%=bb.getNum()%>">
						<textarea id="comment" class="form-control" rows="1"></textarea>
						<button id="btn_save" class="btn btn-outline-secondary" type="button">등록</button>
					</div>
				</form>
		<%}%>		
<!-- 댓글 리스트 -->

		<!-- 댓글 끝 -->
		</div>
	</div>
<p/>


<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp" />
</body>
</html>