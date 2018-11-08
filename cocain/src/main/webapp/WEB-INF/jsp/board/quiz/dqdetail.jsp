<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dqdetail</title>

<!-- header.. -->
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
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
					<li role="presentation"><a href="#"> <i
							class="fas fa-folder"></i> 데일리퀴즈
					</a></li>
					<li role="presentation" class="active"><a
						href="<c:url value="dqlist.do"/>"> &nbsp;&nbsp; <i
							class="fas fa-folder-open"></i> 문제
					</a></li>
					<li role="presentation"><a href="<c:url value="dqsubmit.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder"></i> 제출확인
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
							<td><span><c:out value="${data.detail.title}"/></span></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><a href="<c:url value="/user/profile.do?writer=${data.detail.nickname}" />"><span><c:out value="${data.detail.nickname}"/></span></a></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><span><fmt:formatDate value="${data.detail.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
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
							<th>난이도</th>
							<c:forEach var="j" items="${data.level}">
								<c:if test="${data.detail.levelNo==j.levelNo}">
									<td><span>${j.levelName}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<th>Hint</th>
							<td>
								<div>
									<span><c:out value="${data.detail.hint}"/></span>
								</div>
							</td>
						</tr>
						<tr>
							<th>문제 내용</th>
							<td>
								<div id="">${data.detail.content}</div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${not empty sessionScope.user.id}">
								<tr>
									<th>정답 제출</th>
									<td class="buttons">
										<form id="submitForm" class="buttons"
											enctype="multipart/form-data">
											<input type="hidden" name="quizNo"
												value="${data.detail.quizNo}" /> <input type="hidden"
												name="nickname" value="${sessionScope.user.nickname}" />
											<c:forEach var="k" items="${data.level}">
												<c:if test="${k.levelNo==data.detail.levelNo}">
													<input type="hidden" name="levelPoint"
														value="${k.levelPoint}" />
												</c:if>
											</c:forEach>
											<!-- 마감되었으면 등록못하게 하기  -->
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
											<c:set var="endDate"><fmt:formatDate value="${data.detail.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
											<c:choose>
												<c:when test="${endDate le sysdate}">
													<p style="color:red">제출 시간이 종료되었습니다.</p>
												</c:when>
												<c:otherwise>
													<input id="attach" type="file" name="attach" style="display: inline" />
													<button id="submit" class="btn btn-primary">제출하기</button>
												</c:otherwise>
											</c:choose>
										</form>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<th>정답 제출</th>
								<td>
									<p style="color: red">로그인이 필요합니다.</p>
								</td>
							</c:otherwise>
						</c:choose>
						<tr>
							<th class="buttons" colspan="3">
								<button id="list" class="btn btn-primary">목록</button> <c:if
									test="${sessionScope.user.id=='admin'}">
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
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>

	<!-- button script -->
	<script>
		$("#list").click(function() {
			location.href = "<c:url value="dqlist.do"/>"
		});

		$("#delete").click(function() {
			location.href = "<c:url value='deleteboard.do?quizNo=${data.detail.quizNo}&typeNo=${data.detail.typeNo}'/>"
		});

		$("#update").click(function(){
			location.href="<c:url value='dqupdateform.do?quizNo=${data.detail.quizNo}'/>";
		});
		

		$("#submit").click(function(e) {
			e.preventDefault();
			
			var fileName= $("#attach").val();			
			
			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();

			if(fileName != "txt" && fileName != "java" &&  fileName != "html" &&  fileName != "jsp"){

				alert("파일은 (jpg, java, html, jsp) 형식만 등록 가능합니다.");

				$("#attach").val("");

				return;

			}
			
			var result = confirm("정답을 제출하시겠습니까?");
			if (result == false)
				return;

			var formData = new FormData($("#submitForm")[0]);
		
			$.ajax({
				url : "<c:url value='dqupload.do'/>",
				method : "POST",
				enctype : 'multipart/form-data',
				contentType : false,
				processData : false,
				data : formData
			}).done(function(data) {
				
				if(data=="registered"){
					alert("해당 문제를 제출하신 이력이 존재합니다.");
				}
				
				else if (data == "true") {
					alert("문제 제출완료!! 제출 게시판으로 이동합니다~~");
					location.href = "<c:url value='dqsubmit.do'/>";
				} else {
					alert("파일을 첨부해주시죠!!");
					return;
				} 
			});
		});
	</script>

</body>
</html>