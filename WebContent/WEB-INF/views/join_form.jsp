<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>ȸ������ ������</title>
</head>
<body>
	<h2>ȸ������ ������</h2>
	<form action="join.do">
		<table>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" name="id" size="10" required></td>
			</tr>
			<tr>
				<td>�н����� :</td>
				<td><input type="password" name="password" size="10" required></td>
			</tr>
			<tr>
				<td>�̸��� :</td>
				<td><input type="email" name="email" size="10"></td>
			</tr>
			<tr>
				<td>����ȣ :</td>
				<td><input type="tel" name="phone" placeholder="'-'����"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="�Է¿Ϸ�">
				</td>
			</tr>
		</table>

	</form>

</body>
</html>