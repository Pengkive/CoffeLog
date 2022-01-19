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
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO();
		bdao.updateReadcount(num);
	
		// DB에서 글번호(num)에 해당하는 글정보를 모두 가져와서 출력	
		BoardBean bb = bdao.getBoard(num);
		
	%>

	<script type="text/javascript">
	function info_delete(){
			   
	   		if(confirm("삭제하시겠습니까?")) {
	         	location.href="deleteWritePro.jsp?num=<%=num%>";
			} else {
				return;
			}

		}
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
		</div>

	</div>
<p/>


<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp" />
</body>
</html>