<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- header.. -->
	<c:import url="/jsp/base-ui/header.jsp"></c:import>
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
					<li role="presentation"><a href="DailyQuiz.html"> <i
							class="fas fa-folder"></i> 데일리퀴즈
					</a></li>
					<li role="presentation" ><a
						href="DailyQuiz.html"> &nbsp;&nbsp; <i
							class="fas fa-folder-open"></i> 문제
					</a></li>
					<li role="presentation"><a href="DailyQuizResult.html">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 제출확인</span>
					</a></li>
					<li role="presentation" class="active"><a href="UserQuiz.html"> <i
							class="fas fa-folder"></i> 유저퀴즈
					</a></li>
					<li role="presentation"><a href="RankMain.html"> <i
							class="fas fa-signal"></i> 랭킹보기
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

			<div class="col-md-10">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input type="text" size="50" name="title"
							placeholder="제목을 입력하세요" /></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select name="category">
								<option>java</option>
								<option>html</option>
								<option>css</option>
								<option>javascript</option>
								<option>ajax</option>
						</select></td>
					</tr>
					<tr>
						<th>Hint 설정</th>
						<td>
							<div>
								<input type="text" name="hint1" placeholder="힌트를 입력하세요" /> <input
									type="text" name="hint2" placeholder="힌트를 입력하세요" /> <input
									type="text" name="hint3" placeholder="힌트를 입력하세요" /><br> <span>
									<input type="checkbox" id="1" name="hint" /> <label for="1">힌트
										없음</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>문제 내용</th>
						<td>
							<div id="summernote" style="resize:none;">Hello Summernote</div>
						</td>
					</tr>
					<tr>
						<th class="buttons">
							<button class="btn btn-primary">수정하기</button>
							<button class="btn btn-primary">수정취소</button>
						</th>
						<td></td>
					</tr>
				</table>
			</div>
			<!-- col-md-8 end -->
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/jsp/base-ui/footer.jsp"></c:import>

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>
</body>
</html>