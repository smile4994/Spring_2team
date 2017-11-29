<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>로그인 페이지</title>
</head>
<body>
	<form action="login.do" method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id" size="20" required></td>
			</tr>
			<tr>
				<td>패스워드 :</td>
				<td><input type="password" name="password" size="20" required></td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="입력완료">
				</td>
			</tr>

		</table>


	</form>


</body>
</html>