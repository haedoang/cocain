<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content 연습</title>
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
					<li role="presentation" ><a
						href="#"> <i class="fas fa-folder"></i>
							데일리퀴즈
					</a></li>
					<li role="presentation"><a href="<c:url value="dqlist.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder-open"></i> 문제
					</a></li>
					<li role="presentation" class="active"><a href="<c:url value="dqsubmit.do"/>">
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
				<img src="<c:url value="/resources/images/quiz-back4.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>DailyQuiz > 제출확인</h2>
			</div>

			<div class="context"></div>
			<table class="table table-bordered">
				<tr>
					<th>번호</th>
					<th>문제번호</th>
					<th>제출자</th>
					<th>제목</th>
					<th>파일첨부</th>
					<th>제출일</th>
					<c:if test="${sessionScope.user.id=='admin'}">
					<th>채점하기</th>
					</c:if>
				</tr>
				<c:forEach var="i" items="${data.list}">
				<tr>
					<td>${i.submitNo}</td>
					<td>${i.quizNo}</td>
					<!-- 
					jstl masking
					 -->
					<td class="nickname">${fn:substring (i.nickname,0,fn:length(i.nickname)-4) }****</td>
					<td>${i.quizNo}번 문제 제출 파일</td>
					<td><a href="file://${i.path}"><i class="far fa-file-code"></i></a></td>
					<td>
						<fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd"/>
					</td>
					<c:if test="${sessionScope.user.id=='admin'}">
						<td>
							<form>
							<input type="radio" id="yes" name="evaluation" value="y" />
								<label for="yes">정답</label>
							<input type="radio" id="no" name="evaluation" value="n" />
								<label for="no">오답</label>　　　
							<input type="button" value="채점">		
							</form>
						</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<nav>
						<c:if test="${pageResult.count!=0}">
							<!-- 전체 게시글이 0개가 아닐때 -->
							<ul class="pagination pagination-sm">
								<li
									<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
									<a
									href="<c:url value="dqsubmit.do?pageNo=${pageResult.beginPage-1}"/>"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
								</li>

								<!-- 반복 -->
								<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
									<!-- 현재페이지 체크 불가 -->
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a href="<c:url value="dqsubmit.do?pageNo=${i}"/>">${i}</a>
									</li>
								</c:forEach>

								<li
									<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
									<a
									href="<c:url value="dqsubmit.do?pageNo=${pageResult.endPage+1}"/>"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</c:if>
					</nav>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/jsp/base-ui/footer.jsp"></c:import>
	
	<script>
	/* paging 설정하기 !! */
	$(".pagination > li:eq(0) > a").click(function(e){
		if(!${pageResult.prev}){
			e.preventDefault();
		}
	})

	$(".pagination > li:last > a").click(function(e){
		if(!${pageResult.next}){
			e.preventDefault();
		}
	})
	
	</script>

</body>
</html>