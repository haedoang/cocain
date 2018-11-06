<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<title>자유게시판</title>

<style>
.date {
	font-size: 10px;
	color: grey;
}

.categori {
	font-size: 14px;
	color: brown;
	font-style: bold;
}

.id {
	font-size: 13px;
	font-style: bold;
}

.title {
	font-size: 20px;
	color: grey;
	font-style: bold;
}

.row > .col-md-12 > form > div > textarea{
	width: 100%;
}
</style>

<link href="../../css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet"
	href="../../resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="../../resources/css/base-ui/footer.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../../resources/js/jquery.animateNumber.js"></script>
<script src="../../resources/js/bootstrap.js"></script>


</head>

<body>
	<c:import url="../../base-ui/header.jsp" />
	<hr>

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-bordered">
					<span class="id">${board.id}</span> &nbsp;&nbsp;
					<span class="date"><fmt:formatDate value="${board.regDate}"
							pattern="yyyy-MM-dd" /></span>
					<br>
					<span class="categori">${board.categoryName}</span>
					<br>
					<span class="title">${board.title} </span>
					<br>
					<span class="glyphicon glyphicon-eye-open"> ${board.viewCnt}</span>
					&nbsp;&nbsp;&nbsp;&nbsp;

					<hr>
					${board.content}
					<br>

				</table>
				<hr>
				<div class="text-right">

					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;"
						onclick="location.href='updateForm.do?no=${board.no}'">
						수정</button>
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;"
						onclick="location.href='delete.do?no=${board.no}'">삭제</button>
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;"
						onclick="location.href='list.do'">목록</button>
				</div>
				<br>

				<!-- 댓글 -->
				<div class="row">
					<div class="col-md-12">
						<form id="commentForm" method="post">
							<div class="input-group">
								<input type="hidden" name="no" value="${board.no}" />
								<input type="hidden" name="id" value="${user.nickname}" />
							</div>
								<textarea class="form-control" rows="3" id="content" name="content" style="resize: none;"></textarea>
								<br>
							<div class="text-right">
								<span class="input-group-btn"> </span>
								<button class="btn btn btn-primary" style="background-color: black; border-color: black;">비밀글</button>
								<button class="btn btn btn-primary"	style="background-color: black; border-color: black;">등록</button>
							</div>
						</form>
					</div>
				</div>
				
				<div class="row">
					<label for="content"></label>
					<div class="panel panel-default">
					<div class="comment">
					<table class="table" id="commenttable">
						<tbody id="commenttbody">
							
						</tbody>
					</table>
					</div>
					</div>
				</div>
			</div>
		</div>
</div>
		<div class="col-md-2"></div>
		<div></div>
	</div>
	<c:import url="../../base-ui/footer.jsp" />

	<script src="<c:url value='/resources/js/jquery-dateformat.js'/>"></script>
	<script>
	var nickname = "${user.nickname}";
	var qnawriter = "${board.id}";
	var numb = "${board.no}";
	var answer;
	$("#commentForm").submit(function(e){
		e.preventDefault();
// 		console.log($(this).serialize());
		$.ajax({
			url : "/cocain/board/studygroup/insertComment.do",
			data : $(this).serialize(),
			type : "POST"
		}).done(function(result){
			$("#content").val("");
			commentlist();
		}).fail(function(result){ alert("댓글을 입력 해 주세요") })
	});
	commentlist();
	var comm = "";
	
	
	function commentlist() {
		comm = "";	
		$.ajax({
		 		url: "/cocain/board/studygroup/listComment.do",
		 		data: "no=${board.no}"
		 	}).done(function (result) {
		 		for(var i=0; i<result.length; i++){
		 		comm += "<tr> <td><div>" + result[i].id + "　"+ $.format.date(result[i].regDate, "yyyy-MM-dd") + "</div><div>";
		 		comm += result[i].content + "</div></td></tr>";
		 		}
		 		$("#commenttbody").html(comm);
		 	});
		 }
	function commentdelete(num){
		$.ajax({
		 		url : "/cocain/board/studygroup/deleteComment.do",
		 		data : "commentNo="+num
		 	 }).done(function (result) {
		 		 commentCount(numb);
		 			commentlist();
		 		 });
		 }
	
	
		// $.ajax({
		// 	url: "<c:url value="/comment/list.json" />",
		// 	data: "no=${board.no}",
		// }).done(function(result){
		// 	console.log(result);
		// });
	</script>
</body>

</html>