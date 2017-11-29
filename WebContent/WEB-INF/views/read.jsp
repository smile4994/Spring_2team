<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet' type='text/css'><!-- //fonts -->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		replyRead_func();
		$('#replyOk').click(function() {
			replyWrite_func();
		})
		$('#replyDel').click(function() {
			alert("replyDel누름");
		})
	})
	
	function replyDel_func(replyNum) {
		var replyNum = replyNum;
		var result = "성공";
		$.ajax({
			url : 'replyDelete.do',
			type : 'get',
			data : 'replyNum=' +replyNum,
			success : function(data) {
				replyRead_func();
				if(data != result){
					alert("다른사람글은 건드릴수 없어");
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
				alert("ajax실패");
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

<style type="text/css">
.table{
	text-align : center;
	width:50%;
	height:auto;
	margin:auto;
	border-style:solid;
	border-bottom-width: 2px;
	border-color:black;
	border: 1;
}
tr:hover{
	background-color:silver;
	opacity: 0.8;
}
</style>
</head>
<body>
<jsp:include page="../../top.jsp"/>
	<form action="repleForm.do" method="post">
		<input type="hidden" name="ref" value="${board.ref}"> <input
			type="hidden" name="indent" value="${board.indent}"> <input
			type="hidden" name="step" value="${board.step}">
		<div class="bs-docs-example">
			<table class="table table-striped">
			<tr>
				<td>카테고리</td>
				<td><input type="text" name="kategorie" size="20"
					value="${board.kategorie}" readonly="readonly"></td>
			</tr>

			<tr>
				<td>글번호</td>
				<td><input type="text" name="boardNum" size="20"
					value="${board.boardNum}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" size="20"
					value="${board.title}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.count}</td>
			</tr>
			<tr>
				<td>작성일시</td>
				<td><fmt:formatDate value="${board.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
			</tr>


			<c:if test="${board.boardImg ne 'noImg'}">
				<tr>
					<td>이미지 파일 :</td>
					<td align="center">
					<a href="#image-7">
					<figure class="effect-apollo">
					<img width="420" height="120" src="${board.boardImg}"
						alt="image7">
						<div class="gal-info">							
								<p>이미지가 보여집니다</p>
						</div>
					</figure>
					</a>
					</td>
				</tr>
			</c:if>
			<tr>
				<td>내용 :</td>
				<td>${board.contents}</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" name="sbm" class="btn btn-default" 
					value="[답글]"></td>
			</tr>
		</table>
		</div>
	</form>
	
	<div id="selectBtn" align="center">
		<a href="board.do">[목록]</a>
		<c:if test="${sessionScope.loginId == board.writer}">
			<a href="updateForm.do?boardNum=${board.boardNum}">[수정]</a>
			<a onclick="del_func()" href="#">[삭제]</a>
		</c:if>
	</div>
	<br>
	
<!-- 	리플이 달리는부분 -->
	<div id="replyRead" align="center">
	</div>

	<div id="replyWrite" align="center">
		<textarea id="re_contents" rows="5" cols="50"
			onclick="if(this.value=='댓글을 입력하세요'){this.value=''}">댓글을 입력하세요</textarea>
		<input type="button" id="replyOk" class="btn btn-default"  value="확인">
	</div>

</body>
</html>