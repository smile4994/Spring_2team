<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>������Ʈ ������</title>
</head>
<body>
	<form action="updateWrite.do" method="post">
		<table>
			<tr>
				<td>�۹�ȣ :</td>
				<td><input type="text" name="boardNum" size="20"
					value="${board.boardNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><input type="text" name="title" size="20"
					value="${board.title}" required></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><textarea name="contents" rows="20" cols="30" required>${board.contents}</textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="�ۼ��Ϸ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>