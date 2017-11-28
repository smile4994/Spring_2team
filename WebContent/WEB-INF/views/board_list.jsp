<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�Խ��� ���</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
</script>
 
</head>
<body>

<form action="board.do" method="post">
	<table border="1">
		<tr>
			<th>�۹�ȣ</th>
			<th>ī�װ�</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>

		<c:if test="${empty boardList}">
			<tr>
				<td colspan="6">�ۼ��� �Խñ��� �������� �ʽ��ϴ�.</td>
			</tr>
		</c:if>
		
		<c:forEach items="${boardList}" var="boardList">
			<tr>
				<td>${boardList.boardNum}</td>
				<td>${boardList.kategorie}</td>
				<td><a href="read.do?boardNum=${boardList.boardNum}">${boardList.title}</a>
				</td>
				<td>${boardList.writer}</td>
				<td><fmt:formatDate value="${boardList.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
				<td>${boardList.count}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right"><a href="logout.do">[�α׾ƿ�]</a>
				<a href="writeForm.do">[�۾���]</a></td>
		</tr>
	</table>
	
	<br>
	<div id="search">
		<select name="searchType">
			<option value="1" selected="selected">����</option>
			<option value="2">�ۼ���</option>
			<option value="3" >ī�װ�</option>
		</select>
		
		<input type="text" name="searchWrite" size="40">
		<input type="submit" value="�˻�">
		
		<input type="hidden" id="searchType">
		<input type="hidden" id="searchWrite">
	</div>
</form>

</body>
</html>