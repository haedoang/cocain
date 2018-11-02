<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CoCaIn</title>
<link rel="stylesheet"
	href="/cocain/resources/css/bootstrap/bootstrap.css">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/cocain/resources/js/bootstrap.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h3>지식iN</h3>
				<p>질문좀 냄겨봐</p>
				<div class="panel panel-default" style="margin-bottom: 10px">
					<div class="panel-heading">
						<h3 class="panel-title">${qna.title}</h3>
					</div>
					<div class="panel-heading">
						<a href="#">${qna.writer}</a> <span><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd" /></span>
						<div style="float: right">
							<span>조회 20회</span> <span>추천 1</span>
						</div>
					</div>
					<div class="panel-body" style="height: 400px">${qna.content}
					</div>
				</div>
				<div class="text-right">
					<a class="btn btn-default" href="list.do">목록</a> <a
						class="btn btn-default" href='updateForm.do?no=${qna.no}'>수정</a> <a
						class="btn btn-default" href='delete.do?no=${qna.no}'>삭제</a>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>


		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<label for="content"><i class="fas fa-users"></i>총 2개의 댓글</label>
				<div class="panel panel-default">
					<div class="comment">
<!-- 						<div class="panel-heading"><h4 class="panel-title">djm03178 <span> 2018-10-10 </span></h4></div> -->
<!-- 						<div class="panel-body" style="border-bottom: 1px solid #ddd"> -->
<!-- 							<p>전역 변수는 자동으로 0으로 초기화되지만, 지역 변수에는 쓰레기값이 들어있게 됩니다.</p> -->
<!-- 							<div class="text-right"> -->
<!-- 								<button class="btn btn-default">수정</button> -->
<!-- 								<button class="btn btn-default">삭제</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="panel-heading"> -->
<!-- 							<h4 class="panel-title"> -->
<!-- 								djm03178 &nbsp; <span> 2018-10-10 </span> -->
<!-- 							</h4> -->
<!-- 						</div> -->
<!-- 						<div class="panel-body"> -->
<!-- 							<p>전역 변수는 자동으로 0으로 초기화되지만, 지역 변수에는 쓰레기값이 들어있게 됩니다.</p> -->
<!-- 							<div class="text-right"> -->
<!-- 								<button class="btn btn-default">수정</button> -->
<!-- 								<button class="btn btn-default">삭제</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<form id="commentForm" method="post">
					<div class="input-group">
						<input type="hidden" name="no" value="${qna.no}" />
						<input type="hidden" name="writer" value="${user.nickname}" />
						<textarea class="form-control" id="content" name="content" style="height: 60px"></textarea>
						<span class="input-group-btn">
							<button class="btn btn-default" style="height: 60px">등록</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-12" style="height: 50px"></div>
		</div>
	</div>
	<script>
	$("#commentForm").submit(function(e){
		e.preventDefault();
// 		console.log($(this).serialize());
		$.ajax({
			url : "/cocain/board/qna/insertComment.do",
			data : $(this).serialize(),
			type : "POST"
		}).done(function(result){
			$("content").val("");
			commentlist();
		}).fail(function(result){ alert("댓글을 입력 해 주세요") })
	});
	
	function commentlist() {
		 $.ajax({
		 		url: "/cocain/board/qna/listComment.do",
		 		data: "no=${qna.no}"
		 	}).done(function (result) {
// 		 		console.log(result);
		 		
		 var output = "";
		 var nickname = "${user.nickname}";
$.each(result, function(idx,val) {
	output += '<div class="panel-heading"><h4 class="panel-title">' +val.writer+ '<span>'+" "+new Date(val.regDate).toISOString().slice(0,10)+ '</span></h4></div>'
	output += '<input type="hidden" class="commentNo" value="'+val.commentNo+'" />'
	output += '<div class="panel-body" style="border-bottom: 1px solid #ddd"><p id="updateContent'+idx+'">'+val.content+'</p>'
	if(nickname == val.writer){
	output += '<div class="text-right"><button id="update'+idx+'" class="btn btn-default updatebtn" type="button">수정</button> '
	output += '<button class="btn btn-default" type="button" onclick="commentdelete('+val.commentNo+')">삭제</button></div></div>'
	} else {
		output += '<div class="text-right">'
		output += '</div></div>'
			}
	})
		 $('.comment').html(output);
		 });
	 }
	commentlist();
	
	function commentdelete(num){
		$.ajax({
			url : "/cocain/board/qna/deleteComment.do",
			data : "commentNo="+num
	 }).done(function (result) {
			commentlist();
	 })
	}

	$("body").on("click", ".updatebtn", function(){
		$(this).css("display", "none")
		$(this).next().css("display", "none")
// 		console.log($(this).parent().prev().text())
		$(this).parent().parent().html('<textarea>'+ $(this).parent().prev().text() + '</textarea><button class="modi">수정</button><button class="cancel">취소</button>')
		
	})
	$("body").on("click", ".cancel", function(){
		commentlist();
	})
	$("body").on("click", ".modi", function(){
		var modicontent = $(this).prev().val()
		var modiNum = $(this).parent().prev(".commentNo").val()
		$.ajax({
			url:"/cocain/board/qna/updateComment.do",
			data : {"commentNo":modiNum,
					"content":modicontent		
			}
		}).done(function(){
			commentlist();
		})
	})
	
	
</script>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />
</body>

</html>