<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>

	<section>
		<div class="aside">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">퀴즈게시판</a></li>
					<li role="presentation" class="active"><a href="#"> <i
							class="fas fa-folder"></i> 데일리퀴즈
					</a></li>
					<li role="presentation"><a href="<c:url value="dqlist.do"/>">
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
			<div class="background">
				<img src="<c:url value="/resources/images/quiz-back.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>DailyQuiz > 문제</h2>
			</div>

			<div class="context"></div>

			<table id="dq-list" class="table table-bordered">
				<tr>
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
				<c:forEach var="i" items="${data.list}">
					<tr>
						<td>${i.quizNo}</td>
						<c:forEach var="j" items="${data.category}">
							<c:if test="${i.categoryNo eq j.categoryNo}">
								<td>${j.categoryName}</td>
							</c:if>
						</c:forEach>
						<td><a
							href="<c:url value="/board/quiz/dqdetail.do?quizNo=${i.quizNo}"/>">${i.title}</a></td>
						<td>${i.nickname}</td>
						<td><fmt:formatDate value="${i.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td style="color: green"><fmt:formatDate value="${i.endDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${i.answerCnt}</td>
						<td>${i.probability}%</td>
						<c:forEach var="k" items="${data.level}">
							<c:if test="${i.levelNo eq k.levelNo}">
								<td>${k.levelName}</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>


			</table>


			<div class="row">
				<div class="col-md-4">
					<div class="write">
						<c:if test="${sessionScope.user.id=='admin'}">
							<button onclick='location.href="<c:url value='dqform.do'/>"'
								class="btn btn-primary">글쓰기</button>
						</c:if>
					</div>
				</div>

				<div class="col-md-4">
					<!-- 	<ul class="pagination pagination-sm">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul> -->
					<nav>
					<c:if test="${pageResult.count!=0}">
						<!-- 전체 게시글이 0개가 아닐때 -->
							<ul class="pagination pagination-sm">
								<li
									<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
									<a href="<c:url value="dqlist.do?pageNo=${pageResult.beginPage-1}"/>" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
								</a>
								</li>

								<!-- 반복 -->
								<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
									<!-- 현재페이지 체크 불가 -->
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a href="<c:url value="dqlist.do?pageNo=${i}"/>">${i}</a>
									</li>
								</c:forEach>

								<li
									<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
									<a href="<c:url value="dqlist.do?pageNo=${pageResult.endPage+1}"/>" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
					</c:if>
					</nav>
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


	<script>
		//ajax category
	</script>
</body>
</html>