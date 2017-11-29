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
		$('#replyOk').click(function() {
			replyWrite_func();
		})
		$('#replyDel').click(function() {
			alert("replyDel����");
		})
	})
	
	function replyDel_func(replyNum) {
		var replyNum = replyNum;
		var result = "����";
		$.ajax({
			url : 'replyDelete.do',
			type : 'get',
			data : 'replyNum=' +replyNum,
			success : function(data) {
				replyRead_func();
				if(data != result){
					alert("�ٸ�������� �ǵ帱�� ����");
				}
			},
			error : function() {
			}
		})
	}
	
	function replyWrite_func(){
		var re_contents = $('#re_contents').val();
		var allData = {
			"boardNum" : $('input[name=boardNum]').val(),
			"re_contents" : $('#re_contents').val()
		};
		$.ajax({
			type : 'post',
			url : 'replyWrite.do',
			data : allData,
			success : function(responseData) {
				replyRead_func();
				$('#re_contents').val("");
			},
			error : function() {
				alert("ajax����");
			}
		})
	}
	
	function replyRead_func(){
		var boardNum = ${board.boardNum};
		$.ajax({
 		 	url : 'replyRead.do',
   			type : 'get',
   			data : 'boardNum=' +boardNum,
   			dataType : 'json',
    		success : function(data){
    			var replyHtml = "";
    		    $.each(data, function(key, replyList){ 
 					replyHtml += "<div style='width:25%'><b>"+replyList.re_writer+"</b>&nbsp:&nbsp"; 
 					replyHtml += replyList.re_contents;
 					replyHtml += "<a id='replyDel' onclick='replyDel_func("+replyList.reply_num+")' style='color:grey;'>&times;</a>";
 					replyHtml += "<div style='font-size:12px;font-style:monospace; color:grey; margin-top:5px; margin-bottom:3px;'>"+replyList.re_date + "</div><hr>";
 					replyHtml += "</div>" 					
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
	
<!-- 	������ �޸��ºκ� -->
	<div id="replyRead">
	</div>

	<div id="replyWrite">
		<textarea id="re_contents" rows="5" cols="50"
			onclick="if(this.value=='����� �Է��ϼ���'){this.value=''}">����� �Է��ϼ���</textarea>
		<input type="button" id="replyOk" value="Ȯ��">
	</div>

</body>
</html>