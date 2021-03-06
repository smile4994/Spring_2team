<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>동물병원</title>
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
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css"
	media="all" />
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
	<%@include file="top.jsp"%>


	<!-- 맵 -->
	<!-- banner -->
	<div class="map">
		<div class="container">
			<h3 class="title ">
				View <span>On Map</span>
			</h3>
			<!-- 다음지도 -->


			<div id="map" style="width: 100%; height: 600;" class="contact-grids">

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0c0ed776496ecc4d7ee6e9daa1ea6ea&libraries=services,clusterer,drawing"></script>

				<script>
					var myCLat;
					var myCLong;
					var addr;
					var find;
					var markers = [];

					// 					Geolocation API에 액세스할 수 있는지를 확인

					// 					if (navigator.geolocation) {
					// 						//위치 정보를 얻기
					// 						navigator.geolocation.getCurrentPosition(function(pos) {
					// 							myCLat = pos.coords.latitude;
					// 							myCLong = pos.coords.longitude;
					// 							// 							$('#latitude').html(pos.coords.latitude); // 위도
					// 							// 							$('#longitude').html(pos.coords.longitude); // 경도
					// 							myMap();
					// 						});
					// 					} else {
					// 						alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
					// 					}

					////////////////////
					// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
					myMap();
					function myMap() {
						var infowindow = new daum.maps.InfoWindow({
							zIndex : 1
						});

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(37.5013068,
									127.03965970000002), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption);

						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl,
								daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl,
								daum.maps.ControlPosition.RIGHT)
						/////////////////////////////////
						// 					    var clusterer = new daum.maps.MarkerClusterer({
						// 					        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
						// 					        averageCenter: false, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
						// 					        gridSize: 60,
						// 					        minLevel: 4, // 클러스터 할 최소 지도 레벨
						// 					        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
						// 					    });
						/////////////////////////////////
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
						// 좌표로 행정동 주소 정보를 요청합니다
						geocoder.coord2RegionCode(map.getCenter().getLng(), map
								.getCenter().getLat(), displayCenterInfo);
						/////////////////////////////////
						// 장소 검색 객체를 생성합니다
						var ps = new daum.maps.services.Places();

						// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
						daum.maps.event.addListener(map, 'idle', function() {
							geocoder
									.coord2RegionCode(map.getCenter().getLng(),
											map.getCenter().getLat(),
											displayCenterInfo);

						});

						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(place) {
							// 마커를 생성하고 지도에 표시합니다
							var marker = new daum.maps.Marker({
								map : map,
								position : new daum.maps.LatLng(place.y,
										place.x)
							});

							markers.push(marker);
							// 마커에 클릭이벤트를 등록합니다
							daum.maps.event
									.addListener(
											marker,
											'click',
											function() {
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow
														.setContent('<div style="padding:5px;font-size:12px;">'
																+ place.place_name
																+ '</div>');
												infowindow.open(map, marker);
											});
							// 							clusterer.addMarkers(markers);
							////////////////////////////
							var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
							imageSize = new daum.maps.Size(45, 55); // 마커이미지의 크기입니다
							imageOption = {
								offset : new daum.maps.Point(27, 69)
							}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

							// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
							// 							var markerImage = new daum.maps.MarkerImage(
							// 									imageSrc, imageSize, imageOption), markerPosition = new daum.maps.LatLng(
							// 									myCLat, myCLong); // 마커가 표시될 위치입니다

							var markerImage = new daum.maps.MarkerImage(
									imageSrc, imageSize, imageOption), markerPosition = new daum.maps.LatLng(
									37.5013068, 127.03965970000002); // 마커가 표시될 위치입니다

							// 마커를 생성합니다
							var nowMarker = new daum.maps.Marker({
								position : markerPosition,
								image : markerImage
							// 마커이미지 설정 
							});

							daum.maps.event
									.addListener(
											nowMarker,
											'click',
											function() {
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow
														.setContent('<div style="font-size:12px;">'
																+ '현재 위치'
																+ '</div>');
												infowindow.open(map, nowMarker);
											});

							// 마커가 지도 위에 표시되도록 설정합니다
							nowMarker.setMap(map);

						}

						daum.maps.event.addListener(clusterer, 'clusterclick',
								function(cluster) {

									// 현재 지도 레벨에서 1레벨 확대한 레벨
									var level = map.getLevel() - 1;

									// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
									map.setLevel(level, {
										anchor : cluster.getCenter()
									});
								});

						////////////////////////////////////
						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {

							if (status === daum.maps.services.Status.OK) {
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								// LatLngBounds 객체에 좌표를 추가합니다
								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);

								}
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							}
						}
						// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
						function displayCenterInfo(result, status) {
							if (status === daum.maps.services.Status.OK) {
								var infoDiv = document
										.getElementById('centerAddr');

								for (var i = 0; i < result.length; i++) {
									// 행정동의 region_type 값은 'H' 이므로
									if (result[i].region_type === 'H') {
										addr = result[i].address_name;
										break;
									}
								}
							}
							// 키워드로 장소를 검색합니다
							find = addr + " " + '동물병원';
							ps.keywordSearch(find, placesSearchCB);
						}

					}
				</script>
			</div>

		</div>
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>