<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� �۾�</title>
</head>
<body>
<form action="write.do" method="post">
	<table>
	 	<tr>
	 		<td>���� : </td>
	 		<td><input type="text" name="title" size="20" required></td>
	 	</tr>
	 	<tr>
	 		<td>���� : </td>
	 		<td><textarea name="contents" rows="20" cols="30" required></textarea></td>
	 	</tr>
	 	<tr>
	 		<td><input type="submit" value="�ۼ��Ϸ�"></td>
	 	</tr>
	</table>
	</form>
</body>
</html>