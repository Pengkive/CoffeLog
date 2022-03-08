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
<!-- 게시판 답글 쓰기 -->
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
%>


<div class="form-group col-6 mx-auto">

		<form name="board1" action="reWritePro.jsp" method="post">

			<input type="hidden" name="id" value="<%=id%>">
			
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="re_ref" value="<%=re_ref%>">
			<input type="hidden" name="re_lev" value="<%=re_lev%>">
			<input type="hidden" name="re_seq" value="<%=re_seq%>">
			
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="floatingInput" name="subject">
				<label for="floatingInput">title</label>
			</div>
			<div class="form-floating">
				<textarea class="form-control"
					placeholder="타인에게 불쾌감을 줄 수 있는 글은 임의로 삭제될 수 있습니다." id="content"
					style="height: 400px" name="content"></textarea>
				<label for="floatingTextarea2">Comment</label>
			</div>
			<br>
			<div align="center">
				<input type="submit" class="btn btn-success" value="작성완료">
			</div>
		</form>

	</div><!-- 전체 container 끝 -->
</body>
</html>