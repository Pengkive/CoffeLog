<%@page import="com.coffeelog.board.Board2Bean"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String) session.getAttribute("id");
%>
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
   Board2Bean bb2 = bdao.getLogBoard(num);
  %>
  
	<div class="container-sm">
		<!-- 전체 row 시작 -->
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">

				<form name="board2" action="updatePro2.jsp" method="post" enctype="multipart/form-data">

					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="num" value="<%=num%>">
					
					<div class="row">
						<label for="input_text" class="form-label">원두 종류</label> <input
							type="text" id="beans_type" name="beans_type" value="<%=bb2.getBeans_type()%>"
							class="form-control" placeholder="기록으로 남기고 싶은 원두 종류를 적어주세요" required>
					</div>
					<br>
<!-- 신맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">신맛</label>
					</div>
		
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="약함" required 
							<%if(bb2.getSour_taste().equals("약함")){
								%>checked<% 
							 }%>>							
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="조금 약함"
							<%if(bb2.getSour_taste().equals("조금 약함")){
								%>checked<% 
							 }%>>
													
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="보통"
							<%if(bb2.getSour_taste().equals("보통")){
								%>checked<% 
							 }%>>	
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="조금 강함"
							<%if(bb2.getSour_taste().equals("조금 강함")){
								%>checked<% 
							 }%>>	
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="강함"
							<%if(bb2.getSour_taste().equals("강함")){
								%>checked<% 
							 }%>>	
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 쓴맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">쓴맛</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="약함" required
							<%if(bb2.getBitter_taste().equals("약함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="조금 약함"
							<%if(bb2.getBitter_taste().equals("조금 약함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="보통"
							<%if(bb2.getBitter_taste().equals("보통")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="조금 강함"
							<%if(bb2.getBitter_taste().equals("조금 강함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="강함"
							<%if(bb2.getBitter_taste().equals("강함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 단맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">단맛</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="약함" required
							<%if(bb2.getSweet_taste().equals("약함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="조금 약함"
							<%if(bb2.getSweet_taste().equals("조금 약함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="보통"
							<%if(bb2.getSweet_taste().equals("보통")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="조금 강함"
							<%if(bb2.getSweet_taste().equals("조금 강함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="강함"
							<%if(bb2.getSweet_taste().equals("강함")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 바디감 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">바디감</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="가벼움" required
							<%if(bb2.getBody_taste().equals("가벼움")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">가벼움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="조금 가벼움"
							<%if(bb2.getBody_taste().equals("조금 가벼움")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 가벼움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="보통"
							<%if(bb2.getBody_taste().equals("보통")){
								%>checked<% 
							 }%>>
							
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="조금 무거움"
							<%if(bb2.getBody_taste().equals("조금 무거움")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">조금 무거움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="무거움"
							<%if(bb2.getBody_taste().equals("무거움")){
								%>checked<% 
							 }%>>
						<label class="form-check-label">무거움</label>
					</div><br><br>
					

					<div class="row">
						<label for="input_text" class="form-label">장소</label>
						<input type="text" id="place" name="place" class="form-control" placeholder="카페명 혹은 집"
							   value="<%=bb2.getPlace() %>" align="center" required>
					</div>
					<br>

					<div class="row">
						<div class="form-floating" align="center"
							style="padding-right: 0; padding-left: 0;">
							<textarea class="form-control" name="content" placeholder="후기를 간략하게 써주세요" id="content"
								style="height: 200px; width: 660; pading: 0;" required><%=bb2.getContent()%></textarea>
							<label for="floatingTextarea2">후기</label>
						</div>
					</div>
					<br>

					<!-- 파일 업로드 -->
					<div class="input-group mb-3">
					</div>
						<div id="passwordHelpBlock" class="form-text" align="center">인증 사진을 넣어주세요!
					</div>
						<input type="file" class="form-control" id="filename" name="filename" required>
					</div><p>
				</p>
				
			</div>

			<div align="center">
				<p><input type="submit" class="btn btn-success" value="수정완료" >
					<input type="button" class="btn btn-success" value="목록으로" onclick="location.href='list2.jsp'"></p>
			</div>
			
			
		</div>
		<div class="col-3"></div>


	</div>
	<!-- 전체 row 끝 -->
	</div>
	<!-- 전체 container 끝 -->
	</form>
  
  

</body>
</html>