<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� �۾�</title>
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
<link href="css/galleryeffect.css" rel="stylesheet" type="text/css"
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
<!-- start-smoth-scrolling -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function fileInfo(f) {
		var file = f.files;
		if (file[0].type.indexOf('image') < 0) { // ������ ������ �̹������� Ȯ��
			$('input[name="img"]').val('');
			alert('�̹��� ���ϸ� �����ϼ���');
			return false;
		}
		var reader = new FileReader(); // FileReader ��ü ���
		reader.onload = function(rst) {
			$('#img_box')
					.html(
							'<img style="width: 300px; height: 200px;" src="' + rst.target.result + '">'); // append �޼ҵ带 ����ؼ� �̹��� �߰�
			// �̹����� base64 ���ڿ��� �߰�
			// �� ����� �����ϸ� ������ �̹����� �̸����� �� �� ����
		}
		reader.readAsDataURL(file[0]); // ������ �д´�
	}

	function go_submit() {
		var str = document.submit.title.value;
		if (!document.submit.title.value) {
			alert("���� �Է��ϼ���.");
			document.submit.title.focus();
			return false;
		}
		if (!document.submit.contents.value) {
			alert("�� ������ �Է��ϼ���.");
			document.submit.title.focus();
			return false;
		}
		var a = str.charAt(0);
		if (a == " ") {
			alert("������ ù���� ������ ������� �ʽ��ϴ�");
			document.submit.title.focus();
			return false;
		}
		return true;
	}
</script>

<style type="text/css">
.table {
  width: 700;
  max-width: 700;
  margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@include file="top.jsp"%>
	
	<div class="gallery">
		<div class="container">
			<h3 class="title">
				Board <span>Write</span>
			</h3>

			<form name="submit" onsubmit="return go_submit()" action="write.do"
				method="post" enctype="multipart/form-data">
				<table class="table table-bordered" >
					<tr>
						<td>ī�װ�</td>
						<td>
						<select name="kategorie" class="btn btn-default dropdown-toggle">
								<option value="����" selected="selected">����</option>
								<option value="�о�">�о�</option>
								<option value="�н�">�н�</option>
						</select></td>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="text"name="title" size="40"></td>
					</tr>
					<tr>
						<td>����÷��</td>
						<td>
						<input type="file" class="btn btn-default" onchange="fileInfo(this)" name="img" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><div id="img_box"></div></td>
					<tr>
					<tr>
						<td>����</td>
						<td><textarea name="contents"  rows="20" cols="50"></textarea></td>
					</tr>

					<tr>
						<td colspan="2" align="right">
						<input type="submit" class="btn btn-default" value="�ۼ��Ϸ�"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>