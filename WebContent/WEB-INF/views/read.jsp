<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function del_func() {
		var result = confirm('정말 삭제하시겠습니까?');
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
				<td>카테고리 :</td>
				<td><input type="text" name="kategorie" size="20"
					value="${board.kategorie}" readonly="readonly"></td>
			</tr>

			<tr>
				<td>글번호 :</td>
				<td><input type="text" name="boardNum" size="20"
					value="${board.boardNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" size="20"
					value="${board.title}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>작성자 :</td>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<td>조회수 :</td>
				<td>${board.count}</td>
			</tr>
			<tr>
				<td>작성일시 :</td>
				<td><fmt:formatDate value="${board.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
			</tr>


			<c:if test="${board.boardImg ne 'noImg'}">
				<tr>
					<td>이미지 파일 :</td>
					<td><img width="200" height="140" src="${board.boardImg}"
						alt="이미지형식이 맞지 않습니다"></td>
				</tr>
			</c:if>

			<tr>
				<td>내용 :</td>
				<td>${board.contents}</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="[답글]">
				</td>
			</tr>
		</table>
	</form>

	<div id="selectBtn">
		<a href="board.do">[목록]</a>
		<c:if test="${sessionScope.loginId == board.writer}">
			<a href="updateForm.do?boardNum=${board.boardNum}">[수정]</a>
			<a onclick="del_func()" href="#">[삭제]</a>
		</c:if>
	</div>


</body>
</html>