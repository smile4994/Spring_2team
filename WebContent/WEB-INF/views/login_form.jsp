<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>�α��� ������</title>
</head>
<body>
	<form action="login.do" method="post">
		<table>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" name="id" size="20" required></td>
			</tr>
			<tr>
				<td>�н����� :</td>
				<td><input type="password" name="password" size="20" required></td>
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