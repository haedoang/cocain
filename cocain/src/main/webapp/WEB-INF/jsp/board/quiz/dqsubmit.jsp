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
<%-- <link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>" /> --%>
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<%-- <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script> --%>
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
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 문제
					</a></li>
					<li role="presentation" class="active"><a href="<c:url value="dqsubmit.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder-open"></i> 제출확인
					</a></li>
					<li role="presentation"><a href="<c:url value="uqlist.do"/>">
							<i class="fas fa-folder"></i> 유저퀴즈
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
					<td class="nickname">${fn:substring (i.nickname,0,fn:length(i.nickname)-3) }***</td>
					<td>${i.quizNo}번 문제 제출 파일</td>
					<td>
						<!-- 확장자 가져오기  -->
						<c:set var="file" value="${i.fileName}"/>
						<c:set var="list" value="${fn:split(file,'.')}"/>
						<c:forEach var="k" items="${list}" varStatus="loop">
							<c:if test="${loop.last eq true}">
								<c:set var="ext" value="${k}"/>
							</c:if>
						</c:forEach>
						
					<a target="_blank" href="<c:url  value="fileload.do?path=${i.path}&fileName=${i.fileName}&dname=submit.${ext}"/>">
						<i class="far fa-file-code"></i>
						</a>
					</td>
					<td>
						<fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<c:if test="${sessionScope.user.id=='admin'}">
						<td>
							<form id="sForm${i.submitNo}" method="POST" class="buttons">
							<input type="hidden" name="quizNo" value="${i.quizNo}"/>
							<input type="hidden" name="submitNo" value="${i.submitNo}"/>
							<input type="hidden" name="levelPoint" value="${i.levelPoint}"/>
							<input type="hidden" name="nickname" value="${i.nickname}"/>
							<input type="radio" id="y${i.submitNo}" name="evaluation" value="y"
								<c:if test="${i.evaluation=='y'}">
									checked
								</c:if>
							/>
								<label for="y${i.submitNo}">정답</label>　
							<input type="radio" id="n${i.submitNo}" name="evaluation" value="n"
								<c:if test="${i.evaluation=='n'}">
									checked disabled
								</c:if>
							 />
								<label for="n${i.submitNo}">오답</label>　　　
							<c:choose>
								<c:when test="${i.evaluation != 'u'}">
									<span style="color:green">채점완료</span>	
								</c:when>
								<c:otherwise>
									<button id="b${i.submitNo}" type="button" class="btn btn-primary" onclick="doCheck(${i.submitNo})">채점하기</button>
								</c:otherwise>
							</c:choose>	
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
							<ul class="pagination pagination-sm">
								<li
									<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
									<a
									href="<c:url value="dqsubmit.do?pageNo=${pageResult.beginPage-1}"/>"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
								</li>

								<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
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
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
	
	<script>
	/* paging 설정하기 !! */
	$(".pagination > li:eq(0) > a").click(function(e){
		if(!${pageResult.prev}){
			e.preventDefault();
		}
	});

	$(".pagination > li:last > a").click(function(e){
		if(!${pageResult.next}){
			e.preventDefault();
		}
	});
	
	/* evaluation 설정하기.  */
	function doCheck(submitNo){
		var formData = $("#sForm"+submitNo).serialize();
		console.log(formData);
		
		$.ajax({
			url:"<c:url value='updateEval.do'/>",
			method:"POST",
			data:formData
		}).done(function(data){
			$("#b"+submitNo).before("<span style='color:green'>채점완료</span>");
			$("#b"+submitNo).remove();
			$("#y"+submitNo).attr("disabled","true");
			$("#n"+submitNo).attr("disabled","true");
			
			
			/* location.href="<c:url value='dqsubmit.do'/>"; */
		})
	}
	

	
	</script>

</body>
</html>