<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<html>
<head>
<title>Pets Love a animals and Pets Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
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
<link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
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
	if(message == ''){
		return false;
	}else{
		alert(message);
		return;
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
						<h3>A Dog is the only animal that loves you more than yourself</h3>
						<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur</p>
						<a class="hvr-rectangle-out" href="about.jsp">See More About Us</a>
					</div>		
				</li>
				<li>
					<div class="ban-info">
						<h3>We really care about your pet's welfare!</h3>
						<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur</p>
						<a class="hvr-rectangle-out" href="about.jsp">See More About Us</a>
					</div>		
				</li>
				<li>
					<div class="ban-info">
						<h3>We love to walk and play with your awesome pets!</h3>
						<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur</p>
						<a class="hvr-rectangle-out" href="about.jsp">See More About Us</a>
					</div>		
				</li>			
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- content -->
<div class="content">
	<div class="container">
		<h3 class="title wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s" >Welcome To <span>Pets Love</span></h3>
		<p class="con-para wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
		adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore
		magnam aliquam quaerat voluptatem.</p>
		<div class="content-grids ">
			<div class="col-md-3 wel-grid text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4">
					<span></span>
					<figure class="icon">
						<img src="images/icon1.png" alt=" " />
					</figure>
					<h4>Voluptatem</h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid btm-gre text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4 btm-clr1">
					<span></span>
					<figure class="icon">
						<img src="images/icon4.png" alt=" " />
					</figure>
					<h4>Consectetur</h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr4 btm-clr1">
					<span></span>
					<figure class="icon">
						<img src="images/icon3.png" alt=" " />
					</figure>
					<h4>Doloremque </h4>
				</div>
			</div>
			<div class="col-md-3 wel-grid btm-gre text-center wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="btm-clr btm-clr3">
					<span></span>
					<figure class="icon">
						<img src="images/icon2.png" alt=" " />
					</figure>
					<h4>Laudantium</h4>
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
					<div class="services-left">
						<img class="img-responsive" src="images/pic4.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
					<div class="services-left">
						<img class="img-responsive" src="images/pic5.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
					<div class="services-left">
						<img class="img-responsive" src="images/pic6.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
					<div class="services-left">
						<img class="img-responsive" src="images/pic7.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
					<div class="services-left">
						<img class="img-responsive" src="images/pic8.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 services-grid wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
					<div class="services-left">
						<img class="img-responsive" src="images/pic9.jpg" alt=" "/>
					</div>
					<div class="services-right">
						<h4>AT VERO EOS ET ACCUSAMUS</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit 
						voluptatem accusantium doloremque  </p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
	</div>
</div>
<!-- //content-bottom -->
<!-- our pets -->
<div class="our_pets">
	<div class="container">
		<h3 class="title wow fadeInUp animated" data-wow-delay=".5s" >Our <span> Pets</span></h3>
		<div class="flex-slider wow fadeInDown animated" data-wow-delay=".5s">

			<ul id="flexiselDemo1">			
				<li>
					<div class="laptop">
						<div class="pets-effect ver_line zoom">
							<div class="img-box"><img class="img-responsive zoom-img" src="images/pic10.jpg" alt=" " /></div>
							<div class="pets-info">
								<div class="pets-info-slid">
									<h4>Pets Love</h4>
									<span class="strip_line"></span>
									<p>Sit accusamus, vel blanditiis iure minima ipsa molestias minus laborum velit, nulla nisi hic quasi enim.</p>
									<span class="strip_line"></span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="laptop">
						<div class="pets-effect ver_line zoom">
							<div class="img-box"><img class="img-responsive zoom-img" src="images/pic11.jpg" alt=" " /></div>
							<div class="pets-info">
								<div class="pets-info-slid">
									<h4>Pets Love</h4>
									<span class="strip_line"></span>
									<p>Sit accusamus, vel blanditiis iure minima ipsa molestias minus laborum velit, nulla nisi hic quasi enim.</p>
									<span class="strip_line"></span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="laptop">
						<div class="pets-effect ver_line zoom">
							<div class="img-box"><img class="img-responsive zoom-img" src="images/pic12.jpg" alt=" " /></div>
							<div class="pets-info">
								<div class="pets-info-slid">
									<h4>Pets Love</h4>
									<span class="strip_line"></span>
									<p>Sit accusamus, vel blanditiis iure minima ipsa molestias minus laborum velit, nulla nisi hic quasi enim.</p>
									<span class="strip_line"></span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="laptop">
						<div class="pets-effect ver_line zoom">
							<div class="img-box"><img class="img-responsive zoom-img" src="images/pic13.jpg" alt=" " /></div>
							<div class="pets-info">
								<div class="pets-info-slid">
									<h4>Pets Love</h4>
									<span class="strip_line"></span>
									<p>Sit accusamus, vel blanditiis iure minima ipsa molestias minus laborum velit, nulla nisi hic quasi enim.</p>
									<span class="strip_line"></span>
								</div>
							</div>
						</div>
					</div>
				</li>
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
<!-- our works -->
<div class="treatments">
	<div class="container">
		<h3 class="title wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s" >Our <span> Treatments</span></h3>
		<div class="col-md-6 treat-left">
		
		
		</div>
		<div class="col-md-6 treat-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0s">
			<div class="treat-icon">
			<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			<h4>Laudantium</h4>
			<p> Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, quisquam est, qui dolorem ipsum quia dolor sit amet</p>
			</div>
		</div>
		<div class="col-md-6 treat-right2 text-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.1s">
			<div class="treat-icon1">
			<span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>
			<h4>Laudantium</h4>
			<p> Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, quisquam est, qui dolorem ipsum quia dolor sit amet</p>
			</div>
		</div>
		<div class="col-md-6 treat-left2">
		
		
		</div>
		<div class="col-md-6 treat-left">
		
		
		</div>
		<div class="col-md-6 treat-right wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.2s">
			<div class="treat-icon">
			<span class="glyphicon glyphicon-grain" aria-hidden="true"></span>
			<h4>Laudantium</h4>
			<p> Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, quisquam est, qui dolorem ipsum quia dolor sit amet</p>
			</div>
		</div>
		<div class="col-md-6 treat-right2 text-right no-bor wow bounceInDown" data-wow-duration="1.5s" data-wow-delay="0.3s">
			<div class="treat-icon1">
			<span class="glyphicon glyphicon-scissors" aria-hidden="true"></span>
			<h4>Laudantium</h4>
			<p> Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, quisquam est, qui dolorem ipsum quia dolor sit amet</p>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //our works -->
<!-- contact -->
<div class="contact-form ">
		<div class="container">
			<h3 class="title">Contact <span>Us</span></h3>
			
			<div class="col-md-6 contact-right wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">				
				<form action="#" method="post">
					<input type="text" name="Name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
					<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="text" name="Telephone" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}" required="">
					<textarea name="Message..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
					<input type="submit" value="Submit" >
				</form>
			</div>
			<div class="col-md-6 contact-left wow zoomIn" data-wow-duration="2s" data-wow-delay="0.5s">
				<h2>Contact Information</h2>
				<p>"Lorem Ipsum"is the common name dummy text often used in the design, printing, and type setting industriescommon name dummy text often used in the design, printing, and type setting industries Lorem Ipsum"is the common name dummy text often used in the design, printing, and type setting industries "</p>
				<ul class="contact-list">
					<li><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>756 global Place, New York.</li>
					<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:example@mail.com">mail@example.com</a></li>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+123 2222 222</li>
				</ul>
				<ul class="icons-list footer-bottom">
					<li><a href="#" class="use1"><span>Facebook</span></a></li>
					<li><a href="#" class="use2"><span>Twitter</span></a></li>
					<li><a href="#" class="use3"><span>Dribbble</span></a></li>
					<li><a href="#" class="use4"><span>Pinterest</span></a></li>
				</ul>
			</div>						
			<div class="clearfix"> </div>
			<p class="copy-right text-center">&copy; 2016 Pets Love. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
		</div>			
</div>

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
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>

