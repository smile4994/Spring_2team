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
/*************	크롬 X 종료 이벤트 처리 *************/
function candidateLogout(){ // 로그아웃 후보자를 지정
	$.ajax({
		url : "candidateLogout.do",
		success : function(){
			console.log("페이지 내리면서 로그아웃 후보 등록");
		},
		error:function(){
			console.log("페이지 내리면서 로그아웃 후보 등록실패");
		}
	})
}

function candidateCancel(){	//로그아웃 후보자 취소
	$.ajax({
		url : "candidateCancel.do",
		success : function(){
			console.log("페이지 내리면서 로그아웃 후보 등록 취소");
		},
		error:function(){
			console.log("페이지 내리면서 로그아웃 후보 등록 취소 실패");
			
		}
	})
}

window.onbeforeunload = function myUnload(event) {
// 	alert("???????????????????????????????????????????????????????");
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
        if (duration<(10*1000)) {
        	candidateCancel(); // 페이지 전환이 확실하면 로그아웃 후보자를 취소한다
        } else {
        	alert('test:'+duration);
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

	$(function() {
		printTime();  //현재시간
		clientList_func();	//클라이언트 확인
		
		//////접속자 눌렀을때//////////
		$('#pop_bt').click(function () {
			$('#pop').show();
		})
		
		$('#close').click(function() {
			$('#pop').hide();
		})
	})
	

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
					html += "<a onclick='message_func(\""+clientList+"\")' style='cursor: pointer;'>";
					html += clientList;
					html += "</a> <br>"
					count++;
				});
				$('#clientCount').html("현재 접속자 수는 : " + count);
				$('#showClient').html(html);
			},
			error : function() {
				alert("AJAX_showClient실패");
			}
		});
		setTimeout("clientList_func()", 1*1000); //1초마다 메소드를 실행하겠다
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

	
	/**********쪽지 보내기**********/
	function message_func(receiver) {
		if("${loginId}"==receiver){
			alert('자신에게 보낼 수 없음');
			return false;
		}else{
			var text = prompt('보낼 메세지');
		}
		if (text == '' || text == null) {
			alert('메세지 전송 취소 or 값을 입력해주세요');
			return false;
		} else {
			$.ajax({
				url : 'messageSend.do',
				type : 'POST',
				data : ({'content':text,'receiver':receiver}),
				dataType : 'text',
				cache : false,
				success : function(data) {
					console.log('ajax 메세지 전송 성공');
					location.href="main.do";
				},
				error : function() {
					console.log('ajax 메세지 전송 실패');
				}
			});
		}
	}
	/***************************/
	
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
					<li><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>1588-3357</li>
					<li>
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>SDS1501@multicampus.com</li>
				</ul>
			</div>
<!-- 			<div class="header-right"> -->
<!-- 				<div class="search"> -->
<!-- 					<form action="#" method="post"> -->
<!-- 						<input type="search" name="Search" value="Search" -->
<!-- 							onfocus="this.value = '';" -->
<!-- 							onblur="if (this.value == '') {this.value = 'Search';}" -->
<!-- 							required=""> <input type="submit" value=" "> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
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

									<li id="boardPage" class=" menu__item">
										<!-- 						<div class="menu__link" >게시판</div> --> <a
										class="menu__link" href="board.do">Make Family</a>
									</li>

									<li id="gallery" class=" menu__item">
										<!-- 						<div class="menu__link">Gallery</div> --> <a
										class="menu__link" href="gallery.do">Find Family</a>
									</li>

									<li id="mapView" class=" menu__item">
										<!-- 							<div class="menu__link">Map</div> --> <a
										class="menu__link" href="map.do">Pet Clinic</a>
									</li>




<!-- 									<li id="matching" class=" menu__item"> -->
<!-- 																	<div class="menu__link">Matching</div> <a -->
<!-- 										class="menu__link" href="matching.do">Matching</a> -->
<!-- 									</li> -->
									
<!-- 									<li id="matching" class=" menu__item"> -->
<!-- 																	<div class="menu__link">Matching</div> <a -->
<!-- 										class="menu__link" href="codes.do">codes</a> -->
<!-- 									</li> -->
									
									<li class=" menu__item">&nbsp;&nbsp;</li>
									<li class=" menu__item">&nbsp;&nbsp;</li>


									<c:if test="${empty sessionScope.loginId}">

										<li id="login" class=" menu__item">
											<!-- 								<div class="menu__link">Login</div> --> <a
											class="menu__link" href="loginForm.do">Login</a>
										</li>

										<li id="join" class=" menu__item">
											<!-- 								<div class="menu__link">Join</div> --> <a
											class="menu__link" href="joinForm.do">Join</a>
										</li>
									</c:if>
									<c:if test="${not empty sessionScope.loginId}">
										<li id="logout" class=" menu__item">
											<!-- 							<div class="menu__link">Logout</div> --> <a
											class="menu__link" href="logout.do">Logout</a>
										</li>


										<li id="mypage" class=" menu__item">
											<!-- 						<div class="menu__link">MyPage</div> --> <a
											class="menu__link" href="myPage.do">My Page</a>
										</li>

									</c:if>

									<li class=" menu__item">&nbsp;&nbsp;</li>
									<li class=" menu__item">&nbsp;&nbsp;</li>

									<li id="pop_bt" class=" menu__item">
										<a class="menu__link">On User</a>
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
	<div id="pop" style="display: none;">
		<div id="clock"></div>
		<div id="clientCount"></div>
		<div id="showClient"></div>
		<div id="close">close</div>
	</div>

<!-- 	<form id="messageForm" action="messageSend.do" method="post"> -->
<!-- 		<input type="hidden" name="content" value="">  -->
<!-- 		<input type="hidden" name="receiver" value=""> -->
<!-- 	</form> -->

</body>
</html>