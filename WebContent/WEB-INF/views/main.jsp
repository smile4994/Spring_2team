<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<style type="text/css">
/*    a, a:hover, a:visited{color:#ff; text-decoration:none;} */
   
/*    #pop_bt{ */
/*     border:1px solid #000; */
/*     width:100px;  */
/*     margin:auto;  */
/*      margin-top:30px;  */
/*     cursor: pointer;   */
/*     font-weight:bold; */
/*    text-align:center;  */
/*     padding:5px; */
/*    } */
 
   #pop{
    width:250px; height:300px; background:#FFC4EB; color:#ff; 
    position:absolute;  
	top:10px; left:500px;  
    text-align:center; 
    border:2px solid #000;
   }
 
   #close{
    width:100px; margin:auto; margin-bottom:10; cursor:pointer; font-weight:bold;
   }
 </style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		printTime();  //현재시간
		clientList_func();	//클라이언트 확인
		
		$('#home').click(function() {
			$('#target iframe').attr('src','testMain.do')
		})
		
		$('#about').click(function() {
			$('#target iframe').attr('src','about.do')
		})
		
		$('#gallery').click(function() {
			$('#target iframe').attr('src','gallery.do')
		})
		
		$('#ShortCodes').click(function() {
			$('#target iframe').attr('src','codes.do')
		})
		
		$('#map').click(function() {
			$('#target iframe').attr('src','map.do')
		})	
		
		$('#matching').click(function() {
			$('#target iframe').attr('src','matching.do')
		})	
		
		$('#boardPage').click(function() {
			$('#target iframe').attr('src','board.do')
		})
		
		$('#login').click(function() {
			$('#target iframe').attr('src','loginForm.do')
		})
		
		$('#join').click(function() {
			$('#target iframe').attr('src','joinForm.do')
		})
		
		$('#logout').click(function() {
			$('#target iframe').attr('src','logout.do')
		})
		
		$('#myPage').click(function() {
			$('#target iframe').attr('src','myPage.do')
		})
		
		//////접속자 눌렀을때//////////
		$('#pop_bt').click(function () {
			$('#pop').show();
		})
		
		$('#close').click(function() {
			$('#pop').hide();
		})
	})
	
	/*************	크롬 X 종료 이벤트 처리 *************/
	function candidateLogout(){ // 로그아웃 후보자를 지정
		$.ajax({
			url : "candidateLogout.do",
			success : function(){},
			error:function(){}
		})
	}
	
	function candidateCancel(){	//로그아웃 후보자 취소
		$.ajax({
			url : "candidateCancel.do",
			success : function(){},
			error:function(){}
		})
	}
	
	window.onunload = function myUnload(event) {
	    if (window.localStorage) {
	        window.localStorage['myUnloadEventFlag']=new Date().getTime();
	    }
	    candidateLogout(); // 페이지 전환시 로그아웃 후보자를 결정
	}
	
	window.onload = function myLoad(event) {
	    if (window.localStorage) {
	        var t0 = Number(window.localStorage['myUnloadEventFlag']);
	        if (isNaN(t0)) t0=0;
	        var t1=new Date().getTime();
	        var duration=t1-t0;
	        if (duration<10*1000) {
	        	candidateCancel(); // 페이지 전환이 확실하면 로그아웃 후보자를 취소한다
	        } else {
	        	LogTime(); //페이지전환이 아닌 정말 창을 닫은거면 세션삭제
	        }
	    }
	} 
	
	function LogTime(){	//세션 삭제 
		jQuery.ajax({
		type: "POST",
		url: "logout.do",
		data: "",
		cache: false,
		success: function(response){
		}
		});
	}
	/***************************************/

	/**********접속자***********/
	function clientList_func() {
		$.ajax({
			url : 'clientList.do',
			dataType : 'json',
			cache : false,
			success : function(data) {
				var html = "";
				var count = 0;
				$.each(data, function(key, clientList) {
					html += clientList + "<br>";
					count++;
				});
				$('#clientCount').html("현재 접속자 수는 : " + count);
				$('#showClient').html(html);
			},
			error : function() {
				alert("AJAX_showClient실패");
			}
		});
		setTimeout("clientList_func()", 1000); //1초마다 메소드를 실행하겠다
	}
	/******************************/

	/************현재시간************/
	function printTime() {
		var clock = document.getElementById("clock");
		var now = new Date();
		clock.innerHTML = now.getFullYear() + "년 " + (now.getMonth() + 1)
				+ "월 " + now.getDate() + "일 " + now.getHours() + "시 "
				+ now.getMinutes() + "분 " + now.getSeconds() + "초";
		setTimeout("printTime()", 1000); //1초마다 메소드를 실행하겠다
	}
	/******************************/

	/**********IFRAME 크기*********/
	function resizeFrame(frm) {
		frm.style.height = "auto";
		contentHeight = frm.contentWindow.document.body.scrollHeight;
		frm.style.height = contentHeight + 4 + "px";
	}
	/******************************/
</script>


</head>
<body>
<%@include file="top.jsp" %>

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
					  
						<li id="home" class="active menu__item menu__item--current">
							<div class="menu__link">Home</div>
<!-- 						<a class="menu__link" href="main.do">Home <span class="sr-only">(current)</span></a> -->
						</li>
						
						<li id="about" class=" menu__item">
						<div class="menu__link">About</div>
<!-- 						<a class="menu__link" href="about.do">About</a> -->
						</li>
						
						
						<li id="gallery" class=" menu__item">
						<div class="menu__link">Gallery</div>
<!-- 						<a class="menu__link" href="gallery.do">Gallery</a> -->
						</li>
						
						
						<li id="ShortCodes" class=" menu__item">
						<div class="menu__link">Short Codes</div>
<!-- 						<a class="menu__link" href="codes.do">Short Codes</a> -->
						</li>
						
						<li id="map" class=" menu__item">
							<div class="menu__link">Map</div>
<!-- 						<a class="menu__link" href="map.do">양태흠</a> -->
						</li>
						
						
						<li id="boardPage" class=" menu__item">
						<div class="menu__link" >게시판</div>
<!-- 						<a class="menu__link" href="board.do">게시판</a> -->
						</li>
						
						
						<li id="matching" class=" menu__item">
							<div class="menu__link">Matching</div>
<!-- 						<a class="menu__link" href="matching.do">Matching</a> -->
						</li>
						
						
						<li class=" menu__item">&nbsp;&nbsp;</li>
						<li class=" menu__item">&nbsp;&nbsp;</li>
						
						
						<c:if test="${empty sessionScope.loginId}">
						
							<li id="login" class=" menu__item">
								<div class="menu__link">Login</div>
<!-- 							<a class="menu__link" href="loginForm.do">로그인</a> -->
							</li>
							
							<li id="join" class=" menu__item">
								<div class="menu__link">Join</div>
<!-- 							<a class="menu__link" href="joinForm.do">회원가입</a> -->
							</li>
						
						
						</c:if>
						
						
						<c:if test="${not empty sessionScope.loginId}">
						
						<li id="logout" class=" menu__item">
							<div class="menu__link">Logout</div>
<!-- 						<a class="menu__link" href="logout.do">로그아웃</a> -->
						</li>
						
						
						<li id="mypage" class=" menu__item">
						<div class="menu__link">MyPage</div>
<!-- 						<a class="menu__link" href="myPage.do">마이페이지</a> -->
						</li>
						
						</c:if>
						
						<li class=" menu__item">&nbsp;&nbsp;</li>
						<li class=" menu__item">&nbsp;&nbsp;</li>
						
						<li id="pop_bt" class=" menu__item">
							<div class="menu__link">접속자</div>
						</li>
						
					  </ul>
					</div>
				  </div>
				</nav>	
			</div>
			</div>
		</div>
	</div>

	<!--  접속자 눌렀을때 -->
	<div id="pop" style="display:none;">
		<div id="clock"></div>
		<div id="clientCount"></div>
		<div id="showClient"></div>
      	<div id="close">close</div>
	</div>


<!--  	아이프레임 사용 -->
	<div id="target">	
		<iframe src="testMain.do" id="the_iframe" width="100%"
			onload=resizeFrame(this) frameborder=0 framespacing=0 marginheight=0
			marginwidth=0 scrolling=no vspace=0>
		</iframe>
	</div>
<form name ="show" style="display:none">
        <input type="text" name="mouseXField" value="0" size="6">Mouse X Position<br>
        <input type="text" name="mouseYField" value="0" size="6">Mouse Y Position<br>
</form>
</body>
</html>

