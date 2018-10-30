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
				<li role="presentation"><a href="<c:url value="/jsp/board/quiz/dqlist.jsp"/>"> <i
						class="fas fa-folder"></i> 데일리퀴즈
				</a></li>
				<li role="presentation" ><a href="DailyQuiz.html">
						&nbsp;&nbsp; <i class="fas fa-folder-open"></i> 문제
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
			<h2>UserQuiz 게시판</h2>
		</div>

		<div class="context"></div>

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


		<div class="row">
			<div class="col-md-4">
				<div class="write">
					<button onclick='location.href="<c:url value='/jsp/board/quiz/uqform.jsp'/>"'
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
						<option>제목</option>
						<option>카테고리</option>
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