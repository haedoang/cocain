<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../../resources/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<style>
span {
	font-size: 20px;
	color: black;
	font-weight: bold;
}

select>option {
	text-align: center;
}
</style>

 <link rel="stylesheet" href="../../../resources/css/bootstrap/bootstrap.css">
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
				<br>
				<br>
				<div>
					<span>제목</span> <br> <input type="text" class="form-control"
						id="exampleInputName2" placeholder="db의 저장된 title고정"> <br>
					<span>분류</span> <br> <select class="input-sm"
						style="width: 280px; height: 35px; font-size: 14px;">
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
					<textarea class="form-control" rows="3" style="height: 200px"
						placeholder="db에 저장된 content 고정"></textarea>
				</div>
				<br>
				<div class="text-center">
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;">수정</button>
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;">목록</button>
						<br><br><br><br>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<c:import url="../../base-ui/footer.jsp" />
</body>

</html>