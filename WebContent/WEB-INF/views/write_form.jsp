<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� �۾�</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function fileInfo(f) {
		var file = f.files;
		if (file[0].type.indexOf('image') < 0) { // ������ ������ �̹������� Ȯ��
			alert('�̹��� ���ϸ� �����ϼ���');
			return;
		}
		var reader = new FileReader(); // FileReader ��ü ���
		reader.onload = function(rst) {
			$('#img_box').html('<img style="width: 100px; height: 100px;" src="' + rst.target.result + '">'); // append �޼ҵ带 ����ؼ� �̹��� �߰�
			// �̹����� base64 ���ڿ��� �߰�
			// �� ����� �����ϸ� ������ �̹����� �̸����� �� �� ����
		}
		reader.readAsDataURL(file[0]); // ������ �д´�
	}
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>���� :</td>
				<td><input type="text" name="title" size="20" required></td>
			</tr>
			<tr>
				<td>����÷�� :</td>
				<td><input type="file" onchange="fileInfo(this)" name="img" />
					</td>
			</tr>

			<tr>
				<td colspan="2"><div id="img_box"></div></td>
			<tr>
			<tr>
				<td>���� :</td>
				<td><textarea name="contents" rows="20" cols="30" required></textarea></td>
			</tr>

			<tr>
				<td><input type="submit" value="�ۼ��Ϸ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>