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
	.date{
	font-size: 10px;
	color: grey;
	}
	
	.categori{
	font-size: 14px;
	color: brown;
	font-style: bold;
}
.id{
	font-size: 13px;
	font-style: bold;
}
.title{
	font-size: 20px;
	color: grey;
	font-style: bold;
}
</style>
	
	<link href="../../css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="../../resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../resources/css/base-ui/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
					<span class="date"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span><br>
					<span class="categori">${board.categoryName}</span> <br>
					<span class="title">${board.title} </span><br>
					<span class="glyphicon glyphicon-eye-open"> ${board.viewCnt}</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					  
					<hr>
					${board.content}<br>
					
				</table>
				<hr>
				<div class="text-right">

					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" onclick="location.href='updateForm.do?no=${board.no}'">
					수정</button>
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" onclick="location.href='delete.do?no=${board.no}'" >
					삭제</button>
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" onclick="location.href='list.do'">
					목록</button>
				</div>
				<br>
				<div>
					<textarea class="form-control" rows="3"></textarea> <br>
					<div class="text-right">
						
						<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >비밀글</button>
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
	<c:import url="../../base-ui/footer.jsp" />

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