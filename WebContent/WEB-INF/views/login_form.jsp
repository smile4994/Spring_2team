<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>로그인</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pets Love Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<!-- fonts -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet'
	type='text/css'>
<!-- //fonts -->

<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<script>
	$(document)
			.ready(
					function() {
						Kakao.init("발급받은 키");
						function getKakaotalkUserProfile() {
							Kakao.API
									.request({
										url : '/v1/user/me',
										success : function(res) {
											$("#kakao-profile").append(
													res.properties.nickname);
											$("#kakao-profile")
													.append(
															$(
																	"<img/>",
																	{
																		"src" : res.properties.profile_image,
																		"alt" : res.properties.nickname
																				+ "님의 프로필 사진"
																	}));
										},
										fail : function(error) {
											console.log(error);
										}
									});
						}
						function createKakaotalkLogin() {
							$(
									"#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
									.remove();
							var loginBtn = $("<a/>", {
								"class" : "kakao-login-btn",
								"text" : "로그인"
							});
							loginBtn.click(function() {
								Kakao.Auth.login({
									persistAccessToken : true,
									persistRefreshToken : true,
									success : function(authObj) {
										getKakaotalkUserProfile();
										createKakaotalkLogout();
									},
									fail : function(err) {
										console.log(err);
									}
								});
							});
							$("#kakao-logged-group").prepend(loginBtn)
						}
						function createKakaotalkLogout() {
							$(
									"#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
									.remove();
							var logoutBtn = $("<a/>", {
								"class" : "kakao-logout-btn",
								"text" : "로그아웃"
							});
							logoutBtn.click(function() {
								Kakao.Auth.logout();
								createKakaotalkLogin();
								$("#kakao-profile").text("");
							});
							$("#kakao-logged-group").prepend(logoutBtn);
						}
						if (Kakao.Auth.getRefreshToken() != undefined
								&& Kakao.Auth.getRefreshToken().replace(/ /gi,
										"") != "") {
							createKakaotalkLogout();
							getKakaotalkUserProfile();
						} else {
							createKakaotalkLogin();
						}
					});
</script>

</head>
<body>


	<div class="news-left">
		<div class="container">
			<h3 class="title ">로그인</h3>
			<form method="post" action="login.do">
				<div class="input-group input-group-lg">

					<span class="input-group-addon" id="sizing-addon1">ID</span> <input
						type="text" class="form-control" placeholder="User id" name="id"
						aria-describedby="sizing-addon1">
				</div>

				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PW</span> <input
						type="password" class="form-control" placeholder="User password"
						name="pw" aria-describedby="sizing-addon1">
				</div>

				<div class="row">
					<div class="in-gp-tb">
						<div class="input-group">
							<button class="btn btn-default" type="submit">로그인</button>
							<a href="javascript:history.back()"><button
									class="btn btn-default" id="cancel" type="button">뒤로가기</button></a>

						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>


			</form>
			<form action="kakaoGetCode.do" method="get">
				<div class="row">
					<div class="in-gp-tb">
						<input type="image" src="images/kakaologin.png" border="0">
					</div>
				</div>
			</form>

			<form action="naverstart.do" method="get">
				<div class="row">
					<div class="in-gp-tb">
						<input type="image" src="images/naverlogin.png" border="0">
					</div>
				</div>
			</form>
		</div>
		<!-- /.row -->
	</div>
	</div>
	<!-- 	<!-- contact -->
	<!-- 	<div class="contact-form"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<h3 class="title"> -->
	<!-- 				Contact <span>Us</span> -->
	<!-- 			</h3> -->

	<!-- 			<div class="col-md-6 contact-right "> -->
	<!-- 				<form action="#" method="post"> -->
	<!-- 					<input type="text" name="Name" value="Name" -->
	<!-- 						onfocus="this.value = '';" -->
	<!-- 						onblur="if (this.value == '') {this.value = 'Name';}" required=""> -->
	<!-- 					<input type="email" name="Email" value="Email" -->
	<!-- 						onfocus="this.value = '';" -->
	<!-- 						onblur="if (this.value == '') {this.value = 'Email';}" required=""> -->
	<!-- 					<input type="text" name="Telephone" value="Telephone" -->
	<!-- 						onfocus="this.value = '';" -->
	<!-- 						onblur="if (this.value == '') {this.value = 'Telephone';}" -->
	<!-- 						required=""> -->
	<!-- 					<textarea name="Message..." onfocus="this.value = '';" -->
	<!-- 						onblur="if (this.value == '') {this.value = 'Message...';}" -->
	<!-- 						required="">Message...</textarea> -->
	<!-- 					<input type="submit" value="Submit"> -->
	<!-- 				</form> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-md-6 contact-left "> -->
	<!-- 				<h2>Contact Information</h2> -->
	<!-- 				<p>"Lorem Ipsum"is the common name dummy text often used in the -->
	<!-- 					design, printing, and type setting industriescommon name dummy text -->
	<!-- 					often used in the design, printing, and type setting industries -->
	<!-- 					Lorem Ipsum"is the common name dummy text often used in the design, -->
	<!-- 					printing, and type setting industries "</p> -->
	<!-- 				<ul class="contact-list"> -->
	<!-- 					<li><span class="glyphicon glyphicon-map-marker" -->
	<!-- 						aria-hidden="true"></span>756 global Place, New York.</li> -->
	<!-- 					<li><span class="glyphicon glyphicon-envelope" -->
	<!-- 						aria-hidden="true"></span><a href="mailto:example@mail.com">mail@example.com</a></li> -->
	<!-- 					<li><span class="glyphicon glyphicon-earphone" -->
	<!-- 						aria-hidden="true"></span>+123 2222 222</li> -->
	<!-- 				</ul> -->
	<!-- 				<ul class="icons-list footer-bottom"> -->
	<!-- 					<li><a href="#" class="use1"><span>Facebook</span></a></li> -->
	<!-- 					<li><a href="#" class="use2"><span>Twitter</span></a></li> -->
	<!-- 					<li><a href="#" class="use3"><span>Dribbble</span></a></li> -->
	<!-- 					<li><a href="#" class="use4"><span>Pinterest</span></a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 			<div class="clearfix"></div> -->
	<!-- 			<p class="copy-right text-center"> -->
	<!-- 				&copy; 2016 Pets Love. All rights reserved | Design by <a -->
	<!-- 					href="http://w3layouts.com/">W3layouts</a> -->
	<!-- 			</p> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<!-- contact -->
	<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //smooth scrolling -->

</body>
</html>