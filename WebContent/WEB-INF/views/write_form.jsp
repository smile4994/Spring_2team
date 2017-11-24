<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>글쓰기 작업</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function fileInfo(f) {
		var file = f.files;
		if (file[0].type.indexOf('image') < 0) { // 선택한 파일이 이미지인지 확인
			alert('이미지 파일만 선택하세요');
			return;
		}
		var reader = new FileReader(); // FileReader 객체 사용
		reader.onload = function(rst) {
			$('#img_box').html('<img style="width: 100px; height: 100px;" src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		}
		reader.readAsDataURL(file[0]); // 파일을 읽는다
	}
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" size="20" required></td>
			</tr>
			<tr>
				<td>파일첨부 :</td>
				<td><input type="file" onchange="fileInfo(this)" name="img" />
					</td>
			</tr>

			<tr>
				<td colspan="2"><div id="img_box"></div></td>
			<tr>
			<tr>
				<td>내용 :</td>
				<td><textarea name="contents" rows="20" cols="30" required></textarea></td>
			</tr>

			<tr>
				<td><input type="submit" value="작성완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>