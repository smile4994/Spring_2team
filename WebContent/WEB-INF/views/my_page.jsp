<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
<h2>회원 정보</h2>
<table border="1">
	<tr>
		<td>회원번호 : </td>
		<td>${memberInfo.memberNum}</td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td>${memberInfo.id}</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>${memberInfo.name}</td>
	</tr>
	<tr>
		<td>핸드폰 : </td>
		<td>${memberInfo.phone}</td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td>${memberInfo.email}</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>${memberInfo.address}</td>
	</tr>
	
	<tr>
	<td>프로필 사진 : </td>
	<td><img style="width: 200px;height: 200px;" src="${memberInfo.memberSrc}"></td>
	</tr>
</table>
<hr>
<a href="logout.do">[로그아웃]</a>
<a href="board.do">[게시판]</a>
</body>
</html>
