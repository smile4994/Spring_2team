<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

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
		printTime();  //����ð�
		clientList_func();	//Ŭ���̾�Ʈ Ȯ��
		
// 		$('#home').click(function() {
// 			$('#target iframe').attr('src','testMain.do')
// 		})
		
// 		$('#about').click(function() {
// 			$('#target iframe').attr('src','about.do')
// 		})
		
// 		$('#gallery').click(function() {
// 			$('#target iframe').attr('src','gallery.do')
// 		})
		
// 		$('#ShortCodes').click(function() {
// 			$('#target iframe').attr('src','codes.do')
// 		})
		
// 		$('#map').click(function() {
// 			$('#target iframe').attr('src','map.do')
// 		})	
		
// 		$('#matching').click(function() {
// 			$('#target iframe').attr('src','matching.do')
// 		})	
		
// 		$('#boardPage').click(function() {
// 			$('#target iframe').attr('src','board.do')
// 		})
		
// 		$('#login').click(function() {
// 			$('#target iframe').attr('src','loginForm.do')
// 		})
		
// 		$('#join').click(function() {
// 			$('#target iframe').attr('src','joinForm.do')
// 		})
		
// 		$('#logout').click(function() {
// 			$('#target iframe').attr('src','logout.do')
// 		})
		
// 		$('#myPage').click(function() {
// 			$('#target iframe').attr('src','myPage.do')
// 		})
		
		//////������ ��������//////////
		$('#pop_bt').click(function () {
			$('#pop').show();
		})
		
		$('#close').click(function() {
			$('#pop').hide();
		})
	})
	
	/*************	ũ�� X ���� �̺�Ʈ ó�� *************/
	function candidateLogout(){ // �α׾ƿ� �ĺ��ڸ� ����
		$.ajax({
			url : "candidateLogout.do",
			success : function(){},
			error:function(){}
		})
	}
	
	function candidateCancel(){	//�α׾ƿ� �ĺ��� ���
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
	    candidateLogout(); // ������ ��ȯ�� �α׾ƿ� �ĺ��ڸ� ����
	}
	
	window.onload = function myLoad(event) {
	    if (window.localStorage) {
	        var t0 = Number(window.localStorage['myUnloadEventFlag']);
	        if (isNaN(t0)) t0=0;
	        var t1=new Date().getTime();
	        var duration=t1-t0;
	        if (duration<10*1000) {
	        	candidateCancel(); // ������ ��ȯ�� Ȯ���ϸ� �α׾ƿ� �ĺ��ڸ� ����Ѵ�
	        } else {
	        	LogTime(); //��������ȯ�� �ƴ� ���� â�� �����Ÿ� ���ǻ���
	        }
	    }
	} 
	
	function LogTime(){	//���� ���� 
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

	/**********������***********/
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
				$('#clientCount').html("���� ������ ���� : " + count);
				$('#showClient').html(html);
			},
			error : function() {
				alert("AJAX_showClient����");
			}
		});
		setTimeout("clientList_func()", 1000); //1�ʸ��� �޼ҵ带 �����ϰڴ�
	}
	/******************************/

	/************����ð�************/
	function printTime() {
		var clock = document.getElementById("clock");
		var now = new Date();
		clock.innerHTML = now.getFullYear() + "�� " + (now.getMonth() + 1)
				+ "�� " + now.getDate() + "�� " + now.getHours() + "�� "
				+ now.getMinutes() + "�� " + now.getSeconds() + "��";
		setTimeout("printTime()", 1000); //1�ʸ��� �޼ҵ带 �����ϰڴ�
	}
	/******************************/

	/**********IFRAME ũ��*********/
	function resizeFrame(frm) {
		frm.style.height = "100%";
		contentHeight = frm.contentWindow.document.body.scrollHeight;
		frm.style.height = contentHeight;
	}
	/******************************/
</script>
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
					<li><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>010-1234-5678</li>
					<li><a href="mailto:info@example.com"><span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>SDS1501@sds.com</a></li>
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
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1"
									aria-expanded="false">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse menu--shylock"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav menu__list">

									<li id="home" class="active menu__item menu__item--current">
										<!-- 							<div class="menu__link">Home</div> --> <a
										class="menu__link" href="main.do">Home <span
											class="sr-only">(current)</span></a>
									</li>

									<li id="about" class=" menu__item">
										<!-- 						<div class="menu__link">About</div> --> <a
										class="menu__link" href="about.do">About</a>
									</li>


									<li id="gallery" class=" menu__item">
										<!-- 						<div class="menu__link">Gallery</div> --> <a
										class="menu__link" href="gallery.do">Gallery</a>
									</li>


<!-- 									<li id="ShortCodes" class=" menu__item"> -->
<!-- 																<div class="menu__link">Short Codes</div> <a -->
<!-- 										class="menu__link" href="codes.do">Short Codes</a> -->
<!-- 									</li> -->

									<li id="mapView" class=" menu__item">
										<!-- 							<div class="menu__link">Map</div> --> <a
										class="menu__link" href="map.do">�ֺ� ��������</a>
									</li>


									<li id="boardPage" class=" menu__item">
										<!-- 						<div class="menu__link" >�Խ���</div> --> <a
										class="menu__link" href="board.do">�Խ���</a>
									</li>


									<li id="matching" class=" menu__item">
										<!-- 							<div class="menu__link">Matching</div> --> <a
										class="menu__link" href="matching.do">Matching</a>
									</li>


									<li class=" menu__item">&nbsp;&nbsp;</li>
									<li class=" menu__item">&nbsp;&nbsp;</li>


									<c:if test="${empty sessionScope.loginId}">

										<li id="login" class=" menu__item">
											<!-- 								<div class="menu__link">Login</div> --> <a
											class="menu__link" href="loginForm.do">�α���</a>
										</li>

										<li id="join" class=" menu__item">
											<!-- 								<div class="menu__link">Join</div> --> <a
											class="menu__link" href="joinForm.do">ȸ������</a>
										</li>
									</c:if>
									<c:if test="${not empty sessionScope.loginId}">
										<li id="logout" class=" menu__item">
											<!-- 							<div class="menu__link">Logout</div> --> <a
											class="menu__link" href="logout.do">�α׾ƿ�</a>
										</li>


										<li id="mypage" class=" menu__item">
											<!-- 						<div class="menu__link">MyPage</div> --> <a
											class="menu__link" href="myPage.do">����������</a>
										</li>

									</c:if>

									<li class=" menu__item">&nbsp;&nbsp;</li>
									<li class=" menu__item">&nbsp;&nbsp;</li>

									<li id="pop_bt" class=" menu__item">
										<div class="menu__link">������</div>
									</li>

								</ul>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<!--  ������ �������� -->
	<div id="pop" style="display: none;">
		<div id="clock"></div>
		<div id="clientCount"></div>
		<div id="showClient"></div>
		<div id="close">close</div>
	</div>


	<!--  	���������� ��� -->
	<!-- 	<div id="target">	 -->
	<!-- 		<iframe src="testMain.do" id="the_iframe" width="100%" -->
	<!-- 			onload=resizeFrame(this) frameborder=0 framespacing=0 marginheight=0 -->
	<!-- 			marginwidth=0 scrolling=no vspace="0" style="height: auto;"> -->
	<!-- 		</iframe> -->
	<!-- 	</div> -->

</body>
</html>