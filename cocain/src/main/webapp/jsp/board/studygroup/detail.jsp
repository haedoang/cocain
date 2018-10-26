<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset='utf-8'>
	<title>자유게시판</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	 crossorigin="anonymous"></script>
	<link href="../../css/bootstrap.css" rel="stylesheet" />
</head>

<body>
	<h2>자유게시판</h2>
	<hr />

	<!-- 번호 :  ${board.no}<br>
	 글쓴이 : <c:out value="${board.writer}" /><br>
	 제목 : <c:out value="${board.title}" /><br>
	 내용 : <c:out value="${board.content}" /><br>
	 등록일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /><br><br>  
	 조회수 : ${board.viewCnt}<br> -->

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-bordered">
					카페고리 <br>
					id : 22<br>
					제목 <br>
					<span class="glyphicon glyphicon-eye-open"></span>
					등록일&nbsp;&nbsp;&nbsp;&nbsp;
					<hr>
					내용 : 4<br>
					조성일<br>
					이원재<br>
					김해동<br>
					박한준<br>
					안규영<br>
					
				</table>
				<hr>
				<div class="text-right">

					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >수정</button>
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >삭제</button>
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >목록</button>
				</div>
				<br>
				<div>
					<textarea class="form-control" rows="3"></textarea> <br>
					<div class="text-right">
						
						<button class="btn btn btn-primary" style="background-color: black; border-color: black;" ><span class="glyphicon glyphicon-lock"></span></button>
						<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >등록</button>
					
					</div>
				</div>

				<br>

				<div>
					<table class="table">

						<tr>
							<td>
								id
								등록일자<br>
								내용은 아무거나 일단 적고d
							</td>
						</tr>
						<tr>
							<td>
								안녕? 나는 비밀글이야
								근데 다 보이네?
							</td>
						</tr>
						<tr>
							<td>
								asdasd
							</td>
						</tr>
						<tr>
							<td>
								asdasd
							</td>
						</tr>
						<tr>
							<td>
								asdasd
							</td>
						</tr>


					</table>
				</div>
			</div>
		</div>

		<div class="col-md-2"></div>
		<div>
		</div>
	</div>

	<script>
	 	// $.ajax({
	 	// 	url: "<c:url value="/comment/list.json" />",
	 	// 	data: "no=${board.no}",
	 	// }).done(function(result){
	 	// 	console.log(result);
	 	// });
	</script>
</body>

</html>