<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Log</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>

<!-- navbar / footer include -->
<jsp:include page="../Include/nav.jsp"/>
<!-- navbar / footer include-->
</head>
<body>

<!-- 메인 내용 -->

<div class="container">
  
 <!-- 전체 row 시작 -->
	<div margin=10px>
				<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../img/img1.jpg" class="d-block w-100" alt="..." width="500px" height="600px">
							<div class="carousel-caption d-none d-md-block">
								<h5>기억에 남는 원두를 기록하세요!</h5>
							</div>
						</div>
						<div class="carousel-item">
							<img src="../img/img2.jpg" class="d-block w-100" alt="..." width="500px" height="600px">
							<div class="carousel-caption d-none d-md-block">
								
							</div>
						</div>
						<div class="carousel-item">
							<img src="../img/img3.jpg" class="d-block w-100" alt="..." width="500px" height="600px">
							<div class="carousel-caption d-none d-md-block">
							</div>
						</div>
					</div>
					
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
  	 
  	</div>
<!-- 전체 row 끝-->

</div>
<!-- 메인 div 끝 -->

  	<!-- footer -->
<jsp:include page="../Include/sticky-footer/footer.jsp"/>
</body>
</html>