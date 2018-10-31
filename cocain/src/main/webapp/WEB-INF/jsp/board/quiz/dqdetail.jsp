<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- header.. -->
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dqdetail</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value="/resources/summernote/summernote.css"/>" />
<script src="<c:url value="/resources/summernote/summernote.js"/>"></script>
</head>
<body>
	<section>
		<div class="aside">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">퀴즈게시판</a></li>
					<li role="presentation"><a
						href="#"> <i class="fas fa-folder"></i>
							데일리퀴즈
					</a></li>
					<li role="presentation" class="active"><a href="<c:url value="dqlist.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder-open"></i> 문제
					</a></li>
					<li role="presentation"><a href="<c:url value="dqsubmit.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 제출확인
					</a></li>
					<li role="presentation"><a href="<c:url value="uqlist.do"/>">
							<i class="fas fa-folder"></i> 유저퀴즈
					</a></li>
					<li role="presentation"><a
						href="<c:url value="rank/rank.do"/>"> <i class="fas fa-signal"></i>
							랭킹보기
					</a></li>
				</ul>

			</div>
		</div>

		<div class="section">
			<div class="row">
				<div class="background">
					<img src=<c:url value="/resources/images/quiz-back.jpg"/>
						width=100% height=250px; />
				</div>

				<div class="title">
					<h2>DailyQuiz > 문제풀기</h2>
				</div>

				<div class="context"></div>

				<div class="col-md-10">
					<table class="table">
						<tr>
							<th>게시글 번호</th>
							<td>${data.detail.quizNo}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><span>${data.detail.title}</span></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<c:forEach var="i" items="${data.category}">
								<c:if test="${data.detail.categoryNo==i.categoryNo}">
									<td><span>${i.categoryName}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<th>Hint</th>
							<td>
								<div>
									<span>${data.detail.hint}</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>문제 내용</th>
							<td>
								<div id="">${data.detail.content}</div>
							</td>
						</tr>
						<tr>
							<th>정답 제출</th>
							<td class="buttons">
								<p>파일을 첨부해주세요</p> <input type="file" style="display: inline" />
								<button class="btn btn-primary">제출하기</button>
							</td>
						</tr>
						<tr>
							<th class="buttons" colspan="3">
								<button id="list" class="btn btn-primary">목록</button>
								<c:if test="${sessionScope.user.id=='admin'}">
								<button id="update" class="btn btn-primary">수정</button>
								<button id="delete" class="btn btn-primary">삭제</button>
								</c:if>
							</th>
							<td></td>
						</tr>
					</table>

				</div>
				<!-- 8 end  -->
			</div>
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/jsp/base-ui/footer.jsp"></c:import>

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>
	
	<!-- button script -->
	<script>
		$("#list").click(function(){
			location.href="<c:url value="dqlist.do"/>"
		});
		
		$("#delete").click(function(){
			location.href="<c:url value='deleteboard.do?quizNo=${data.detail.quizNo}&typeNo=${data.detail.typeNo}'/>"
		});
	</script>
	
</body>
</html>