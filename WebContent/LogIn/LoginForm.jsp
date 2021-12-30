<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>CoffeeLog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
	
<%-- 	<script src="${contextPath}/resources/js/js.cookie.js"></script> --%>
 
	</head>
<%-- 	
	<% 
$("#userId").val(Cookies.get('key'));      
    if($("#userId").val() != ""){
        $("#idSaveCheck").attr("checked", true);
    }
    
$("#idSaveCheck").change(function(){
    if($("#idSaveCheck").is(":checked")){
        Cookies.set('key', $("#userId").val(), { expires: 7 });
    }else{
          Cookies.remove('key');
    }
});
     
$("#userId").keyup(function(){
    if($("#idSaveCheck").is(":checked")){
        Cookies.set('key', $("#userId").val(), { expires: 7 });
    }
});
	
%>
	 --%>
	<body class="img js-fullheight" style="background-image: url(images/bg1.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Sign In</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">계정이 있으신가요?</h3>
		      	<form action="LoginPro.jsp" class="signin-form" method="post">
		      		<div class="form-group">
		      			<input name="id" type="text" class="form-control" placeholder="ID" required>
		      		</div>
		            <div class="form-group">
		              <input id="password-field" name="password" type="password" class="form-control" placeholder="Password" required>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50">
			            	<label class="checkbox-wrap checkbox-primary">Remember Me
									<input type="checkbox" checked>
									<span class="checkmark"></span>
							</label>
						</div>
						<div class="w-50 text-md-right">
							<a href="../signUpForm.jsp" style="color: #fff">Sign Up</a>
						</div>
		            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="https://www.facebook.com/" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
	          	<a href="twitter.com" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

