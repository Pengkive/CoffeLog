<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeForm2.jsp</title>

<jsp:include page="../Include/nav.jsp"></jsp:include>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
  	if(id==null){
  		%>
  		<script>
	  		location.href="../LogIn/LoginForm.jsp";
  		</script>
  	<%}%>
	<div class="container-sm">
		<!-- 전체 row 시작 -->
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">

				<form name="board2" action="writePro2.jsp" method="post" enctype="multipart/form-data">

					<input type="hidden" name="id" value="<%=id%>">	
					<input type="button" class="btn btn-success" value="목록으로" style="float: right;" onclick="location.href='list2.jsp'">
					
					<div class="row" style="clear: both;">
					
						<label for="input_text" class="form-label">원두 종류</label> <input
							type="text" id="beans_type" name="beans_type"
							class="form-control" placeholder="원두 종류를 적어주세요" required>
					</div>
					<br>
<!-- 신맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">신맛</label>
					</div>
		
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="약함" required>
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="조금 약함">
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="보통">
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="조금 강함">
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sour_taste" id="sour_taste" value="강함">
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 쓴맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">쓴맛</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="약함" required>
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="조금 약함">
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="보통">
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="조금 강함">
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="bitter_taste" id="bitter_taste" value="강함">
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 단맛 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">단맛</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="약함" required>
						<label class="form-check-label">약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="조금 약함">
						<label class="form-check-label">조금 약함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="보통">
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="조금 강함">
						<label class="form-check-label">조금 강함</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="sweet_taste" id="sweet_taste" value="강함">
						<label class="form-check-label">강함</label>
					</div><br><br>

<!-- 바디감 옵션 -->
					<div class="row">
						<label for="form-check-radio" class="form-label">바디감</label><br>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="가벼움" required>
						<label class="form-check-label">가벼움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="조금 가벼움">
						<label class="form-check-label">조금 가벼움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="보통">
						<label class="form-check-label">보통</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="조금 무거움">
						<label class="form-check-label">조금 무거움</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="body_taste" id="body_taste" value="무거움">
						<label class="form-check-label">무거움</label>
					</div><br><br>
					

					<div class="row">
						<label for="input_text" class="form-label">장소</label> <input
							type="text" id="place" name="place" class="form-control" align="center" placeholder="카페명 혹은 집"
							required>
					</div>
					<br>

					<div class="row">
						<div class="form-floating" align="center"
							style="padding-right: 0; padding-left: 0;">
							<textarea class="form-control" name="content" placeholder="내용"
								id="content"
								style="height: 200px; width: 660; pading: 0;" required></textarea>
							<label for="floatingTextarea2">후기</label>
						</div>
					</div>

					<!-- 파일 업로드 -->
					<div class="input-group mb-3">
					</div>
						<div class="form-text" align="center">인증 사진을 넣어주세요!
					</div>
						<input type="file" class="form-control" id="filename" name="filename" required>
					</div><p>
	
			</div>

			<div align="center">
				<p><input type="submit" class="btn btn-success" value="글쓰기" >
				<input type="button" class="btn btn-success" value="목록으로" onclick="location.href='list2.jsp'">
				</p>
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