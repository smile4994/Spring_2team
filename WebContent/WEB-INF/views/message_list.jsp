<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메세지함</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/galleryeffect.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css"
	media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<!-- fonts -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet'
	type='text/css'>
<!-- //fonts -->

<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	function closemsgList() {
		window.close();
	}
	function deleteMessage(messageNum) {
		var messageNum = messageNum;
		console.log(messageNum);
		$.ajax({
			url : 'messageDel.do',
			type : 'get',
			data : 'messageNum=' + messageNum,
			cache : false,
			success : function(data) {
				if (data == "성공") {
					alert('삭제 완료');
					location.href="messageList.do";
				} else {
					alert('삭제 실패');
				}
			},
			error : function() {
			}
		})
	}
</script>
</head>
<body>
	<div class="gallery">
		<div class="container">
			<h3 class="title">
				쪽지
				<span>보관함</span>
			</h3>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>쪽지번호</th>
						<th>보낸사람</th>
						<th>내용</th>
						<th>보낸날짜</th>
						<th>삭제</th>
					</tr>
				</thead>

				<tbody>

					<c:if test="${empty messageList}">
						<tr>
							<td colspan="5">쪽지 온게 없습니다</td>
						</tr>
					</c:if>

					<c:if test="${not empty messageList}">
						<c:forEach items="${messageList}" var="message">
							<tr>
								<td>${message.messageNum}</td>
								<td>${message.sender }</td>
								<td>${message.content }</td>
								<td>${message.writeDate }</td>
								<td><a onclick="deleteMessage('${message.messageNum}');">x</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="input-group">
				<span class="input-group-btn">
					<input type="button" class="btn btn-default"
						onclick="closemsgList();" value="닫기">
				</span>
			</div>
		</div>

	</div>
</body>
</html>