<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content 연습</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/quiz.css" />
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header.. -->
	<c:import url="header.jsp"></c:import>

	<section>
		<div class="container">
			<hr />
			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#dailyQuiz"
						aria-controls="dailyQuiz" role="tab" data-toggle="tab">데일리퀴즈</a></li>
					<li role="presentation"><a href="#userQuiz"
						aria-controls="userQuiz" role="tab" data-toggle="tab">회원퀴즈</a></li>
					<li role="presentation"><a href="#opt1" aria-controls="opt1"
						role="tab" data-toggle="tab">option1</a></li>
					<li role="presentation"><a href="#opt2" aria-controls="opt2"
						role="tab" data-toggle="tab">option2</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="dailyQuiz">
						<table class="table table-bordered">
							<tr >
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록시간</th>
								<th>마감시간</th>
								<th>정답자 수</th>
								<th>정답률</th>
								<th>난이도</th>
							</tr>
							<tr>
								<td>799</td>
								<td>Java</td>
								<td><a href="<c:url value="quiz-detail.jsp"/>">객체 생성하기</a></td>
								<td>관리자</td>
								<td>18-10-21 오전 11:36:42</td>
								<td style="color: green">18-10-22 오전 11:36:41</td>
								<td>22</td>
								<td>72%</td>
								<td>쉬워요</td>
							</tr>
							<tr>
								<td>798</td>
								<td>CSS</td>
								<td><a href="#">Position 이해하기</a></td>
								<td>관리자</td>
								<td>18-10-18 오전 11:36:42</td>
								<td style="color: red">마감되었습니다.</td>
								<td>44</td>
								<td>42%</td>
								<td>어려워요</td>
							</tr>
							<tr>
								<td>797</td>
								<td>Ajax</td>
								<td><a href="#">Ajax 호출하기</a></td>
								<td>관리자</td>
								<td>18-10-16 오후 13:11:42</td>
								<td style="color: red">마감되었습니다.</td>
								<td>11</td>
								<td>25%</td>
								<td>어려워요</td>
							</tr>
							<tr>
								<td>796</td>
								<td>Python</td>
								<td><a href="#">반복문 이해하기</a></td>
								<td>관리자</td>
								<td>18-10-12 오전 11:01:04</td>
								<td style="color: red">마감되었습니다.</td>
								<td>128</td>
								<td>77%</td>
								<td>괜찮아요</td>
							</tr>
						</table>
						<hr />
						<div class="row">
						
								<!-- pagination -->
								<nav>
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
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="userQuiz">
						<table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>정답자 수</th>
								<th>정답률</th>
								<th>난이도</th>
							</tr>
							<tr>
								<td>799</td>
								<td>Java</td>
								<td><a href="#">자료구조 Stack 이해하기</a></td>
								<td>박한준</td>
								<td>18-10-21 오전 11:36:42</td>
								<td>22</td>
								<td>72%</td>
								<td>쉬워요</td>
							</tr>
							<tr>
								<td>798</td>
								<td>CSS</td>
								<td><a href="#">Position 이해하기</a></td>
								<td>이원재</td>
								<td>18-10-18 오전 11:36:42</td>
								<td>44</td>
								<td>42%</td>
								<td>괜찮아요</td>
							</tr>
							<tr>
								<td>797</td>
								<td>Ajax</td>
								<td><a href="#">Ajax 호출하기</a></td>
								<td>안규영</td>
								<td>18-10-16 오후 13:11:42</td>
								<td>11</td>
								<td>25%</td>
								<td>어려워요</td>
							</tr>
							<tr>
								<td>796</td>
								<td>Python</td>
								<td><a href="#">반복문 이해하기</a></td>
								<td>조성일</td>
								<td>18-10-12 오전 11:01:04</td>
								<td>128</td>
								<td>77%</td>
								<td>쉬워요</td>
							</tr>
						</table>
						<hr />
						<div class="row">
							<!-- pagination -->
							<nav>
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
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="opt1">...</div>
					<div role="tabpanel" class="tab-pane" id="opt2">...</div>
				</div>

			</div>
			<!-- tab toggle end  -->

		</div>
		<!-- container end  -->
	</section>



	<!-- footer.. -->
	<c:import url="footer.jsp"></c:import>

	<!-- bootstrap tab toggle -->
	<script>
		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
</body>
</html>