<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>��������</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pets Love Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">


	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script>
	var myCoordLat;
	var myCoordLong;
	$(function() {
		//     // Geolocation API�� �׼����� �� �ִ����� Ȯ��
		//     if (navigator.geolocation) {
		//         //��ġ ������ ���
		//         navigator.geolocation.getCurrentPosition (function(pos) {
		//         	$('#latitude').html(pos.coords.latitude);     // ����
		//             $('#longitude').html(pos.coords.longitude); // �浵
		//         });
		//     } else {
		//         alert("�� ������������ Geolocation�� �������� �ʽ��ϴ�.")
		//     }
	});
</script>
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

<script type="text/css">
	.container{
		max-width: 100%;
		width: autot;
		height: auto;
	}
</script>


</head>
<body>


	<%@include file="top.jsp"%>
	<!-- �� -->

	����:	<span id="latitude"></span> 
	�浵:	<span id="longitude"></span>
	<!-- banner -->
	<div class="map">
		<div class="container">
			<h3 class="title ">
				View <span>On Map</span>
			</h3>
			<!-- �������� -->
					<div class="hAddr">
						<span class="title">�����߽ɱ��� ������ �ּ�����</span><br>
						<span id="centerAddr"></span>
					</div>
					
					
			<div id="map" style="width: 100%; height: 600;" class="contact-grids">

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0c0ed776496ecc4d7ee6e9daa1ea6ea&libraries=services,clusterer,drawing"></script>

				<script>
					var myCLat;
					var myCLong;
					var addr;
					var find;
					// Geolocation API�� �׼����� �� �ִ����� Ȯ��
					if (navigator.geolocation) {
						//��ġ ������ ���
						navigator.geolocation.getCurrentPosition(function(pos) {
							myCLat = pos.coords.latitude;
							myCLong = pos.coords.longitude;
							$('#latitude').html(pos.coords.latitude); // ����
							$('#longitude').html(pos.coords.longitude); // �浵
				
							myMap();
						});
					} else {
						alert("�� ������������ Geolocation�� �������� �ʽ��ϴ�.")
					}
				
				
				
					////////////////////
					// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
					function myMap() {
						var infowindow = new daum.maps.InfoWindow({
							zIndex : 1
						});
				
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
							mapOption = {
								center : new daum.maps.LatLng(myCLat, myCLong), // ������ �߽���ǥ
								level : 2
							// ������ Ȯ�� ����
							};
				
						// ������ �����մϴ�    
						var map = new daum.maps.Map(mapContainer, mapOption);
						/////////////////////////////////
						// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
						var geocoder = new daum.maps.services.Geocoder();
						// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
						searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				
						/////////////////////////////////
				
						// ��� �˻� ��ü�� �����մϴ�
						var ps = new daum.maps.services.Places();
				
						// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
						daum.maps.event.addListener(map, 'idle', function() {
							searchAddrFromCoords(map.getCenter(), displayCenterInfo);
							
						});
				
						
				
						// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
						function placesSearchCB(data, status, pagination) {
							if (status === daum.maps.services.Status.OK) {
				
								// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
								// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
								var bounds = new daum.maps.LatLngBounds();
				
								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);
									bounds.extend(new daum.maps.LatLng(
										data[i].y, data[i].x));
								}
				
								// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
								map.setBounds(bounds);
							}
						}
				
						// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
						function displayMarker(place) {
				
							// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
							var marker = new daum.maps.Marker({
								map : map,
								position : new daum.maps.LatLng(place.y,
									place.x)
							});
				
							// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
							daum.maps.event
								.addListener(
									marker,
									'click',
									function() {
										// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
										infowindow
											.setContent('<div style="padding:5px;font-size:12px;">'
												+ place.place_name
												+ '</div>');
										infowindow.open(map, marker);
									});
						}
				
						////////////////////////////////////
				

				
						function searchAddrFromCoords(coords, callback) {
							// ��ǥ�� ������ �ּ� ������ ��û�մϴ�
							geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
						}
				
						function searchDetailAddrFromCoords(coords, callback) {
							// ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
							geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
						}
				
						// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
						function displayCenterInfo(result, status) {
							if (status === daum.maps.services.Status.OK) {
								var infoDiv = document.getElementById('centerAddr');
				
								for (var i = 0; i < result.length; i++) {
									// �������� region_type ���� 'H' �̹Ƿ�
									if (result[i].region_type === 'H') {
										infoDiv.innerHTML = result[i].address_name;
										addr = result[i].address_name;
										break;
									}
								}
							}
							// Ű����� ��Ҹ� �˻��մϴ�
							find= addr+" "+'��������';
							alert(find);
							ps.keywordSearch(find, placesSearchCB);
							
						}
				
					}
				</script>
			</div>

		</div>
	</div>
	<!-- contact -->
	<div class="contact-form">
		<div class="container">
			<h3 class="title">
				Contact <span>Us</span>
			</h3>

			<div class="col-md-6 contact-right ">
				<form action="#" method="post">
					<input type="text" name="Name" value="Name"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Name';}" required="">
					<input type="email" name="Email" value="Email"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="text" name="Telephone" value="Telephone"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Telephone';}"
						required="">
					<textarea name="Message..." onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Message...';}"
						required="">Message...</textarea>
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="col-md-6 contact-left ">
				<h2>Contact Information</h2>
				<p>"Lorem Ipsum"is the common name dummy text often used in the
					design, printing, and type setting industriescommon name dummy text
					often used in the design, printing, and type setting industries
					Lorem Ipsum"is the common name dummy text often used in the design,
					printing, and type setting industries "</p>
				<ul class="contact-list">
					<li><span class="glyphicon glyphicon-map-marker"
						aria-hidden="true"></span>756 global Place, New York.</li>
					<li><span class="glyphicon glyphicon-envelope"
						aria-hidden="true"></span><a href="mailto:example@mail.com">mail@example.com</a></li>
					<li><span class="glyphicon glyphicon-earphone"
						aria-hidden="true"></span>+123 2222 222</li>
				</ul>
				<ul class="icons-list footer-bottom">
					<li><a href="#" class="use1"><span>Facebook</span></a></li>
					<li><a href="#" class="use2"><span>Twitter</span></a></li>
					<li><a href="#" class="use3"><span>Dribbble</span></a></li>
					<li><a href="#" class="use4"><span>Pinterest</span></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
			<p class="copy-right text-center">
				&copy; 2016 Pets Love. All rights reserved | Design by <a
					href="http://w3layouts.com/">W3layouts</a>
			</p>
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