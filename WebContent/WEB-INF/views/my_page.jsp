<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>����������</title>
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
	var profile = $('input[name="memImg"]').val();
	//address�� ��Ʈ�ѷ��� ��ü�� ��� �ѱ涧 ���
	//address1�� �����ȣ address2�� �����ּ�[�� �ѱ� �ʿ� ��� �� Ȯ�θ�] 
	var address = $('input[name="address"]').val();
	//���̵� ��й�ȣ �ڸ��� �˻�
	if(id.length > 12 || pw.length>12 || pw2.length>12){
		$('input[name="pwChk"]').val('���̵� �н������ 12�ڸ� ����');
		return false;
	}
	//�� �� Ȯ�� �۾�[�������� ���� �� default��]
	if(phone == null || phone == '' || email == null || email==''|| name==null ||name=='' || address==null || address==''){
		$('input[name="pwChk"]').val('�� ���� ä�켼��');
		return false;
	}else{
		$('input[name="pwChk"]').val('ȸ������ ����');
		$('#updateForm').submit();
	}
	
}
</script>

<script type="text/javascript">
function deleteMember(){
	var input = confirm('Ż���Ͻðڽ��ϱ�?');
	if(input == true){
		var input2 = confirm('������ Ż���Ͻðڽ��ϱ�?');
		if(input2 == true){
			var input3 = confirm('Ż�� ���Ͻø� "���" �� �����ּ���');
			if(input3 == false){
				location.href="deleteMember.do";
			}else{
				alert('��������');
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
				����
				<span>������</span>
			</h3>
			<form id="updateForm" action="updateMember.do" method="post" enctype="multipart/form-data" class="inputForm">
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">ȸ�� ��ȣ</span>
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
						placeholder="���� �޼���" value="" aria-describedby="sizing-addon1"
						disabled="disabled">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">NAME</span>
					<input type="text" class="form-control" placeholder="User name"
						name="name" aria-describedby="sizing-addon1"  value="${memberInfo.name}" readonly="readonly">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">PHONE</span>
					<input type="text" class="form-control" placeholder=" - ����"
						onkeyup="onlyNumber(event);" name="phone"
						aria-describedby="sizing-addon1"  value="${memberInfo.phone}">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">E-MAIL</span>
					<input type="text" class="form-control" placeholder="User email"
						name="email" aria-describedby="basic-addon1"  value="${memberInfo.email}">
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
					<div id="img_box"><img style="width: 100px; height: 100px;" src="${memberInfo.memberSrc}"></div>
				</div>
			</form>
			<div class="row">
				<div class="in-gp-tb">
					<div class="input-group">
						<button class="btn btn-default" onclick="check();" type="button">�����ϱ�</button>
						<a href="javascript:history.back()"><button class="btn btn-default" type="button">�ڷΰ���</button></a>
						<a href="messageList.do"><button class="btn btn-default" type="button">������</button></a>
						<button class="btn btn-default" ONCLICK="deleteMember();"type="button">ȸ���Ż</button>
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