<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../../resources/css/bootstrap/bootstrap.css"
	rel="stylesheet" />

<style>
th {
	background-color: grey;
}

.date{
	font-size: 10px;
	color: grey;
}

.title{
	font-size: 20px;
	color: grey;
	font-style: bold;
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
</style>

 <link rel="stylesheet" href="../../resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../resources/css/base-ui/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../../resources/js/jquery.animateNumber.js"></script>
    <script src="../../resources/js/bootstrap.js"></script>
</head>



<body>


	<!-- 게시물 목록 표현하기
	<h2>자유게시판</h2>
	<hr>
	<table class="table">
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th>
	</tr>
	</table>
	<a href="writeForm.do">글쓰기</a> -->
	
	<c:import url="../../base-ui/header.jsp" />
	<hr>
	<div class="container">
		<div class="form-inline">
			<div class="row text-center ">
				<select class="input-sm form-control"
					style="width: 140px; height: 30px; font-size: 14px;">

					<option value="">선택하세요</option>
					<c:forEach var="c" items="${category}">
						<option value="${c.categoryName}">${c.categoryName}	</option>
					</c:forEach>
					
				</select> <input type="text form-control" style="width: 250px; height: 30px;"
					class=".input-sm">

				<button class="btn btn btn-primary "
					style="background-color: black; border-color: black;">검색</button>
			</div>
			<br>
		</div>
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<table class="table table-striped table-hover">
					<tbody>
						<c:forEach var="b" items="${list}">
							<tr>
								<td>
									<!-- <div>${b.no}</div> -->
									<div>
									<span class="id">${b.id}</span>
									 &nbsp&nbsp&nbsp
									 <span class="date"><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></span>
									 </div>
									<div>
										<span class="categori">${b.categoryName}</span>
									</div>
									<div>
									<span class="title"><a href='detail.do?no=${b.no}'>${b.title}</span>
									</div>
									<div>
										<span class="glyphicon glyphicon-eye-open">${b.viewCnt}</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										 <span class="glyphicon glyphicon-pencil">댓글</span>
										<div><a href='detail.do?no=${b.no}'></a></div>
									</div>
								</td>
							</tr>
						</c:forEach>	
					
					</tbody>
				</table>
				<div class="text-right">
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;" onclick="location.href='writeForm.do'">글쓰기</button>
				</div>
			</div>

			<nav class="text-center">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<div class="col-md-2"></div>
		</div>
	</div>
	<c:import url="../../base-ui/footer.jsp" />
	
</body>


</html>












