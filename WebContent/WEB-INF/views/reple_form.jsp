<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>댓글 페이지</title>
</head>
<body>
	<form action="replyWrite.do" method="post">
		<input type="hidden" name="ref" value="${board.ref}"> 
		<input type="hidden" name="indent" value="${board.indent}">
		<input type="hidden" name="step" value="${board.step}">
		<input type="hidden" name="boardImg" value="${board.boardImg}">
		<table>
			<tr>
				<td>카테고리 :</td>
				<td><input type="text" name="kategorie" size="20"
					value="${board.kategorie}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>글번호 :</td>
				<td><input type="text" name="boardNum" size="20"
					value="${board.boardNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" size="20"
					value="└${board.title}" readonly="readonly"></td>
			</tr>
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