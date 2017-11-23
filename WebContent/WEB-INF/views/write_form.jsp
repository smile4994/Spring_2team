<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>글쓰기 작업</title>
</head>
<body>
<form action="write.do" method="post">
	<table>
	 	<tr>
	 		<td>제목 : </td>
	 		<td><input type="text" name="title" size="20" required></td>
	 	</tr>
	 	<tr>
	 		<td>내용 : </td>
	 		<td><textarea name="contents" rows="20" cols="30" required></textarea></td>
	 	</tr>
	 	<tr>
	 		<td><input type="submit" value="작성완료"></td>
	 	</tr>
	</table>
	</form>
</body>
</html>