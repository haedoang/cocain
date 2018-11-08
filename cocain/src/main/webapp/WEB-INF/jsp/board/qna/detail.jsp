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
<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
<link rel="stylesheet"
	href="/cocain/resources/css/bootstrap/bootstrap.css">

<link rel="stylesheet" href="/cocain/resources/css/board/qna/qnadetail.css"/>

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
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script src="/cocain/resources/js/bootstrap.js"></script>
</head>

<body>
	
	<div class="container" style="min-height: 790px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h3>지식iN</h3>
				<br>
				<div class="panel panel-default" style="margin-bottom: 10px">
					<div class="panel-heading">
						<h3 class="panel-title">${qna.title}</h3>
					</div>
					<div class="panel-heading">
						<a href="<c:url value="/user/profile.do?writer=${qna.writer}" />">${qna.writer}</a> <span><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd" /></span>
						<div style="float: right">
							<span>조회 ${qna.viewCnt}회</span> <span id="rc"></span>
						</div>
					</div>
					<div class="panel-body detailcontent" style="min-height: 400px">${qna.content}
					</div>
				</div>
				<div class="text-right">
					<a class="btn btn-default" href="writeForm.do">글쓰기</a> 
					<a class="btn btn-default" href="list.do">목록</a>
					<button class="btn btn-default rec"></button>
					
					<c:if test="${user.nickname==qna.writer}">
					<a class="btn btn-default" href='updateForm.do?no=${qna.no}'>수정</a> 
					<a class="btn btn-default" href='delete.do?no=${qna.no}'>삭제</a>
					</c:if>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>


		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<label for="content"><i class="fas fa-users"></i>총 <span id="cmtCnt"></span>개의 댓글</label>
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
						<textarea class="form-control" id="summernote2" name="content" style="height: 60px; resize:none;"></textarea>
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
$("#summernote2").summernote({
	toolbar:false,
	height : 60,
    focus: true,
    lang: 'ko-KR',
    disableResize: true,            // Does not work
    disableResizeEditor: true,      // Does not work either
    resize: false 
		});
	
	
	var nickname = "${user.nickname}";
	var qnawriter = "${qna.writer}";
	var numb = "${qna.no}";
	var answer;
	
	var recCount = "${recCount}";
	var recExist;
	
	function recExt(){
		$.ajax({
			url:"/cocain/board/qna/recomExist.do",
			data : {"no":numb, "id":nickname}
		}).done(function(result){
			recExist = result;
			if (recExist == 1){
				$(".rec").html("추천<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>")
			} else {
				$(".rec").html("추천<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>")
			}
		});
	}
	recExt();
// 	console.log("추천여부:" +recExist);
// 	$(document).ready(function() {
// 		if (recExist == 1){
// 			$(".rec").html("추천<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>")
// 		} else {
// 			$(".rec").html("추천<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>")
// 		}
// 	});
	
	$("#commentForm").submit(function(e){
		if($("textarea[name='content']").val()==""){
			alert("내용을 입력하세요");
			$("textarea[name='content']").focus();
			return false;
		}
		e.preventDefault();
// 		console.log($(this).serialize());

		$.ajax({
			url : "/cocain/board/qna/insertComment.do",
			data : $(this).serialize(),
			type : "POST"
		}).done(function(result){
			$("textarea[name='content']").val("")
			$(".note-editable").html("");
			$("#summernote2").html("");
// 			console.log(result[0].no);
			var cmtcnt = result[0].no;
			commentCount(cmtcnt);
			commentlist();
		}).fail(function(result){ alert("댓글을 입력 해 주세요") })
	});
	
	function commentlist() {
		 $.ajax({
		 		url: "/cocain/board/qna/listComment.do",
		 		data: "no=${qna.no}"
		 	}).done(function (result) {
		 		$(".comment").html("");
// 		 		console.log(result);
		 		
		 var output = "";
		 
$.each(result, function(idx,val) {
	output += '<div class="panel-heading"><h4 class="panel-title"><a href="<c:url value="/user/profile.do?writer=' + val.writer + '" />">' +val.writer+ '</a> '
	output += '<span>'+" "+new Date(val.regDate).toISOString().slice(0,10)+ '</span>　　'
	if(answer==1) {
		if(val.qnaStatus=='y'){
			output += '<span><i class="fas fa-award"></i>질문자 채택 답변</span>'
		}
		else if(val.qnaStatus=='n'){
			if((nickname == qnawriter)&&(nickname!=val.writer)){
// 				output += '<span><a href="selectAnswer.do?no='+val.no+'&commentNo='+val.commentNo+'"><i class="fas fa-angle-double-right"></i>답변 채택하기</a></span>'
		}
			else if ((nickname == qnawriter)&&(nickname==val.writer)) {}
		}
	} else {
		if((nickname == qnawriter)&&(nickname!=val.writer)){
// 				output += '<span><a href="selectAnswer.do?no='+val.no+'&commentNo='+val.commentNo+'"><i class="fas fa-angle-double-right"></i>답변 채택하기</a></span>'
				output += '<span><button class="btn btn-link selectanswer" type="button"><i class="fas fa-angle-double-right"></i>답변 채택하기</button></span>'
	}
		else if ((nickname == qnawriter)&&(nickname==val.writer)) {}
	}

	
// 	if(val.qnaStatus=='y'){
// 		output += '<span><i class="fas fa-award"></i>질문자 채택 답변</span>'
// // 	} else (val.qnaStatus=='n') {
// 	} else if ((answer =='1')&&(val.qnaStatus=='n')){
// 		if((nickname == qnawriter)&&(nickname!=val.writer)){
// 			output += '<span><a href="selectAnswer.do?no='+val.no+'&commentNo='+val.commentNo+'"><i class="fas fa-angle-double-right"></i>답변 채택하기</a></span>'
// 		} else if ((nickname == qnawriter)&&(nickname==val.writer)) {};
// 	}
	
// 	if((nickname == qnawriter)&&(nickname!=val.writer)){
// 		output += '<span><a href="selectAnswer.do?no='+val.no+'&commentNo='+val.commentNo+'"><i class="fas fa-angle-double-right"></i>답변 채택하기</a></span>'
// 	} else if (val.qnaStatus=='y'){
// 		output += '<span><i class="fas fa-award"></i>질문자 채택 답변</span>'
// 	}
	output += '</h4></div>'
	output += '<input type="hidden" class="commentNo" value="'+val.commentNo+'" />'
	output += '<div class="panel-body" style="border-bottom: 1px solid #ddd"><div id="updateContent'+idx+'">'+val.content+'</div>'
	if(nickname == val.writer){
	output += '<div class="text-right"><button id="update'+idx+'" class="btn btn-default updatebtn" type="button">수정</button> '
	output += '<button class="btn btn-default" type="button" onclick="commentdelete('+val.commentNo+')">삭제</button></div></div>'
	} else {
		output += '<div class="text-right" style="height: 20px">'
		output += '</div></div>'
			}
	})
		 $('.comment').html(output);
		 });
	 }
	commentlist();
	
	
	console.log(numb);
	function commentCount(numb){
		$.ajax({
			url : "/cocain/board/qna/commentCount.do",
			data : "no=" + numb
		}).done(function(result){
			$("#cmtCnt").text(result);
		})
	}
	commentCount(numb);
	
	function commentdelete(num){
		$.ajax({
			url : "/cocain/board/qna/deleteComment.do",
			data : "commentNo="+num
	 }).done(function (result) {
		commentCount(numb);
		commentlist();
	 })
	}

	$("body").on("click", ".updatebtn", function(){
		$(this).css("display", "none")
		$(this).next().css("display", "none")
		$(this).parent().parent().html(
				'<div class="input-group" style="width: 100%"><textarea id="summernote" class="form-control" style="resize:none">'+ $(this).parent().prev().html() + 
				'</textarea></div><div class="text-center" style="margin:4px"><button class="btn btn-default btn-sm modi">수정</button> <button class="btn btn-default btn-sm cancel">취소</button></div>'
				
		)
		$("#summernote").summernote({
			toolbar: false,
			height : 100,
		    lang: 'ko-KR',
		    disableResize: true,            // Does not work
		    disableResizeEditor: true,      // Does not work either
		    resize: false 
		});
	})
	$("body").on("click", ".cancel", function(){
		commentlist();
	})
	$("body").on("click", ".modi", function(){
		var modicontent = $(this).parent().prev().find("textarea").val()
		console.log(modicontent)
		var modiNum = $(this).parent().parent().prev(".commentNo").val()
		if(modicontent=="" || modicontent=="<p><br></p>"){
			alert("내용을 입력하세요");
			$(this).parent().prev().find("textarea").focus();
			return false;
		}
		$.ajax({
			url:"/cocain/board/qna/updateComment.do",
			data : {"commentNo":modiNum,
					"content":modicontent		
			}
		}).done(function(){
			commentlist();
		})
	})
	
	$("body").on("click", ".selectanswer", function(){
		console.log($(this).parent().parent().parent().next().val());
		var temp = $(this).parent().parent().parent().next().val();
// 		console.log(temp[value]);
		var result = confirm("답변을 채택하시겠습니까??");
		if(result) {
// 			location.replace('selectAnswer.do?no=');
// 			console.log($(this))
			location.replace('selectAnswer.do?no='+numb+'&commentNo='+temp);
		} else {}
	})
	
	function answerCount(numb){
		$.ajax({
			type : "POST",
			url : "/cocain/board/qna/answerCount.do",
			data : "no="+numb,
			async: false,
			success : function (result){
				answer = result;
				console.log(answer);
				
			}
		})
	}
	answerCount(numb);
	
	$(".rec").click(function(){
		var rUrl = "insertrecom";
		if (recExist == 1) {
			rUrl = "deleterecom";
		}
		$.ajax({
			url : '/cocain/board/qna/' + rUrl + '.do',
			data : {"no":numb, "id":nickname}
		}).done(function(){
			if (recExist == 0){
				alert("추천되었습니다.");
				recExist = 1;
				$(".rec").html("추천<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>");
			} else {
				alert("추천이 취소되었습니다.")
				recExist = 0;
				$(".rec").html("추천<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></span>");
			}
			recnumber();
		});
		
	});
	
	function recnumber(){			
		$.ajax({
			url:"/cocain/board/qna/recomCount.do",
			data : "no="+numb
		}).done(function(result){
			$("#rc").html("추천 "+result);
		})
	};
	recnumber();	
	
// 	/* 미설정 체크  */
// 	function doCheck(){
// 		if($(".note-editable").val()==""){
// 			alert("내용을 입력하세요");
// 			$(".note-editable").focus();
// 			return false;
// 		}
// 	}
	
	
</script>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />
</body>

</html>