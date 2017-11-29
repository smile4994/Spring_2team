<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>top</title>
</head>
<body>
	<div class="header wow fadeInDown animated" data-wow-delay=".5s">
		<div class="container">
			<div class="header-left grid">
				<div class="grid__item color-1 wow zoomIn" data-wow-duration="2s"
					data-wow-delay="0.5s">
					<h1>
						<a href="index.jsp"><i></i><span class="link link--kukuri"
							data-letters="Pets Love">Pets Love</span></a>
					</h1>
				</div>
			</div>
			<div class="header-middle">
				<ul>
					<li><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>+123
						456 7890</li>
					<li><a href="mailto:info@example.com"><span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>info@example.com</a></li>
				</ul>
			</div>
			<div class="header-right">
				<div class="search">
					<form action="#" method="post">
						<input type="search" name="Search" value="Search"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}"
							required=""> <input type="submit" value=" ">
					</form>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="ban-top">
		<div class="container">
			<div class="ban-top-con">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				  <div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
					  <ul class="nav navbar-nav menu__list">
						<li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
						<li class=" menu__item"><a class="menu__link" href="about.jsp">About</a></li>
						<li class=" menu__item"><a class="menu__link" href="gallery.jsp">Gallery</a></li>
						<li class=" menu__item"><a class="menu__link" href="codes.jsp">Short Codes</a></li>
						<li class=" menu__item"><a class="menu__link" href="contact.jsp">contact</a></li>
					  </ul>
					</div>
				  </div>
				</nav>	
			</div>
			<div class="top_nav_right">
				<ul>
					<li class="hvr-rectangle-out"><a class="fb" href="#"></a></li>
					<li class="hvr-rectangle-out"><a class="twit" href="#"></a></li>
					<li class="hvr-rectangle-out"><a class="goog" href="#"></a></li>
					<li class="hvr-rectangle-out"><a class="pin" href="#"></a></li>
					<li class="hvr-rectangle-out"><a class="drib" href="#"></a></li>
				</ul>	
			</div>
			<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>