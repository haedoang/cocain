<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.animateNumber.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<header> <!--header --> <nav class="navbar navbar-default">
	<div class="contatiner-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">CoCaIn</a>
		</div>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="#">공지사항</a></li>
			<li><a href="#">스터디</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">퀴즈<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<c:url value="quiz.jsp"/>">퀴즈 풀기</a></li>
					<li><a href="#">랭킹 보기</a></li>
				</ul></li>
			<li><a href="#">지식iN</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" data-target="#login" data-toggle="modal">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
		<form class="navbar-form navbar-right" action="">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="내용을 입력하세요.">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
	</div>
	</nav><!--header end --> </header>
	<!-- login menu -->
	<div class="row">
		<div class="modal" id="login" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						로그인
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div class="form-login">
							<h1>CoCaIn</h1>
							<br> <input type="text" id="userName"
								class="form-control input-sm chat-input" placeholder="아이디" /> <br>
							<input type="text" id="userPassword"
								class="form-control input-sm chat-input" placeholder="비밀번호" />
							<br>
							<br>
							<div class="wrapper">
								<span> <a href="#" class="btn btn-primary btn-lg">로그인</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>