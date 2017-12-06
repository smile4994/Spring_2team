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
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css" media="all" />

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

</head>
<body>
<%@include file="top.jsp" %>
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
						<div class="input-group">
							<input type="image" src="images/kakaologin.png" border="0">
						</div>
					</div>
				</div>
			</form>

			<form action="naverstart.do" method="get">
				<div class="row">
					<div class="in-gp-tb">
						<div class="input-group">
							<input type="image" src="images/naverlogin.png" border="0">
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- /.row -->
	</div>

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
<jsp:include page="bottom.jsp"/>

</body>
</html>