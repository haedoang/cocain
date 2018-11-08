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
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
</head>
<body>
	<!-- header.. -->
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>

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
						href="<c:url value="/board/rank/rank.do"/>"> <i class="fas fa-signal"></i>
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
				<h2>UserQuiz 게시판</h2>
			</div>

			<div class="context"></div>

			<table id="uqtable" class="table table-bordered">
				<tr>
					<th width="8%">번호</th>
					<th width="8%">카테고리</th>
					<th width="34%">제목</th>
					<th width="15%">작성자</th>
					<th width="25%">등록일</th>
					<th width="20%">난이도</th>
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
							href="<c:url value="/board/quiz/uqdetail.do?quizNo=${i.quizNo}"/>"><c:out value="${i.title}"/></a></td>
						<td>
							<a
							<c:choose>
                              		<c:when test="${user == null}">
                                 		href="#" data-target="#login" id="log" data-toggle="modal"
                               	</c:when>
                              	<c:otherwise> 
                              		href="<c:url value="/user/profile.do?writer=${i.nickname}" />"
								</c:otherwise>
                             	</c:choose> >
							<c:out value="${i.nickname}"/>
							</a>
						</td>
						<td><fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
						<c:if test="${not empty sessionScope.user.id}">
							<button onclick='location.href="<c:url value='uqform.do'/>"'
								class="btn btn-primary">글쓰기</button>
						</c:if>
					</div>
				</div>

				<div class="col-md-4">
					<c:if test="${pageResult.count!=0}">
							<!-- 전체 게시글이 0개가 아닐때 -->
							<ul class="pagination pagination-sm">
								<li
									<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
									<a
										<c:choose>
											<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(18) eq "/search.do"}'>
												href="<c:url value="search.do?pageNo=${pageResult.beginPage-1}&typeNo=${search.typeNo}&categoryNo=${search.categoryNo}&search=${search.search}&word=${search.word}"/>"
											</c:when>
											<c:otherwise>
												href="<c:url value="uqlist.do?pageNo=${pageResult.beginPage-1}"/>"									
											</c:otherwise>
										</c:choose>
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
								</li>

								<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
									<!-- 현재페이지 체크 불가 -->
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a 
											<c:choose>
											<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(18) eq "/search.do"}'>
												href="<c:url value="search.do?pageNo=${i}&typeNo=${search.typeNo}&categoryNo=${search.categoryNo}&search=${search.search}&word=${search.word}"/>"
											</c:when>
											<c:otherwise>
												href="<c:url value="uqlist.do?pageNo=${i}"/>"									
											</c:otherwise>
										</c:choose>
											>${i}</a>	
									</li>
								</c:forEach>

								<li
									<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
									
									<a
										<c:choose>
											<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(18) eq "/search.do"}'>
												href="<c:url value="search.do?pageNo=${pageResult.endPage+1}&typeNo=${search.typeNo}&categoryNo=${search.categoryNo}&search=${search.search}&word=${search.word}"/>"
											</c:when>
											<c:otherwise>
												href="<c:url value="uqlist.do?pageNo=${pageResult.endPage+1}"/>"									
											</c:otherwise>
										</c:choose>
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</c:if>
			

				</div>


				<div class="col-md-4">
					<div class="search">
						<form id="sForm" action="<c:url value="search.do"/>" method="post">
							<input type="hidden" name="typeNo" value="${data.list[0].typeNo}" />
							<select name="categoryNo">
								<option value="">카테고리전체</option>
								<c:forEach var="i" items="${data.category}">
								<option value="${i.categoryNo}">${i.categoryName}</option>
								</c:forEach>
							</select> 
							<select name="search">
								<option value="1">제목</option>
								<option value="2">작성자</option>
							</select> 
							<input type="text" style="display:none;"/>		
							<input class="ser" type="text" size="15"
								placeholder="검색어를 입력하세요" name="word" />
							<button id="search" class="ser" style="background-color:white">
								&nbsp;&nbsp;<i class="fas fa-search"></i>&nbsp;&nbsp;
							</button>
						</form>
					</div>
				</div>
			</div>
			<!-- row end -->
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
	<script src="<c:url value="/resources/js/jquery-dateformat.js"/>"></script>
	<script>
		/* paging 설정하기 !! */
		$(".pagination > li:eq(0) > a").click(function(e){
			if(!${pageResult.prev}){
				e.preventDefault()
			};
		});
		
		$(".pagination > li:last > a").click(function(e){
			if(!${pageResult.next}){
				e.preventDefault()
			};
		});
	
	</script>
</body>

</html>