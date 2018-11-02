<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- header.. -->
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>uqupdate</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<!-- include summernote css/js -->
<link rel="stylesheet"
	href="<c:url value="/resources/summernote/summernote.css"/>" />
<script src="<c:url value="/resources/summernote/summernote.js"/>"></script>
<body>
	<section>
		<div class="aside">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">퀴즈게시판</a></li>
					<li role="presentation"><a href="#"> <i
							class="fas fa-folder"></i> 데일리퀴즈
					</a></li>
					<li role="presentation"><a href="<c:url value="dqlist.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 문제
					</a></li>
					<li role="presentation"><a href="<c:url value="dqsubmit.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 제출확인
					</a></li>
					<li role="presentation" class="active"><a
						href="<c:url value="uqlist.do"/>"> <i
							class="fas fa-folder-open"></i> 유저퀴즈
					</a></li>
					<li role="presentation"><a
						href="<c:url value="rank/rank.do"/>"> <i class="fas fa-signal"></i>
							랭킹보기
					</a></li>
				</ul>
			</div>
		</div>

		<div class="section">
			<div class="background">
				<img src="<c:url value="/resources/images/quiz-back2.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>유저퀴즈 > 문제 수정페이지</h2>
			</div>

			<div class="context"></div>
<%-- 
			<div class="col-md-10">
				<form id="uqForm" action="<c:url value="uqupdate.do"/>" method="POST">
					<table class="table">
						<tr>
							<th>카테고리</th>
							<td><select name="categoryNo">
									<c:forEach var="i" items="${data.category}">
										<option value="${i.categoryNo}"
											<c:if test="${i.categoryNo == data.detail.categoryNo}">
										selected
										</c:if>>${i.categoryName}</option>
									</c:forEach>
							</select></td>
						</tr>  
						<tr>
							<th>난이도</th>
							<td><c:forEach var="j" items="${data.level}">
									<input type="radio" id="r${j.levelNo}" name="levelNo"
										value="${j.levelNo}"
										<c:if test="${j.levelNo==data.detail.levelNo}">
									checked
								</c:if> />
									<label for="r${j.levelNo}">${j.levelName}</label>
								</c:forEach></td>
						</tr>
						<tr>
							<th>Hint 설정</th>
							<td>
								<div>
									<input id="yeshint" type="text" name="hint"
										value="${data.detail.hint}" /> <br> <span> <input
										type="checkbox" id="nohint" name="hint" /> <label
										for="nohint">힌트 없음</label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" size="50" name="title"
								value="${data.detail.title}" /></td>
						</tr>
						<tr>
							<th>문제 내용</th>
							<td><textarea id="summernote" name="content">${data.detail.content}</textarea>
							</td>
						</tr>
						<tr>
							<th class="buttons">
								<button class="btn btn-primary">수정하기</button>
								<button class="btn btn-primary">수정취소</button>
							</th>
							<td></td> --%>
						</tr>
					</table>
				</form>
			</div>
			<!-- col-md-8 end -->
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>
</body>
</html>