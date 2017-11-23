<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>회원가입 페이지</title>
</head>
<body>
	<h2>회원가입 페이지</h2>
	<form action="join.do">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id" size="10" required></td>
			</tr>
			<tr>
				<td>패스워드 :</td>
				<td><input type="password" name="password" size="10" required></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="email" name="email" size="10"></td>
			</tr>
			<tr>
				<td>폰번호 :</td>
				<td><input type="tel" name="phone" placeholder="'-'없이"></td>
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