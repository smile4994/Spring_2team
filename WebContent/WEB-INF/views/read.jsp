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
					alert("ajax����");
					replyRead_func();
					$('#re_contents').val("");
				},
				error : function() {
					alert("ajax����");
				}
			})
		})
	})
	
// 	function replyRead_func(){
// 		var replyHtml = "";
// 			replyHtml += "<c:forEach items='${replyList}' var='replyList'>";
// 			replyHtml += "�ۼ��� : "+ '${replyList.re_writer}'+"<br>"; 
// 			replyHtml += "���� : " +'${replyList.re_contents}'+"<br>";
// 			replyHtml += "�ۼ��ð� :"+"<fmt:formatDate value='${replyList.re_date}' type='both' dateStyle='short' timeStyle='short'/>"
// 			replyHtml += "��ȸ�� : " +'${replyList.re_count}'+"<br>";
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
    			alert("AJAX_listReply����");
    			var replyHtml = "";
    		    $.each(data, function(key, replyList){ 
 					replyHtml += "�ۼ��� : "+replyList.re_writer+"<br>"; 
 					replyHtml += "���� : " +replyList.re_contents+"<br>";
 					replyHtml += "��ȸ�� : " +replyList.re_count+"<br>";
 					replyHtml += "<br>"
     		   });
     		   $('#replyRead').html(replyHtml);
  			  },
   		 	error : function() {
				alert("AJAX_listReply����");
			}
		});
	}
	
	
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
					<td><img width="100" height="70" src="${board.boardImg}"
						alt="�̹��������� ���� �ʽ��ϴ�"></td>
				</tr>
			</c:if>

			<tr>
				<td>���� :</td>
				<td>${board.contents}</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" name="sbm"
					value="[���]"></td>
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
	<br>





	<div id="replyRead">
		<!-- 			���ο� ����� �޸��ºκ� -->
		<div id="replyForm"></div>
	</div>
	<br>


	<div id="replyWrite">
		<textarea id="re_contents" rows="5" cols="50"
			onclick="if(this.value=='����� �Է��ϼ���'){this.value=''}">����� �Է��ϼ���</textarea>
		<input type="button" id="repleOk" value="Ȯ��">
	</div>



</body>
</html>