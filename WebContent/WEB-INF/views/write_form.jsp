<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� �۾�</title>
<style type="text/css">
	.img_box {
		width: 100px;
		margin-top : 50px;
	}
	.img_box img{
		max-width: 100px;
	}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	
	var sel_files = [];
	$(document).ready(function(){
		$("#img").on("change", handleImgsFilesSelect);
	});
	function handleImgsFilesSelect(e) {
		var file = e.files;
		var fileArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if (!f.type.match("image.*")) { // ������ ������ �̹������� Ȯ��
				alert('�̹��� ���ϸ� �����ϼ���');
				return;
			}
			
			sel_file.push(f);
			
			var reader = new FileReader(); // FileReader ��ü ���
			reader.onload = function(rst) {
				var img_html = "<img src=\"" + rst.target.result + "\"/>";
				$(".img_box").append(img_html);
// 				$('#img_box')
// 						.html(
// 								'<img style="width: 100px; height: 100px;" src="'
// 								+ rst.target.result + '">'); // append �޼ҵ带 ����ؼ� �̹��� �߰�
				// �̹����� base64 ���ڿ��� �߰�
				// �� ����� �����ϸ� ������ �̹����� �̸����� �� �� ����
			}
			reader.readAsDataURL(f); // ������ �д´�
		});
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
</head>
<body>
	<form name="submit" onsubmit="return go_submit()" action="write.do"
		method="post" enctype="multipart/form-data">
		ī�װ� : 
		<select name="kategorie" style="width:100px;height:20px;">
			<option value="����" selected="selected">����</option>
			<option value="�о�">�о�</option>
			<option value="�н�">�н�</option>
		</select>
		<table border="1">
			<tr>
				<td>���� :</td>
				<td><input type="text" name="title" size="20"></td>
			</tr>
			<tr>
				<td>����÷�� :</td>
				<td><input type="file" id="img" multiple="multiple"/>
				</td>
			</tr>

			<tr>
				<td colspan="2"><div class="img_box"></div></td>
			<tr>
			<tr>
				<td>���� :</td>
				<td><textarea name="contents" rows="20" cols="30"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="right"><input type="submit" value="�ۼ��Ϸ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>