<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script>
	var myCoordLat;
	var myCoordLong;
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
		width: auto;
		height: auto;
	}
</script>


</head>
<body>
<%@include file="top.jsp" %>


	<!-- �� -->

	<!-- 	����:	<span id="latitude"></span>  -->
	<!-- 	�浵:	<span id="longitude"></span> -->
	<!-- banner -->
	<div class="map">
		<div class="container">
			<h3 class="title ">
				View <span>On Map</span>
			</h3>
			<!-- �������� -->
			<!-- 					<div class="hAddr"> -->
			<!-- 						<span class="title">�ּ�����</span><br> -->
			<!-- 						<span id="centerAddr"></span> -->
			<!-- 					</div> -->


			<div id="map" style="width: 100%; height: 600;" class="contact-grids">

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0c0ed776496ecc4d7ee6e9daa1ea6ea&libraries=services,clusterer,drawing"></script>

				<script>
					var myCLat;
					var myCLong;
					var addr;
					var find;
					var markers = [];

// 					Geolocation API�� �׼����� �� �ִ����� Ȯ��

					if (navigator.geolocation) {
						//��ġ ������ ���
						navigator.geolocation.getCurrentPosition(function(pos) {
							myCLat = pos.coords.latitude;
							myCLong = pos.coords.longitude;
							// 							$('#latitude').html(pos.coords.latitude); // ����
							// 							$('#longitude').html(pos.coords.longitude); // �浵
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

						// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
						var mapTypeControl = new daum.maps.MapTypeControl();

						// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
						// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
						map.addControl(mapTypeControl,
								daum.maps.ControlPosition.TOPRIGHT);

						// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl,
								daum.maps.ControlPosition.RIGHT)
						/////////////////////////////////
						// 					    var clusterer = new daum.maps.MarkerClusterer({
						// 					        map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü
						// 					        averageCenter: false, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ����
						// 					        gridSize: 60,
						// 					        minLevel: 4, // Ŭ������ �� �ּ� ���� ����
						// 					        disableClickZoom: true // Ŭ������ ��Ŀ�� Ŭ������ �� ������ Ȯ����� �ʵ��� �����Ѵ�
						// 					    });
						/////////////////////////////////
						// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
						var geocoder = new daum.maps.services.Geocoder();
						// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
						// ��ǥ�� ������ �ּ� ������ ��û�մϴ�
						geocoder.coord2RegionCode(map.getCenter().getLng(), map
								.getCenter().getLat(), displayCenterInfo);
						/////////////////////////////////
						// ��� �˻� ��ü�� �����մϴ�
						var ps = new daum.maps.services.Places();

						// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
						daum.maps.event.addListener(map, 'idle', function() {
							geocoder
									.coord2RegionCode(map.getCenter().getLng(),
											map.getCenter().getLat(),
											displayCenterInfo);

						});

						// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
						function displayMarker(place) {
							// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
							var marker = new daum.maps.Marker({
								map : map,
								position : new daum.maps.LatLng(place.y,
										place.x)
							});

							markers.push(marker);
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
							// 							clusterer.addMarkers(markers);
							////////////////////////////
							var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
							imageSize = new daum.maps.Size(45, 55); // ��Ŀ�̹����� ũ���Դϴ�
							imageOption = {
								offset : new daum.maps.Point(27, 69)
							}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

							// ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
							var markerImage = new daum.maps.MarkerImage(
									imageSrc, imageSize, imageOption), markerPosition = new daum.maps.LatLng(
									myCLat, myCLong); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�

							// ��Ŀ�� �����մϴ�
							var nowMarker = new daum.maps.Marker({
								position : markerPosition,
								image : markerImage
							// ��Ŀ�̹��� ���� 
							});

							daum.maps.event
									.addListener(
											nowMarker,
											'click',
											function() {
												// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
												infowindow
														.setContent('<div style="font-size:12px;">'
																+ '���� ��ġ'
																+ '</div>');
												infowindow.open(map, nowMarker);
											});

							// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
							nowMarker.setMap(map);

						}

						daum.maps.event.addListener(clusterer, 'clusterclick',
								function(cluster) {

									// ���� ���� �������� 1���� Ȯ���� ����
									var level = map.getLevel() - 1;

									// ������ Ŭ���� Ŭ�������� ��Ŀ�� ��ġ�� �������� Ȯ���մϴ�
									map.setLevel(level, {
										anchor : cluster.getCenter()
									});
								});

						////////////////////////////////////
						// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
						function placesSearchCB(data, status, pagination) {

							if (status === daum.maps.services.Status.OK) {
								// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
								// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);

								}
								// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
							}
						}
						// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
						function displayCenterInfo(result, status) {
							if (status === daum.maps.services.Status.OK) {
								var infoDiv = document
										.getElementById('centerAddr');

								for (var i = 0; i < result.length; i++) {
									// �������� region_type ���� 'H' �̹Ƿ�
									if (result[i].region_type === 'H') {
										// 										infoDiv.innerHTML = result[i].address_name;
										addr = result[i].address_name;
										break;
									}
								}
							}
							// Ű����� ��Ҹ� �˻��մϴ�
							find = addr + " " + '��������';
							ps.keywordSearch(find, placesSearchCB);
						}

					}
				</script>
			</div>

		</div>
	</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>