<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/bootstrap.css" rel="stylesheet"/>

<style>
	th{
		background-color: grey;
	}

</style>
</head>



<body>
	<!-- 게시물 목록 표현하기
	<h2>자유게시판</h2>
	<hr>
	<table class="table">
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th>
	</tr>
	<c:forEach var="b" items="${list}">
    <tr>
		<td>${b.no}</td>
		<td><a href='detail.do?no=${b.no}'>${b.title}</a></td>
		<td>${b.writer}</td>
	    <td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></td>
	    <td>${b.viewCnt}</td>
	</tr>
	</c:forEach>	
	</table>
	<a href="writeForm.do">글쓰기</a> -->

	<h2>자유게시판</h2>
	<hr>
	<div class="container">
		<div class="form-inline">
		<div class="row text-center " >
				<select class="input-sm form-control" style="width: 140px; height: 30px; font-size: 14px;" >
					<option value="">선택하세요</option>
					<option value="">java</option>
					<option value="">javascript</option>
					<option value="">SQL</option>
					<option value="">html/CSS</option>
				</select>
			<input type="text form-control" style="width: 250px; height: 30px;" class=".input-sm">
			 	
			<button class="btn btn btn-primary " style="background-color: black; border-color: black;" ><span class="glyphicon glyphicon-search"></span> 검색</button>
		</div>
		<br>
		</div>
		<div class="row">
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
	<table class="table table-striped table-hover">
		<tbody>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
				<tr>
						<td>
							<div>id  등록일</div>
							<div>카테고리  제목</div>
							<div>
								<span class="glyphicon glyphicon-eye-open"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
						</td>
				</tr>
		
		</tbody>
	</table>
	<div class="text-right"><button class="btn btn btn-primary" style="background-color: black; border-color: black;" >글쓰기</button></div>
</div>

<nav class="text-center">
		<ul class="pagination" >
		  <li>
			<a href="#" aria-label="Previous">
			  <span aria-hidden="true">&laquo;</span>
			</a>
		  </li>
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li>
			<a href="#" aria-label="Next">
			  <span aria-hidden="true">&raquo;</span>
			</a>
		  </li>
		</ul>
	  </nav>
	  <div class="col-md-2"></div>
</div>
</div>
</body>


</html>












