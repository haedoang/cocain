<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>daily-quiz list</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</head>

<body>
	<!-- header.. -->
	<c:import url="/jsp/base-ui/header.jsp"></c:import>

	<section>
		<div class="aside">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">퀴즈게시판</a></li>
					<li role="presentation"><a
						href="<c:url value="/jsp/board/quiz/dqlist.jsp"/>"> <i
							class="fas fa-folder"></i> 데일리퀴즈
					</a></li>
					<li role="presentation"><a href="DailyQuiz.html">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 문제
					</a></li>
					<li role="presentation"><a href="DailyQuizResult.html">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 제출확인</span>
					</a></li>
					<li role="presentation"><a href="UserQuiz.html"> <i
							class="fas fa-folder"></i> 유저퀴즈
					</a></li>
					<li role="presentation" class="active"><a href="RankMain.html">
							<i class="fas fa-signal"></i> 랭킹보기
					</a></li>
				</ul>
			</div>
		</div>

		<div class="section">
			<div class="background">
				<img src="<c:url value="/resources/images/quiz-back3.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>랭킹 순위</h2>
			</div>

			<div class="context"></div>

			<table class="table table-bordered">
				<tr>
					<th>순위</th>
					<th>ID</th>
					<th>푼 문제수</th>
					<th>정답률</th>
					<th>포인트</th>
					<th></th>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#">GodSeongIll</a></td>
					<td>49291</td>
					<td>94%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>2</td>
					<td>WonjaeZzang</td>
					<td>40001</td>
					<td>92%</td>
					<td>22000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>3</td>
					<td>TrainnerHan</td>
					<td>25671</td>
					<td>88%</td>
					<td>17000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>4</td>
					<td>electoronicCigar</td>
					<td>22002</td>
					<td>76%</td>
					<td>15000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>haedoang</td>
					<td>15555</td>
					<td>42%</td>
					<td>24000</td>
					<td class="buttons"><button class="btn btn-primary">상세보기</button></td>
				</tr>

			</table>


			<div class="row">
				<div class="col-md-4">
					<div class="write">
						<button
							onclick='location.href="<c:url value='/jsp/board/quiz/uqform.jsp'/>"'
							class="btn btn-primary">글쓰기</button>
					</div>
				</div>

				<div class="col-md-4">
					<ul class="pagination pagination-sm">
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
				</div>


				<div class="col-md-4">
					<div class="search">
						<select>
							<option>아이디로 검색</option>
							<option>순위로 검색</option>
						</select> <input class="ser" type="text" size="15" placeholder="검색어를 입력하세요" />
						<button class="ser">
							&nbsp;&nbsp;<i class="fas fa-search"></i>&nbsp;&nbsp;
						</button>
					</div>
				</div>
			</div>
			<!-- row end -->
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/jsp/base-ui/footer.jsp"></c:import>

</body>
</html>