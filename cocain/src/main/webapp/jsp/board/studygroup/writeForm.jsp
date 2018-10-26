<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../../css/bootstrap.css" rel="stylesheet" />
	<style>
	span{
		font-size: 20px;
		color: black;
		font-weight: bold;
	}
	select > option{
		 text-align: center;
	}


	</style>
</head>

<body>
	<h2>자유 게시판</h2>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-2"> </div>

			<div class="col-md-8">
				<br><br>
				<div>
					<span>제목</span>
					<br>
					<input type="text" class="form-control" id="exampleInputName2" placeholder="제목을 입력하세요">
					<br>
					<span>분류</span>	<br>
					<select class="input-sm" style="width: 280px; height: 35px; font-size: 14px;" >
							<option value="">선택하세요</option>
							<option value="">java</option>
							<option value="">javascript</option>
							<option value="">SQL</option>
							<option value="">html/CSS</option>
					</select>
				</div>
				<br>
				
				<div>
					<span>내용</span>
					<textarea class="form-control" rows="3" style="height: 200px" placeholder="내용을 입력하세요"></textarea>
				</div>
				<br>
				<div class="text-center">
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >등록</button>
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;"  >목록</button>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>