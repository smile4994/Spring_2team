<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		replyRead_func();
		
		$('#repleOk').click(function() {
			var re_contents = $('#re_contents').val();
			alert(re_contents);

			var allData = {
				"boardNum" : $('input[name=boardNum]').val(),
				"re_contents" : $('#re_contents').val(),
			};

			$.ajax({
				type : 'post',
				url : 'replyWrite.do',
				data : allData,
				//  			dataType : 'text',
				success : function(responseData) {
					alert("ajax성공");
					replyRead_func();
					$('#re_contents').val("");
				},
				error : function() {
					alert("ajax실패");
				}
			})
		})
	})
	
// 	function replyRead_func(){
// 		var replyHtml = "";
// 			replyHtml += "<c:forEach items='${replyList}' var='replyList'>";
// 			replyHtml += "작성자 : "+ '${replyList.re_writer}'+"<br>"; 
// 			replyHtml += "내용 : " +'${replyList.re_contents}'+"<br>";
// 			replyHtml += "작성시간 :"+"<fmt:formatDate value='${replyList.re_date}' type='both' dateStyle='short' timeStyle='short'/>"
// 			replyHtml += "조회수 : " +'${replyList.re_count}'+"<br>";
// 			replyHtml += "<br>"
// 			replyHtml += "</c:forEach>";
// 			$('#replyRead').html(replyHtml);
// 	}
	
	function replyRead_func(){
		var boardNum = ${board.boardNum};
		$.ajax({
 		 	url : 'replyRead.do',
   			type : 'get',
   			data : 'boardNum=' +boardNum,
   			dataType : 'json',
    		success : function(data){
    			alert("AJAX_listReply성공");
    			var replyHtml = "";
    		    $.each(data, function(key, replyList){ 
 					replyHtml += "작성자 : "+replyList.re_writer+"<br>"; 
 					replyHtml += "내용 : " +replyList.re_contents+"<br>";
 					replyHtml += "조회수 : " +replyList.re_count+"<br>";
 					replyHtml += "<br>"
     		   });
     		   $('#replyRead').html(replyHtml);
  			  },
   		 	error : function() {
				alert("AJAX_listReply실패");
			}
		});
	}
	
	
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
					<td><img width="100" height="70" src="${board.boardImg}"
						alt="이미지형식이 맞지 않습니다"></td>
				</tr>
			</c:if>

			<tr>
				<td>내용 :</td>
				<td>${board.contents}</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" name="sbm"
					value="[답글]"></td>
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
	<br>





	<div id="replyRead">
		<!-- 			새로운 댓글이 달리는부분 -->
		<div id="replyForm"></div>
	</div>
	<br>


	<div id="replyWrite">
		<textarea id="re_contents" rows="5" cols="50"
			onclick="if(this.value=='댓글을 입력하세요'){this.value=''}">댓글을 입력하세요</textarea>
		<input type="button" id="repleOk" value="확인">
	</div>



</body>
</html>