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

.row>.col-md-12>form>div>textarea {
	width: 100%;
}

.bc {
	word-break: break-all;
}
</style>



</head>

<body>
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
	<hr>

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-bordered">
					<span class="id"> <a
						<c:choose>
	                       	 <c:when test="${user == null}">
	                                 	href="#" data-target="#login" id="log" data-toggle="modal"
	                         </c:when>
	                         <c:otherwise>
	                                  	href="<c:url value="/user/profile.do?writer=${board.id}" />"
	                         </c:otherwise>
	                        </c:choose>>
							${board.id} </a>
					</span> &nbsp;&nbsp;
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
					<div class="bc">${board.content}</div>
					<br>

				</table>
				<hr>
				<div class="text-right">
					<c:if test="${user.nickname == board.id}">
						<button class="btn btn btn-primary"
							style="background-color: black; border-color: black;"
							onclick="location.href='updateForm.do?no=${board.no}'">
							수정</button>
						<button class="btn btn btn-primary"
							style="background-color: black; border-color: black;"
							onclick="location.href='delete.do?no=${board.no}'">삭제</button>
					</c:if>
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
								<input type="hidden" name="no" value="${board.no}" /> <input
									type="hidden" name="id" value="${user.nickname}" />
							</div>
							<textarea class="form-control" rows="3" id="content"
								name="content" style="resize: none;"></textarea>
							<br>
							<div class="text-right">
								<span class="input-group-btn"> </span>
								<!-- 								<button class="btn btn btn-primary" style="background-color: black; border-color: black;">비밀글</button> -->
								<button class="btn btn btn-primary"
									style="background-color: black; border-color: black;">등록</button>
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
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />

	<script src="<c:url value='/resources/js/jquery-dateformat.js'/>"></script>
	<script>
		var nickname = "${user.nickname}";
		var qnawriter = "${board.id}";
		var numb = "${board.no}";
		var answer;
		$("#commentForm").submit(function(e) {
			e.preventDefault();
			// 		console.log($(this).serialize());
			$.ajax({
				url : "/cocain/board/studygroup/insertComment.do",
				data : $(this).serialize(),
				type : "POST"
			}).done(function(result) {
				$("#content").val("");
				commentlist();
			}).fail(function(result) {
				alert("댓글을 입력 해 주세요")
			})
		});
		commentlist();

		var comm = "";

		function commentlist() {
			comm = "";
			$
					.ajax({
						url : "/cocain/board/studygroup/listComment.do",
						data : "no=${board.no}"
					})
					.done(
							function(result) {
								for (var i = 0; i < result.length; i++) {
									comm += "<tr> <td><div>"
											+ result[i].id
											+ "　"
											+ $.format.date(result[i].regDate,
													"yyyy-MM-dd")
											+ "</div><div>";
									comm += result[i].content
											+ "</div></td></tr>";
								}
								$("#commenttbody").html(comm);

								var output = "";

								$
										.each(
												result,
												function(idx, val) {
													output += '<div class="panel-heading"><h4 class="panel-title"><a href="<c:url value="/user/profile.do?writer='
															+ val.id
															+ '" />">'
															+ val.id + '</a> '
													output += '<span>'
															+ " "
															+ new Date(
																	val.regDate)
																	.toISOString()
																	.slice(0,
																			10)
															+ '</span>　　'

													output += '</h4></div>'
													output += '<input type="hidden" class="commentNo" value="'+val.commentNo+'" />'
													output += '<div class="panel-body" style="border-bottom: 1px solid #ddd"><p id="updateContent'+idx+'">'
															+ val.content
															+ '</p>'
													if (nickname == val.id) {
														output += '<div class="text-right"><button id="update'+idx+'" class="btn btn-default updatebtn" type="button">수정</button> '
														output += '<button class="btn btn-default" type="button" onclick="commentdelete('
																+ val.commentNo
																+ ')">삭제</button></div></div>'
													} else {
														output += '<div class="text-right" style="height: 20px">'
														output += '</div></div>'
													}
												})
								$('.comment').html(output);
							});
		}
		commentlist();

		function commentdelete(num) {
			$.ajax({
				url : "/cocain/board/studygroup/deleteComment.do",
				data : "commentNo=" + num
			}).done(function(result) {
				$("#commenttbody").html("");
				commentlist();
			});
		}

		$("body")
				.on(
						"click",
						".updatebtn",
						function() {
							$(this).css("display", "none")
							$(this).next().css("display", "none")
							// 		console.log($(this).parent().prev().text())
							$(this)
									.parent()
									.parent()
									.html(
											'<div class="input-group" style="width: 100%"><textarea class="form-control" style="resize:none">'
													+ $(this).parent().prev()
															.text()
													+ '</textarea></div><div class="text-center" style="margin:4px"><button class="btn btn-default btn-sm modi">수정</button> <button class="btn btn-default btn-sm cancel">취소</button></div>'

									)

						})
		$("body").on("click", ".cancel", function() {
			commentlist();
		})
		$("body").on("click", ".modi", function() {
			var modicontent = $(this).parent().prev().find("textarea").val()
			var modiNum = $(this).parent().parent().prev(".commentNo").val()
			$.ajax({
				url : "/cocain/board/studygroup/updateComment.do",
				data : {
					"commentNo" : modiNum,
					"content" : modicontent
				}
			}).done(function() {
				commentlist();
			})
		})
	</script>
</body>

</html>