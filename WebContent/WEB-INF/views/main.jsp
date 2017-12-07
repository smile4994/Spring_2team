<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<html>
<head>
<title>PETS LOVE</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pets Love Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet' type='text/css'><!-- //fonts -->

	<!-- start-smoth-scrolling -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
	<!-- start-smoth-scrolling -->
		<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<script type="text/javascript">
window.onload = function(){	
	var message ='${message}';
	if(message != null && message != ''){
		alert(message);
	}else{
		return false;
	}
}
</script>

</head>
<body>
<%@include file="top.jsp" %>

<div class="banner">

	<div class="ban-bot text-center">
		<script src="js/responsiveslides.min.js"></script>
				<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						 // Slideshow 4
						$("#slider3").responsiveSlides({
							auto: true,
							pager: true,
							nav: false,
							speed: 500,
							namespace: "callbacks",
							before: function () {
						$('.events').append("<li>before event fired.</li>");
						},
						after: function () {
							$('.events').append("<li>after event fired.</li>");
							}
							});
						});
				</script>
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
					<div class="ban-info">
						<h3>품종 보장 & 평생 책임 보상을 해드립니다.</h3>
						<p>공장분양을 제한하고 컨넬/브리더/자체번식/가정곱급을 통해<br><br>보다 건강하고 이쁜 아이들을 맞이할 수 있도록 노력하고 있습니다.</p>
						<a class="hvr-rectangle-out" href="about.do">See More About Us</a>
					</div>		
				</li>
				<li>
					<div class="ban-info">
						<h3>전문가가 친절하게 도와드리겠습니다.</h3>
						<p>고객중심 가맹정중심의 사고를 통해 미래지향적 경영을 선도하며<br><br>신뢰와 믿음을 바탕으로 끊임없는 노력을 하고 있습니다.</p>
						<a class="hvr-rectangle-out" href="about.do">See More About Us</a>
					</div>		
				</li>
				<li>
					<div class="ban-info">
						<h3>다양한 이벤트와 혜택을 챙겨가세요</h3>
						<p>PETS LOVE 반려동물 분양 및 분실신고, 반려동물 매칭서비스를 제공하고 있습니다.</p>
						<a class="hvr-rectangle-out" href="about.do">See More About Us</a>
					</div>		
				</li>			
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- our pets -->
<div class="our_pets">
	<div class="container">
		<h3 class="title wow fadeInUp animated" data-wow-delay=".5s" >Our <span> Pets</span></h3>
		<div class="flex-slider wow fadeInDown animated" data-wow-delay=".5s">

				<ul id="flexiselDemo1">
					<c:forEach items="${boardList}" var="boardList">
						<li>
						<a href="read.do?boardNum=${boardList.boardNum}">
								<div class="laptop">
									<div class="pets-effect ver_line zoom">
										<div class="img-box">
											<img class="img-responsive zoom-img" src="${boardList.boardImg}" alt=" " />
										</div>
										<div class="pets-info">
											<div class="pets-info-slid">
												<h4>${boardList.title}</h4>
												<span class="strip_line"></span>
												<p>${boardList.contents}</p>
												<span class="strip_line"></span>
											</div>
										</div>
									</div>
								</div>
						</a>
						</li>
					</c:forEach>
				</ul>
				<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo1").flexisel({
									visibleItems: 3,
									animationSpeed: 1000,
									autoPlay: true,
									autoPlaySpeed: 3000,    		
									pauseOnHover: true,
									enableResponsiveBreakpoints: true,
									responsiveBreakpoints: { 
										portrait: { 
											changePoint:480,
											visibleItems: 1
										}, 
										landscape: { 
											changePoint:640,
											visibleItems: 2
										},
										tablet: { 
											changePoint:991,
											visibleItems: 2
										}
									}
								});
								
							});
					</script>
					<script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>
</div>
<!-- //our pets -->

<!-- content -->
<div class="content">
	<div class="container">
		<h3 class="title wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s" >Welcome To <span>Pets Love</span></h3>
		<p class="con-para wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">분양, 분실, 매칭, 주변 동물병원 찾기<br>서비스를 제공합니다.</p>
		<div class="content-grids ">
			<div class="col-md-3 wel-grid text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4">
					<span></span>
					<figure class="icon">
						<img src="images/icon1.png" alt=" " />
					</figure>
					<h4>분 양</h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid btm-gre text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4 btm-clr1">
					<span></span>
					<figure class="icon">
						<img src="images/icon2.png" alt=" " />
					</figure>
					<h4>분 실</h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4 btm-clr1">
					<span></span>
					<figure class="icon">
						<img src="images/icon4.png" alt=" " />
					</figure>
					<h4>매 칭</h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid btm-gre text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr btm-clr3">
					<span></span>
					<figure class="icon">
						<img src="images/icon3.png" alt=" " />
					</figure>
					<h4>주변 동물병원</h4>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //content -->
<!-- content-bottom -->
<div class="content-bott">
	<div class="container">
		<h3 class="title wow flipInX" >Our <span> Services</span></h3>
		<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service1.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service2.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service3.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service4.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service5.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
<!-- 					<div class="services-left"> -->
						<img class="img-responsive" src="images/service6.png" alt=" "/>
<!-- 					</div> -->
<!-- 					<div class="services-right"> -->
<!-- 						<h4>AT VERO EOS ET ACCUSAMUS</h4> -->
<!-- 						<p>Sed ut perspiciatis unde omnis iste natus error sit  -->
<!-- 						voluptatem accusantium doloremque  </p> -->
<!-- 					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
	</div>
</div>
<!-- //content-bottom -->

<!-- our works -->
<div class="treatments">
	<div class="container">
		<h3 class="title wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s" >Our <span> Treatments</span></h3>
		<div class="col-md-6 treat-left">
		
		
		</div>
		<div class="col-md-6 treat-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0s">
			<div class="treat-icon">
			<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			<h4>매장방문</h4>
			<p> 방문을 통해서 입양할 유기동물과 만남</p>
			</div>
		</div>
		<div class="col-md-6 treat-right2 text-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.1s">
			<div class="treat-icon1">
			<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			<h4>면담 후 입양</h4>
			<p> 전문 상담가와 1:1면담으로<br> 입양할 아이의 건강 및 기타사항에 대해<br> 상담하고 입양합니다.</p>
			</div>
		</div>
		<div class="col-md-6 treat-left2">
		
		
		</div>
		<div class="col-md-6 treat-left">
		
		
		</div>
		<div class="col-md-6 treat-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.2s">
			<div class="treat-icon">
			<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
			<h4>보호기간 내 면회 및 외출, 외박</h4>
			<p> 보호기간 내에는 면회 및 외출, 외박이 가능합니다.</p>
			</div>
		</div>
		<div class="col-md-6 treat-right2 text-right no-bor wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.3s">
			<div class="treat-icon1">
			<span class="glyphicon glyphicon-file" aria-hidden="true"></span>
			<h4>입양 후 정보 제공</h4>
			<p> 입양 후에 아이들의 입양처와 주인들에 대한 정보와<br> 잘 지내고 있는지 여부를 제공합니다.</p>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //our works -->
<jsp:include page="bottom.jsp"/>
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
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>

