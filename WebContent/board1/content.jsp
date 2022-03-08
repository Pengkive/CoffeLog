<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.coffeelog.board.CommentBean"%>
<%@page import="com.coffeelog.board.CommentDAO"%>
<%@page import="com.coffeelog.board.BoardBean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if(id==null){
		id="";
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 공유</title>
</head>
<jsp:include page="../Include/nav.jsp" />
<body>

	<%
		/* 게시판 글 번호, 페이지 번호 */	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
	 	/* DB에서 글번호(num)에 해당하는 글정보를 모두 가져와서 출력	 */
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = bdao.getBoard(num);
		
		/* 조회수 조회, cookie 사용하여 페이지 view count 중복 방지 */
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
	  		/* commentList */
//		CommentDAO cdao = new CommentDAO();
//		List commentList = cdao.commentList();
//		System.out.println("CommentList : "+commentList);
	%>


	<script type="text/javascript">

	/* 글 삭제하기 */
	function info_delete(){
			   
   		if(confirm("삭제하시겠습니까?")) {
         	location.href="deleteWritePro.jsp?num=<%=num%>";
		} else {
			return;
		}
	}

	/* 답글쓰기 */
	function re_write(){

		location.href = "reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>";
		console.log('답글쓰기 전송');
	}
	
	/* 글 수정하기 */
	function write_update(){
		
		location.href="updateForm.jsp?num=<%=bb.getNum()%>";
	}
	
	/* 목록이동 */

	function board_list(){
		
		location.href="list1.jsp?pageNum=<%=pageNum%>";
	}
	
	</script>

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
						
						<input type="button" class="btn btn-info" value="답글쓰기" onclick="re_write()">
						<input type="button" class="btn btn-warning" value="수정하기" onclick="write_update()">
						<input type="button" class="btn btn-danger" value="삭제하기" onclick="info_delete()">
						<% }%>
						
						<input type="button" class="btn btn-secondary" value="목록으로" onclick="board_list()">
					</td>
				</tr>
			</table>
		<p>
		
	</div>
<p/>


<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp" />
</body>
</html>