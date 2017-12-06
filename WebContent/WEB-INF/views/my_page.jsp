<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pets Love Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
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
<script type="text/javascript">
	function fileInfo(f) {
		//이미지 파일 업로드 전 미리보기 작업
		var file = f.files;
		if (file[0].type.indexOf('image') < 0) { // 선택한 파일이 이미지인지 확인
			alert('이미지 파일만 선택하세요');
			$('input[name="memImg"]').val('');
			$('#img_box').html('');
			return false;
		}
		var reader = new FileReader(); // FileReader 객체 사용
		reader.onload = function(rst) {
			$('#img_box')
					.html(
							'<img style="width: 100px; height: 100px;" src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		}
		reader.readAsDataURL(file[0]); // 파일을 읽는다
	}
</script>
<script type="text/javascript">
function pwCheck(event){
	//비밀번호 일치 검사
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();
	console.log(pw +"/"+pw2);
	console.log(event.keyCode);

	if(pw != pw2){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('비밀번호가 일치하지 않습니다.');
	}else{
		$('input[name="pwChk"]').css('color','green');
		$('input[name="pwChk"]').val('비밀번호가 일치합니다.');
	}
}

function onlyNumber(event){
	//휴대폰번호에 숫자만 입력 가능하게
	var keyID = (event.which) ? event.which : event.keyCode;
	console.log(keyID +"/"+event.keyCode);
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39){
		$('input[name="pwChk"]').val('');
		return;
	}else{
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('숫자만 입력하세요');
		$('input[name="phone"]').val('');
		return false;
	}
}
function check(){
	//Form Submit을 진행하기 위한 함수
	//값이 비어있거나, ID나 PW에 특수문자나 공백이 있을때 return false;
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();

	if( id == '' || id == null || pw == '' || pw == null || pw2=='' || pw2==null){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('값을 입력해주세요');
	    return false;
	}
	var blank_pattern = /^\s+|\s+$/g;
	if(id.replace(blank_pattern,'') == ""||pw.replace(blank_pattern,'') == ""||pw2.replace(blank_pattern,'') == ""){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('공백만 입력되었습니다');
	    return false;
	}
	var blank_pattern = /[\s]/g;
	if(blank_pattern.test(id) == true || blank_pattern.test(pw) == true || blank_pattern.test(pw2) == true){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('공백은 사용할 수 없습니다');
	    return false;
	}
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if(special_pattern.test(id) == true || special_pattern.test(pw) == true || special_pattern.test(pw2) == true){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('특수문자는 사용할 수 없습니다');
	    return false;
	}
	if(pw != pw2){
		$('input[name="pwChk"]').val('비밀번호가 다릅니다.');
		return false;
	}
	
	var phone = $('input[name="phone"]').val();
	var email = $('input[name="email"]').val();
	var name = $('input[name="name"]').val();
	var profile = $('input[name="memImg"]').val();
	//address는 컨트롤러로 객체에 담아 넘길때 사용
	//address1은 우편번호 address2는 지번주소[값 넘길 필요 없어서 빈값 확인만] 
	var address = $('input[name="address"]').val();
	//아이디 비밀번호 자릿수 검사
	if(id.length > 12 || pw.length>12 || pw2.length>12){
		$('input[name="pwChk"]').val('아이디나 패스워드는 12자리 이하');
		return false;
	}
	//빈 값 확인 작업[프로필은 없을 시 default값]
	if(phone == null || phone == '' || email == null || email==''|| name==null ||name=='' || address==null || address==''){
		$('input[name="pwChk"]').val('빈 값을 채우세요');
		return false;
	}else{
		$('input[name="pwChk"]').val('회원수정 진행');
		$('#updateForm').submit();
	}
	
}
</script>

<script type="text/javascript">
function deleteMember(){
	var input = confirm('탈퇴하시겠습니까?');
	if(input == true){
		var input2 = confirm('정말로 탈퇴하시겠습니까?');
		if(input2 == true){
			var input3 = confirm('탈퇴를 원하시면 "취소" 를 눌러주세요');
			if(input3 == false){
				location.href="deleteMember.do";
			}else{
				alert('ㅋㅋㅋㅋ');
			}
		}
	}
	return false;
	
}

</script>
<!-- start-smoth-scrolling -->
</head>
<body>

	<%@include file="top.jsp"%>
	<div class="news-left">
		<div class="container">
			<h3 class="title ">
				마이
				<span>페이지</span>
			</h3>
			<form id="updateForm" action="updateMember.do" method="post" enctype="multipart/form-data" class="inputForm">
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">회원 번호</span>
					<input type="text" class="form-control" name="memberNum" value="${memberInfo.memberNum}" readonly="readonly">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">ID</span>
					<input type="text" class="form-control" name="id" value="${memberInfo.id}" readonly="readonly">
				</div>

				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PW</span>
					<input type="password" class="form-control" name="pw"
						onkeyup="pwCheck(event);" placeholder="User password1"
						aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PW</span>
					<input type="password" class="form-control" name="pw2"
						onkeyup="pwCheck(event);" placeholder="User password2"
						aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">ERROR MSG</span>
					<input type="text" class="form-control" name="pwChk"
						placeholder="에러 메세지" value="" aria-describedby="sizing-addon1"
						disabled="disabled">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">NAME</span>
					<input type="text" class="form-control" placeholder="User name"
						name="name" aria-describedby="sizing-addon1"  value="${memberInfo.name}" readonly="readonly">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PHONE</span>
					<input type="text" class="form-control" placeholder=" - 생략"
						onkeyup="onlyNumber(event);" name="phone"
						aria-describedby="sizing-addon1"  value="${memberInfo.phone}">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">E-MAIL</span>
					<input type="text" class="form-control" placeholder="User email"
						name="email" aria-describedby="basic-addon1"  value="${memberInfo.email}">
				</div>
				<div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1">주소</span>
				<input type="text" id="sample4_postcode" class="form-control"
					name="address1" placeholder="우편번호">
					</div>
				<div class="input-group input-group-lg">
				<span class="input-group-addon">
					<input type="button" onclick="sample4_execDaumPostcode()"
						value="주소찾기"></span>
						
					<span id="guide" style="color: #999"></span>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
				<input type="text" id="sample4_roadAddress" class="form-control"
					name="address" placeholder="도로명주소" value="${memberInfo.address}"><br>
				<input type="text" id="sample4_jibunAddress"
					name="address2" class="form-control" placeholder="지번주소">
</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">프로필</span>
					<input type="file" onchange="fileInfo(this)" class="form-control"
						name="memImg" placeholder="User profile"
						aria-describedby="sizing-addon1">
					<div id="img_box"><img style="width: 100px; height: 100px;" src="${memberInfo.memberSrc}"></div>
				</div>
			</form>
			<div class="row">
				<div class="in-gp-tb">
					<div class="input-group">
						<button class="btn btn-default" onclick="check();" type="button">수정하기</button>
						<a href="javascript:history.back()"><button class="btn btn-default" type="button">뒤로가기</button></a>
						<a href="messageList.do"><button class="btn btn-default" type="button">쪽지함</button></a>
						<button class="btn btn-default" ONCLICK="deleteMember();"type="button">회퇴원탈</button>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- contact -->
<jsp:include page="bottom.jsp"/>
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