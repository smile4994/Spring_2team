<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>��� ������</title>
</head>
<body>
	<form action="replyWrite.do" method="post">
		<input type="hidden" name="ref" value="${board.ref}"> 
		<input type="hidden" name="indent" value="${board.indent}">
		<input type="hidden" name="step" value="${board.step}">
		<input type="hidden" name="boardImg" value="${board.boardImg}">
		<table>
			<tr>
				<td>ī�װ� :</td>
				<td><input type="text" name="kategorie" size="20"
					value="${board.kategorie}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>�۹�ȣ :</td>
				<td><input type="text" name="boardNum" size="20"
					value="${board.boardNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><input type="text" name="title" size="20"
					value="��${board.title}" readonly="readonly"></td>
			</tr>
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