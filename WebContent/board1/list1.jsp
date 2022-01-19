
<%@page import="com.coffeelog.board.BoardBean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String id = (String)session.getAttribute("id");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Info Board </title>

<jsp:include page="../Include/nav.jsp"/>
</head>

<!-- 세션 끊겼을 시 (아이디값 없을때) -->
<script type="text/javascript">

	function write1(){

		<%if(id==null){%>		
				alert("로그인을 해주세요");
				location.href="../member/LogIn/logInForm.html";
		<%}else{%>
				location.href="writeForm1.jsp";
		<%}%>
	}


</script>

<body>


<!-- 디비에 저장된 글의 개수를 알기 -->
<% 
   // BoardDAO 객체 생성
   BoardDAO bdao = new BoardDAO();
   // 디비에 글의 수를 계산하는 메서드 생성 -> 호출
   //getBoardCount();
   int cnt = bdao.getBoardCount();
   
   // 게시판 페이징 처리 : DB에서 원하는 만큼만 글 가져오기
   
   // 한페이지당 보여줄 글의 개수 
   int pageSize = 5;
   
   // 현페이지가 몇페이지 인지 확인
   String pageNum = request.getParameter("pageNum");
   if(pageNum == null){
	   pageNum = "1";
   }
   
   // 페이지별 시작행 계산하기
   // 1p -> 1번, 2p -> 11번,3p->21번, ....=>일반화
   int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage-1)*pageSize+1;
   
   // 끝행 계산하기
   // 1p->10번, 2p->20번, 3p->30번 ....=> 일반화
   int endRow = currentPage*pageSize;
   
   // 디비에 저장된 모든 글중에서 원하는 만큼만 가져오기(페이지 사이즈)
  ArrayList<BoardBean> boardList = bdao.getBoardList(startRow,pageSize); 

%>


 <!-- 메인 내용 -->
 	<div class="container">
  		<div class="col-4"></div>
 
 <!-- 글쓰기 버튼 생성 --> 
 	<div align="right">
		<input type="button" class="btn btn-success" value="글쓰기" onclick="write1()">
	</div><br>
	
 <!-- table 생성 -->  	
 <div class="row">		
  				<table class="table table-hover" align="center">
				  <thead>
				    <tr>
				      <th scope="col">글번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
		<%
		for(int i=0;i<boardList.size();i++){
    	  BoardBean bb = (BoardBean) boardList.get(i);
     	%>
				    <tr>
				      <td><%=bb.getNum() %></td>
				      <td><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a></td>
				      <td><%=bb.getId() %></td>
				      <td><%=bb.getReg_date() %></td>
			   		  <td><%=bb.getReadcount() %></td> 
				    </tr> <%} %>
				  </tbody>
				</table>
		
</div>			
<div align="center">
  <%
    //////////////////////////////////////////////////////
    // 페이징 처리 - 하단부 페이지 링크
    if(cnt != 0){// 글이있을때 표시

    	//전체 페이지수 계산
    	// ex)  총 50개 -> 한페이지당 10개 출력, 5개
		//      총 57개 ->       "        , 6개
		int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
		
		// 한 화면에 보여줄 페이지 번호의 개수 (페이지 블럭)
		int pageBlock = 2;
		
		// 페이지 블럭의 시작페이지 번호 
		// ex)  1~10 페이지 : 1, 11~20페이지 : 11, 21~30페이지 : 21
        int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
    	
    	// 이전 (해당 페이지블럭의 첫번째 페이지 호출)
    	if(startPage > pageBlock){
    		%>
    		<a href="list1.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
    		<%
    	}   	
    	
    	// 숫자  1....5
    	for(int i=startPage;i<=endPage;i++){
    		%>
    		    <a href="list1.jsp?pageNum=<%=i%>">[<%=i %>]</a> 
    		<%    		
    	}
    	
    	// 다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
    	if(endPage < pageCount){
    		%>
    		<a href="list1.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    		<%
    	}
    	
    	
    	
    	
    }
    //////////////////////////////////////////////////////
  %>
</div>  		
  	<div class="col-4"></div>
	</div>

	<!-- 메인 내용 -->
<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp" />
</body>
</html>