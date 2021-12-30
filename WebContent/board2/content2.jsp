<%@page import="com.coffeelog.board.Board2Bean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if (id == null)
		id = "";
	System.out.println("아이디 =>	" + id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- jquery 준비 끝 -->
<style type="text/css">
.table-active {
	width: 15%;
	text-align: center;
}
</style>

</head>
<jsp:include page="../Include/nav.jsp" />

<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO bdao = new BoardDAO();
		bdao.getLogBoard(num);

		Board2Bean bb2 = new Board2Bean();
		bb2 = bdao.getLogBoard(num);
	%>
	<script type="text/javascript">
	function delete2(){
			   
	   		if(confirm("삭제하시겠습니까?")) {
	         	location.href="deleteWritePro2.jsp?num=<%=num%>";
			} else {
				return;
			}

		}
	</script>

	<div type="container-sm">
		<div type="row">
			<div type="col-3"></div>
			<div type="col-6">
				<table class="table" style="width: 70%; margin: 0 auto;">
				<td colspan="4">
				<input type="button" value="목록으로" onclick="location.href='list2.jsp';">
				</td>	
					<tr>
						<th scope="row" class="table-active">글번호</th>
						<td><%=bb2.getNum()%></td>
						<th scope="row" class="table-active">작성자</th>
						<td><%=bb2.getId()%></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">원두종류</th>
						<td><%=bb2.getBeans_type()%></td>
						<th scope="row" class="table-active">날짜</th>
						<td><%=bb2.getDate()%></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">신맛</th>
						<td><%=bb2.getSour_taste()%></td>
						<th scope="row" class="table-active">쓴맛</th>
						<td><%=bb2.getBitter_taste()%></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">단맛</th>
						<td><%=bb2.getSweet_taste()%></td>
						<th scope="row" class="table-active">바디감</th>
						<td><%=bb2.getBody_taste()%></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">장소</th>
						<td colspan="3"><%=bb2.getPlace()%></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">파일</th>
						<td colspan="3"><img src="../upload/<%=bb2.getFile()%>"
							width="200px" height="200px"></img></td>
					</tr>
					<tr>
						<th scope="row" class="table-active">내용</th>
						<td colspan="3"><%=bb2.getContent()%></td>
					</tr>
					<tr>
						<td colspan="4">
							<%
								if (bb2.getId().equals(id) || id.equals("admin")) {
							%> <input type="button" value="수정하기"
							onclick="location.href='updateForm2.jsp?num=<%=num%>';">
							<input type="button" value="삭제하기" onclick="delete2()"> 
							<%}%>
						</td>
					</tr>
				</table>
			</div> <!-- col-6 -->
		  <div type="col-3"></div>
		</div> <!-- row -->
	</div> <!-- container-sm -->
</body>
	<!-- footer -->
			<jsp:include page="../Include/sticky-footer/footer.jsp" />
</html>