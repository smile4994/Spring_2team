<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<a href="main.do"><i></i><span class="link link--kukuri"
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
	
</body>
</html>