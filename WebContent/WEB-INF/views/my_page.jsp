<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>����������</title>
</head>
<body>
<h2>ȸ�� ����</h2>
<table border="1">
	<tr>
		<td>ȸ����ȣ : </td>
		<td>${memberInfo.memberNum}</td>
	</tr>
	<tr>
		<td>���̵� : </td>
		<td>${memberInfo.id}</td>
	</tr>
	<tr>
		<td>�̸� : </td>
		<td>${memberInfo.name}</td>
	</tr>
	<tr>
		<td>�ڵ��� : </td>
		<td>${memberInfo.phone}</td>
	</tr>
	<tr>
		<td>�̸��� : </td>
		<td>${memberInfo.email}</td>
	</tr>
	<tr>
		<td>�ּ� : </td>
		<td>${memberInfo.address}</td>
	</tr>
	
	<tr>
	<td>������ ���� : </td>
	<td><img style="width: 200px;height: 200px;" src="${memberInfo.memberSrc}"></td>
	</tr>
</table>
<hr>
<a href="logout.do">[�α׾ƿ�]</a>
<a href="board.do">[�Խ���]</a>
</body>
</html>
