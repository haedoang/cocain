<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>자유게시판</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<style>
.org tr, .org th, .org td {
	border: 1px solid black !important;
}

.org th {
	text-align: center !important;
}

.org th:nth-child(odd) {
	background-color: #efefef;
}

#subm {
	border: 0;
	outline: 0;
	background-color: #efefef;
}

#ezz>th {
	text-align: center !important;
}

span {
	margin: 30%;
}

textarea {
	resize: none;
}

.ppp, .wrr {
	word-break: break-all;
}

.section {
	height: 0px;
	padding: 20px 0;
	display: block;
}

.downwrap {
	display: block !important;
	text-align: center !important;
}

.down {
	position: relative;
	margin: 0 auto;
	cursor: pointer;
	width: 0;
	height: 0;
	border-right: 17px solid transparent;
	border-left: 17px solid transparent;
	border-top: 25px solid #000;
}
</style>
</head>
<body>


	<div class="container org">
		<div class="h2">
			<kbd>공지사항</kbd>
		</div>
		<hr>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>${board.no}</th>
				<th>글쓴이</th>
				<th><a href="/cocain/user/profile.do?writer=${board.writer}">${board.writer}</a></th>
				<th>조회수</th>
				<th>${board.viewCnt}</th>
				<th>추천수</th>
				<th id="rc">${recom}</th>
			</tr>
			<tr>
				<th>제목</th>
				<th colspan="5"><c:out value="${board.title}" /></th>
				<th>등록일</th>
				<th><fmt:formatDate value="${board.regDate}"
						pattern="yyyy-MM-dd" /></th>
			</tr>
		</table>
		<hr>


		<div class="ppp">${board.content}</div>

		<hr>

		<div class="list-inline">
			<label for="label1">추천 : </label> <i class="rec" id="label1"> </i> 
			
			<c:if test="${user.nickname == '코카인관리자'}">
			<span class="text-center"> 
				<a class="btn btn-default" href='updateForm.do?no=${board.no}'>수정</a> 
				<a class="btn btn-default" href='delete.do?no=${board.no}'>삭제</a> 
			</span>
			</c:if>
			<a class="btn btn-default" onclick="history.go(-1)">목록</a>
		</div>

		<hr>
	</div>

	<div class="container">

		<form class="form-inline" id="commentForm" method="post">
			<div class="form-group"
				style="width: 100%; background-color: #efefef">
				<input id="no" name="no" value="${board.no}" type="hidden">
				<img src="http://codingschool.info/img/title_comment.gif"> <input
					class="form-control" id="textarea" name="writer" type="text"
					readonly="readonly" value="${user.nickname}">
				<textarea style="width: 91%; height: 100px;"
					class="form-control textarea" name="content" /></textarea>
				<button id=subm>
					<img src="http://codingschool.info/img/ok_ripple.gif" />
				</button>
			</div>
		</form>

		<div id="divv"></div>

		<br> <i class="count fas fa-users col-md-10 col-md-offset-1">댓글
			갯수 : #</i> <br>


		<!-- 			<i class="count2 fas fa-users col-md-10 col-md-offset-1">댓글 갯수2 : #</i> -->
		<div class='comment col-md-10 col-md-offset-1'>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="now2">
				<fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" />
			</c:set>
		</div>


	</div>
	<div class="section">
		<div class="downwrap">
			댓글 Click
			<div class="down"></div>
		</div>
	</div>
	<br>
	<br>
	<br>



	<script>
		var nickname = "${user.nickname}";
		var qnawriter = "${board.writer}";
		var numb = "${board.no}";
		var answer;
		var recCount = "${recCount}";
		var recExist;

		function recExt() {
			$.ajax({
						url : "/cocain/board/notice/recomExist.do",
						data : {
							"no" : numb,
							"id" : nickname
						}
					}).done(
							function(result) {
								// 			console.log(result);
								recExist = result;
								if (recExist == 1) {
									$(".rec").html(
										"<i class='glyphicon glyphicon-heart btn btn-danger' aria-hidden='true'></i>")
								} else {
									$(".rec").html(
										"<i class='glyphicon glyphicon-heart-empty btn btn-default' aria-hidden='true'></i>")
								}
							});
						}
		recExt();

		$(".rec").click(function() {
							// 		console.log("recExist : "+recExist);
							var rUrl = "insertrecom";
							if (recExist == 1) {
								rUrl = "deleterecom";
							}
							$.ajax({
									url : '/cocain/board/notice/'+ rUrl + '.do',
									data : {
										"no" : numb,
										"id" : nickname
									}
										}).done(
											function(result) {
												// 			console.log("insert or delete result : " +result);
												if (recExist == 0) {
													alert("추천되었습니다.");
													recExist = 1;
													$(".rec")
															.html(
																	"<i class='glyphicon glyphicon-heart btn btn-danger' aria-hidden='true'></i>");
												} else {
													alert("추천이 취소되었습니다.")
													recExist = 0;
													$(".rec")
															.html(
																	"<i class='glyphicon glyphicon-heart-empty btn btn-default' aria-hidden='true'></i>");
												}
												recnumber();
											});

						});

		function recnumber() {
			$.ajax({
				url : "/cocain/board/notice/recomCount.do",
				data : "no=" + numb
			}).done(function(result) {
				$("#rc").html("추천 " + result);
			})
		};
		recnumber();

		function list() {
			$.ajax({
						url : "<c:url value='/board/listComment.do' />",
						data : "no=${board.no}"
					})
					.done(
							function(result) {

								var nickname = "${user.nickname}";
								var output = "";
								$('.count').text("댓글 갯수 : " + result.length);
								if (result.length == 0) {
									output = '<hr><div class="text-center">조회할 댓글이 없습니다.</div>'
									$('.section').css('display', 'none');
								} else {
									$('.section').css('display', 'unset');

									$.each(result,function(idx, val) {
										output += '<hr><div class=" text-left form-inline">'
												+ "<input type='hidden' value='+val.commentNo+'>"

										output += '<div class="form-group" ><a href="/cocain/user/profile.do?writer='+val.writer+' ">'
												+ val.writer
												+ '</a>'
												+ '　'
												+ func1(val.regDate)
												+ '</div>'

										if (nickname == val.writer) {
											output += '<div class="text-right"><button id="notify'
													+ val.commentNo
													+ '" class="btn btn-default" onclick="upd( \''+ val.content+ '\' , \''+ val.writer+ '\' , \''+ val.commentNo+ '\')">수정</button>'
											output += '<button id="delb" class="text-right btn btn-default" onclick="del('
													+ val.commentNo
													+ ')">삭제</button></div>'
										}
										output += '<div class="wrr'+val.commentNo+'">'+ val.content+ '</div></div>'
									})
				}

				$('.comment').html(output);
			});
		}

		/* 물어볼거 예제용 */
		$(document).ready(function() {
			$.ajax({
				url : "<c:url value='/board/notice/CommentCount.do' />",
				data : "no=${board.no}",
			}).done(function(result) {
				// 				console.log(result)
				$('.count2').text(result);
			})
		})

		$('#commentForm').submit(function(e) {
			e.preventDefault();
			$('.comment').css("display", "unset");
			var str = $('.textarea').val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
			$('.textarea').val(str);

			if ($('.textarea').val() == "") {
				alert("댓글을 입력 해 주세요")
				return false;
			}

			// 			console.log($(this).serialize());
			$.ajax({
				url : "<c:url value='/board/insertComment.do' />",
				data : $(this).serialize(),
				method : "POST"
			}).done(function(result) {
				$('.textarea').val("");
				list();
			}).fail(function(result) {
				alert("댓글을 입력 해 주세요");
			})

		});

		function del(eee) {
			$.ajax({
				url : "<c:url value='/board/deleteComment.do' />",
				data : "commentNo=" + eee
			}).done(function(result) {
				// 			 console.log("성공")
				list();
			})

		}

		var iii = null;

		var result = '';
		function upd(result, re, num) {
			result = result.split('<br>').join("\r\n");

			$('.dkanrjsk').css("display", "none");
			iii = num;
			// 		console.dir( $('#notify'+iii).parent().next());
			// 		 console.log("1 : "+iii);
			$('#notify' + num)
					.parent()
					.next()
					.html(
							'<form class="form-inline dkanrjsk" name="cf2" method="post" >'
									+ '<div class="form-group" style="width: 100%; background-color: #efefef ">'
									+ '<input id="commentNo" name="commentNo" value='+iii+' type="hidden">'
									+ '<input class="form-control wr333"  name="writer"  type="hidden">'
									+ '<textarea style="width: 100%; height : 100%;" class="co333 form-control" name="content" ></textarea>'
									+ '<span class="input-group-btn"><button class="btn btn-default">수정</button></span>'
									+ '<span class="input-group-btn"><button class="btn btn-default can">취소</button></span>'
									+ '</div></form>'

					);

			$('.co333').val(result);
			$('.wr333').val(re);
			$('.dkanrjsk').css("display", "unset");
			$('.can').click(function(event) {
				event.preventDefault();
				list();
			})

			$('.dkanrjsk').submit(function(event) {
				event.preventDefault();

				var coco = $(this).children().children().eq(2);

				var str = coco.val();
				str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
				coco.val(str);

				if ($('#content2').val() == "") {
					alert("내용이 없습니다");
					return false;
				}
				;

				$.ajax({
					url : "<c:url value='/board/updateComment.do' />",
					data : $(this).serialize(),
					method : "POST"
				}).done(function(result) {
					// 			 console.log("김성공");
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

		function func1(reg) {
			var ymdt = new Date(reg).toLocaleString('en-GB'); // db시간 로컬(한국)
			var ymdts = ymdt.split("/");
			var year = ymdts[2].substring(0, 4); // db 년
			var month = ymdts[1]; // db 월
			var day = ymdts[0]; // db 일
			var time = ymdts[2].substring(5).trim(); //db 시간
			var times = time.substring(0, 2); //시
			var minute = time.substring(3, 5); //분
			var second = time.substring(5); //초

			var $now = ${now2};
			var dd = (minute + second).split(":");
			var now = $now.toString().substring(0, 8);// 현재시간 년 월 일
			var needay = year + month + day // db 년 월 일
			var nowtime = $now.toString().substring(8, 10); // 현재 시 
			var nowmin = $now.toString().substring(10, 12); // 현재 분
			var nowsec = $now.toString().substring(12); // 현재 초

			var newt = parseInt(nowtime) * 3600 + parseInt(nowmin) * 60
					+ parseInt(nowsec); //현재 시분초을 초로
			var dbt = parseInt(times) * 3600 + parseInt(dd[0]) * 60
					+ parseInt(dd[1]); //db시분초을 초로
			// 		console.log("현재 년월일시 : " + now);
			// 		console.log("db 년월일시 : " + needay);
			//  		console.log("나우민 : "+newt, typeof(newt));
			// 		console.log("디비민 : "+dbt , typeof(dbt));

			//년월일시 같을 때
			if (now == needay) {

				if (newt - dbt < 200) {
					//  				console.log(newt-dbt);
					return "방금 전";
				}
				if (newt - dbt > 200 && newt - dbt <= 3600) {
					//  				console.log(newt-dbt);
					//  				console.log(Math.floor(newt-dbt)/60);
					return Math.floor((newt - dbt) / 60) + "분 전"
				}

				return ymdt;
			} //out if
			else {
				return ymdt;
			}
		}//function

		$(document).ready(function() {
			function move() {
				$('.down', '.downwrap').animate({
					'top' : '5px'
				}, 600).animate({
					'top' : '20px'
				}, 600, move);
			}
			move();
		})

		$('.comment').css("display", "none");
		$('.down').click(function() {
			$('.comment').css("display", "unset");

		})

		list();
	</script>

	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
</body>
</html>