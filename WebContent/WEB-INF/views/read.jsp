<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function del_func() {
		var result = confirm('���� �����Ͻðڽ��ϱ�?');
		if (result == true) {
			location.href = "delete.do?boardNum=${board.boardNum}";
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<form action="repleForm.do" method="post">
		<input type="hidden" name="ref" value="${board.ref}"> <input
			type="hidden" name="indent" value="${board.indent}"> <input
			type="hidden" name="step" value="${board.step}">
		<table border="1">
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
					value="${board.title}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>�ۼ��� :</td>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<td>��ȸ�� :</td>
				<td>${board.count}</td>
			</tr>
			<tr>
				<td>�ۼ��Ͻ� :</td>
				<td><fmt:formatDate value="${board.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
			</tr>


			<c:if test="${board.boardImg ne 'noImg'}">
				<tr>
					<td>�̹��� ���� :</td>
					<td><img width="200" height="140" src="${board.boardImg}"
						alt="�̹��������� ���� �ʽ��ϴ�"></td>
				</tr>
			</c:if>

			<tr>
				<td>���� :</td>
				<td>${board.contents}</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="[���]">
				</td>
			</tr>
		</table>
	</form>

	<div id="selectBtn">
		<a href="board.do">[���]</a>
		<c:if test="${sessionScope.loginId == board.writer}">
			<a href="updateForm.do?boardNum=${board.boardNum}">[����]</a>
			<a onclick="del_func()" href="#">[����]</a>
		</c:if>
	</div>


</body>
</html>