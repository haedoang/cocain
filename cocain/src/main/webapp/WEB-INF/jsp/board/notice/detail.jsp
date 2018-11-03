<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<!DOCTYPE html> 
<html>
<head>
  <meta charset='utf-8'>
  <title>자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<style>
	
		
	
	.org tr,.org th,.org td{
		border: 1px solid black !important;
		}
	.org th{
	text-align: center !important;
	
	}
	
	.org th:nth-child(odd){
	background-color : #efefef;
	}
	
	#subm{
	border:0;
	outline:0;
	background-color: #efefef;
	}

	#ezz > th{
	text-align: center !important;
	}
		
		span{
		margin : 30%;
		}
		
		textarea{
		resize: none;
		}
		
		
	</style>
</head>
<body>


<div class="container org">
	 <div class="h2"><kbd>공지사항</kbd></div>
	 <hr> 
	 <table class="table">
	 <tr>
	 	<th>번호</th><th>${board.no}</th>
	 	<th>글쓴이</th><th><c:out value="${board.writer}" /></th>
	 	<th>조회수</th><th>${board.viewCnt}</th>
	 	<th>추천수</th><th id='recom1'>${recom}</th>
	 </tr>
	 <tr>	
	 	<th>제목</th><th colspan="5"><c:out value="${board.title}" /></th>
	 	<th>등록일</th><th><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></th>
	 </tr>
	 </table>
	<hr>
	
	
	<div>${board.content}</div>
	
	 <hr>
	 
	 <div class="list-inline">
	 <label for="label1">추천</label>
	 <button id="label1" class='btn btn-default button glyphicon glyphicon-music' aria-hidden="true">
	 </button>
	 <button class='btn btn-default button1'>
	 </button>
	 <span class="text-center">
	 <a class="btn btn-default" href='updateForm.do?no=${board.no}'>수정</a>
	 <a class="btn btn-default" href='delete.do?no=${board.no}'>삭제</a>
	 <a class="btn btn-default" href='list.do'>목록</a>
	 </span>
	 </div>
	 
	 <hr>
	 </div>
	 
	 <div class="container">
		
		<form class="form-inline" id="commentForm" method="post">
		<div class="form-group" style="width: 100%; background-color: #efefef ">
			<input id="no" name="no"  value="${board.no}" type="hidden">
		<img src="http://codingschool.info/img/title_comment.gif">
			<input class="form-control" id="writer" name="writer"  type="text"  readonly="readonly"  value="${user.nickname}">
			<textarea placeholder="댓글내용을 입력 해 주세요" style="width: 91%; height:100px;" class="form-control resize"  id='content' name="content"></textarea>
			<button id=subm ><img src="http://codingschool.info/img/ok_ripple.gif" /></button>
		</div>
		</form>
	 
		<div id="divv"></div>

<br>		
			<i class="fas fa-users col-md-10 col-md-offset-1">댓글 갯수 : #</i>
	 <div class='comment col-md-10 col-md-offset-1' >			
	 <c:set var="now" value="<%=new java.util.Date()%>" />
	 <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" /></c:set> 
		</div>
		
	 
	 </div>
	 
	 <br>
	 
	 
	 
	<script>
	
	
	
	$('.button').click(function(){
		 $.ajax({
		 		url : "<c:url value='/board/recom/insertrecom.do' />",
		 		data : "no=${board.no}"
		 	}).done(function (result) {
		 		console.log(result);
		 		$('#recom1').text(result);
		 	})
	 })
	 $('.button1').click(function(){
		 $.ajax({
		 		url : "<c:url value='/board/recom/deleterecom.do' />",
		 		data : "no=${board.no}"
		 	}).done(function (result) {
		 		console.log(result);
		 		$('#recom1').text(result)
		 	});
	 })
	  
	 function list() {
		 $.ajax({
		 		url: "<c:url value='/board/listComment.do' />",
		 		data: "no=${board.no}"
		 	}).done(function (result) {
		 		console.log(result);
		 var output = "";
		 var nickname = "${user.nickname}";
 $.each(result, function(idx,val) {
	 output +='<hr><div class=" text-left form-inline">'
	+"<input type='hidden' value='+val.commentNo+'>"
		
		output += '<div class="form-group" >'+val.writer+'　'+func1(val.regDate)+'</div>'
		
		if(nickname == val.writer){			
		output +='<div class="text-right"><button id="notify" class="btn btn-default" onclick="upd(\''+ val.content + '\' , \'' + val.writer +'\' , \''+val.commentNo+'\')">수정</button>'
		output +='<button id="delb" class="text-right btn btn-default" onclick="del('+val.commentNo+')">삭제</button></div>'
		}
		output += '<div id="wrr">'+val.content+'</div></div>'
 			
	
		 })
		 $('.comment').html(output);
		 });
	 }
	 
		$('#commentForm').submit(function(e) {
			
			e.preventDefault();
// 			console.log($(this).serialize());
			$.ajax({
				url : "<c:url value='/board/insertComment.do' />",
				data : $(this).serialize(),
				method : "POST"
			}).done(function(result){ 
				list();

			$('#content').val("");
			})
			.fail(function(result){ alert("댓글을 입력 해 주세요") })

		});
	
	 function del(eee) {
		 $.ajax({
				url : "<c:url value='/board/deleteComment.do' />",
				data : "commentNo="+eee
		 }).done(function (result) {
			 console.log("성공")
				list();
		 })
		 
	 }
		var iii = null;
	 function upd(result,re,num){
		 iii = num;
		 console.log("1 : "+iii)
		 
		 $('#divv').css("display", "unset");
		 $('#commentForm').css("display", "none");
		 $('#divv').html(
			  '<form class="form-inline" id="cf2" method="post" >'
			+'<div class="form-group" style="width: 100%; background-color: #efefef ">'
			+'<input id="commentNo" name="commentNo" value='+iii+' type="hidden">'
			+'<input class="form-control" id="writer2" name="writer"  type="hidden">'
			+'<textarea style="width: 91%; height: 100px; resize: none" class="form-control" id="content2" name="content" rows="4" cols="50"></textarea>'
			+'<button id="butt2"><img src="http://codingschool.info/img/ok_ripple.gif" /></button>'
			+'</div></form>'		 
		 );
		 
			
// 			<img src="http://codingschool.info/img/title_comment.gif">
			
		 
	
	 $('#writer2').val(re);
	 $('#content2').val(result);
	 
	 
	 $('#cf2').submit(function (event) {
		 event.preventDefault();
		 console.log($(this).serialize());
		 $.ajax({
				url : "<c:url value='/board/updateComment.do' />",
				data : $(this).serialize(),
				method : "POST"
		 }).done(function (result) {
			 console.log("김성공");
			 $('#commentForm').css("display", "unset");
			 $('#divv').css("display", "none");
			 list();
		 })
		 
	 })
	 
	 
		 }

	 $(".btn").mouseenter(function() {
		 $(this).addClass("active focus");
	$(".btn").mouseleave(function() {
		$(this).removeClass("active focus")
	})
	
	
	 })	 
	 
	 function func1(reg){
		var ymdt = new Date(reg).toLocaleString('en-GB');	// db시간 로컬(한국)
		var ymdts = ymdt.split("/");
		var year = ymdts[2].substring(0,4); // db 년
		var month = ymdts[1];	// db 월
		var day = ymdts[0];	// db 일
		var time = ymdts[2].substring(5).trim(); //db 시간
		var times = time.substring(0,2);	//시
		var minute = time.substring(3,5);	 //분
		var second = time.substring(5);	//초
		
		var $now = ${now2}
 		var dd=(minute+second).split(":");
		var now = $now.toString().substring(0,8);// 현재시간 년 월 일
		var needay = year+month+day	// db 년 월 일
 		var nowtime = $now.toString().substring(8,10);	// 현재 시 
 		var nowmin = $now.toString().substring(10,12);	// 현재 분
 		var nowsec = $now.toString().substring(12);	// 현재 초
		
 		var newt = parseInt(nowtime)*3600+parseInt(nowmin)*60+parseInt(nowsec);	//현재 시분초을 초로
 		var dbt= parseInt(times)*3600+parseInt(dd[0])*60 + parseInt(dd[1]);	//db시분초을 초로
// 		console.log("현재 년월일시 : " + now);
// 		console.log("db 년월일시 : " + needay);
//  		console.log("나우민 : "+newt, typeof(newt));
// 		console.log("디비민 : "+dbt , typeof(dbt));

		//년월일시 같을 때
 		if(now == needay){
 		
 			if(newt-dbt<200){
//  				console.log(newt-dbt);
 	 				return "방금 전";
 	 			}
 			if (newt-dbt > 200 && newt-dbt <= 3600){
//  				console.log(newt-dbt);
//  				console.log(Math.floor(newt-dbt)/60);
 				return Math.floor((newt-dbt)/60) + "분 전"
 			}
 		
 		return ymdt;
 		} //out if
 		else {
 			return ymdt;
 		}
	 }//function

	 
	 list();
	</script>

	  <c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
</body>
</html>