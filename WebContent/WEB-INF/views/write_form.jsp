<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>글쓰기 작업</title>
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
			if (!f.type.match("image.*")) { // 선택한 파일이 이미지인지 확인
				alert('이미지 파일만 선택하세요');
				return;
			}
			
			sel_file.push(f);
			
			var reader = new FileReader(); // FileReader 객체 사용
			reader.onload = function(rst) {
				var img_html = "<img src=\"" + rst.target.result + "\"/>";
				$(".img_box").append(img_html);
// 				$('#img_box')
// 						.html(
// 								'<img style="width: 100px; height: 100px;" src="'
// 								+ rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
				// 이미지는 base64 문자열로 추가
				// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
			}
			reader.readAsDataURL(f); // 파일을 읽는다
		});
	}

	function go_submit() {
		var str = document.submit.title.value;
		if (!document.submit.title.value) {
			alert("제목를 입력하세요.");
			document.submit.title.focus();
			return false;
		}
		if (!document.submit.contents.value) {
			alert("글 내용을 입력하세요.");
			document.submit.title.focus();
			return false;
		}
		var a = str.charAt(0);
		if (a == " ") {
			alert("제목의 첫글자 공백을 허용하지 않습니다");
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
		카테고리 : 
		<select name="kategorie" style="width:100px;height:20px;">
			<option value="문의" selected="selected">문의</option>
			<option value="분양">분양</option>
			<option value="분실">분실</option>
		</select>
		<table border="1">
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" size="20"></td>
			</tr>
			<tr>
				<td>파일첨부 :</td>
				<td><input type="file" id="img" multiple="multiple"/>
				</td>
			</tr>

			<tr>
				<td colspan="2"><div class="img_box"></div></td>
			<tr>
			<tr>
				<td>내용 :</td>
				<td><textarea name="contents" rows="20" cols="30"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="right"><input type="submit" value="작성완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>