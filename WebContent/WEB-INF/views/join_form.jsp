<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>ȸ������</title>
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
<link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />

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
		//�̹��� ���� ���ε� �� �̸����� �۾�
		var file = f.files;
		if (file[0].type.indexOf('image') < 0) { // ������ ������ �̹������� Ȯ��
			alert('�̹��� ���ϸ� �����ϼ���');
			$('input[name="memImg"]').val('');
			$('#img_box').html('');
			return false;
		}
		var reader = new FileReader(); // FileReader ��ü ���
		reader.onload = function(rst) {
			$('#img_box')
					.html(
							'<img style="width: 100px; height: 100px;" src="' + rst.target.result + '">'); // append �޼ҵ带 ����ؼ� �̹��� �߰�
			// �̹����� base64 ���ڿ��� �߰�
			// �� ����� �����ϸ� ������ �̹����� �̸����� �� �� ����
		}
		reader.readAsDataURL(file[0]); // ������ �д´�
	}
</script>
<script type="text/javascript">
function pwCheck(event){
	//��й�ȣ ��ġ �˻�
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();
	console.log(pw +"/"+pw2);
	console.log(event.keyCode);

	if(pw != pw2){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
	}else{
		$('input[name="pwChk"]').css('color','green');
		$('input[name="pwChk"]').val('��й�ȣ�� ��ġ�մϴ�.');
	}
}

function onlyNumber(event){
	//�޴�����ȣ�� ���ڸ� �Է� �����ϰ�
	var keyID = (event.which) ? event.which : event.keyCode;
	console.log(keyID +"/"+event.keyCode);
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39){
		$('input[name="pwChk"]').val('');
		return;
	}else{
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('���ڸ� �Է��ϼ���');
		$('input[name="phone"]').val('');
		return false;
	}
}
function check(){
	//Form Submit�� �����ϱ� ���� �Լ�
	//���� ����ְų�, ID�� PW�� Ư�����ڳ� ������ ������ return false;
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();

	if( id == '' || id == null || pw == '' || pw == null || pw2=='' || pw2==null){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('���� �Է����ּ���');
	    return false;
	}
	var blank_pattern = /^\s+|\s+$/g;
	if(id.replace(blank_pattern,'') == ""||pw.replace(blank_pattern,'') == ""||pw2.replace(blank_pattern,'') == ""){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('���鸸 �ԷµǾ����ϴ�');
	    return false;
	}
	var blank_pattern = /[\s]/g;
	if(blank_pattern.test(id) == true || blank_pattern.test(pw) == true || blank_pattern.test(pw2) == true){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('������ ����� �� �����ϴ�');
	    return false;
	}
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if(special_pattern.test(id) == true || special_pattern.test(pw) == true || special_pattern.test(pw2) == true){
		$('input[name="pwChk"]').css('color','red');
		$('input[name="pwChk"]').val('Ư�����ڴ� ����� �� �����ϴ�');
	    return false;
	}
	if(pw != pw2){
		$('input[name="pwChk"]').val('��й�ȣ�� �ٸ��ϴ�.');
		return false;
	}
	
	var phone = $('input[name="phone"]').val();
	var email = $('input[name="email"]').val();
	var name = $('input[name="name"]').val();
	//profile���� controller���� ���� ������ default.jpg�� �ֱ⶧���� ����
// 	var profile = $('input[name="memImg"]').val();
	//address�� ��Ʈ�ѷ��� ��ü�� ��� �ѱ涧 ���
	//address1�� �����ȣ address2�� �����ּ�[�� �ѱ� �ʿ� ��� �� Ȯ�θ�] 
	var address = $('input[name="address"]').val();
	var address1 = $('input[name="address1"]').val();
	//address2(���� �ּ�)�� ���� ��쵵 �־ ����
// 	var address2 = $('input[name="address2"]').val();
	//���̵� ��й�ȣ �ڸ��� �˻�
	if(id.length > 12 || pw.length>12 || pw2.length>12){
		$('input[name="pwChk"]').val('���̵� �н������ 12�ڸ� ����');
		return false;
	}
	//�� �� Ȯ�� �۾�[�������� ���� �� default��]
	if(phone == null || phone == '' || email == null || email==''|| name==null ||name=='' || address==null || address=='' || address1 == null || address1==''){
		$('input[name="pwChk"]').val('�� ���� ä�켼��');
		return false;
	}else{
		$('input[name="pwChk"]').val('ȸ������ ����');
		$('#joinForm').submit();
	}
	
}
</script>
<!-- start-smoth-scrolling -->
</head>
<body>

	<%@include file="top.jsp"%>
	<div class="news-left">
		<div class="container">
			<h3 class="title ">
				ȸ��
				<span> ����</span>
			</h3>
			<form id="joinForm" action="join.do" method="post" enctype="multipart/form-data">
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">ID</span>
					<input type="text" class="form-control" placeholder="User id"
						name="id" aria-describedby="sizing-addon1">
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
						placeholder="���� �޼���" value="" aria-describedby="sizing-addon1"
						disabled="disabled">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">NAME</span>
					<input type="text" class="form-control" placeholder="User name"
						name="name" aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PHONE</span>
					<input type="text" class="form-control" placeholder=" - ����"
						onkeyup="onlyNumber(event);" name="phone"
						aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">E-MAIL</span>
					<input type="text" class="form-control" placeholder="User email"
						name="email" aria-describedby="basic-addon1">
				</div>
				<div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1">�ּ�</span>
				<input type="text" id="sample4_postcode" class="form-control"
					name="address1" placeholder="�����ȣ">
					</div>
				<div class="input-group input-group-lg">
				<span class="input-group-addon">
					<input type="button" onclick="sample4_execDaumPostcode()"
						value="�ּ�ã��"></span>
						
					<span id="guide" style="color: #999"></span>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
	//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

						// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
						// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
						if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('sample4_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
						if (data.autoRoadAddress) {
							//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(���� ���� �ּ� : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
				<input type="text" id="sample4_roadAddress" class="form-control"
					name="address" placeholder="���θ��ּ�" value="${memberInfo.address}"><br>
				<input type="text" id="sample4_jibunAddress"
					name="address2" class="form-control" placeholder="�����ּ�">
</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">������</span>
					<input type="file" onchange="fileInfo(this)" class="form-control"
						name="memImg" placeholder="User profile"
						aria-describedby="sizing-addon1">
					<div id="img_box"></div>
				</div>
			</form>
<!-- 			<div class="row"> -->
				<div class="in-gp-tb">
					<div class="input-group">
						<button class="btn btn-default" onclick="check();" id="join" type="button">ȸ������</button>
						<a href="javascript:history.back()"><button class="btn btn-default" id="cancel" type="button">�ڷΰ���</button></a>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
<!-- 			</div> -->
			<!-- /.row -->
		</div>
	</div>
	<!-- contact -->
	<div class="contact-form">
		<div class="container">
			<h3 class="title">
				Contact
				<span>Us</span>
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