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
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
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
							href="<c:url value="/board/quiz/uqdetail.do?quizNo=${i.quizNo}"/>">${i.title}</a></td>
						<td><a href="#"><span>${i.nickname}</span></a></td>
						<td><fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd" /></td>
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
						<c:if test="${not empty sessionScope.user.id}">
							<button onclick='location.href="<c:url value='uqform.do'/>"'
								class="btn btn-primary">글쓰기</button>
						</c:if>
					</div>
				</div>

				<div class="col-md-4">
					<nav>
						<c:if test="${pageResult.count!=0}">
							<ul class="pagination pagination-sm">
								<li
									<c:if test="${pageResult.prev eq false}">
										class="disabled"
									 </c:if>
								>
									<a href="<c:url value="uqlist.do?pageNo=${pageResult.beginPage-1}"/>"aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span></a>
								</li>

								<!-- 반복 -->
								<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
									<!-- 현재페이지 체크 불가 -->
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a href="<c:url value="uqlist.do?pageNo=${i}"/>">${i}</a>
									</li>
								</c:forEach>

								<li
									<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
									<a
									href="<c:url value="uqlist.do?pageNo=${pageResult.endPage+1}"/>"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</c:if>
					</nav>

				</div>


				<div class="col-md-4">
					<div class="search">
						<form id="sForm" method="post">
							<input type="hidden" name="typeNo" value="${data.list[0].typeNo}" />
							<select>
								<option>제목</option>
								<option>카테고리</option>
							</select> <input class="ser" type="text" size="15"
								placeholder="검색어를 입력하세요" name="title" />
							<button id="search" class="ser" style="background-color: #000000">
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
				e.preventDefault();
			}
		})
		$(".pagination > li:last > a").click(function(e){
			if(!${pageResult.next}){
				e.preventDefault();
			}
		})
		
		$("#search").click(function(e){
			e.preventDefault();
			var formData = $("#sForm").serialize();
		 
			$.ajax({
				url:"<c:url value="search.do"/>",
				method:"POST",
		   		data:formData
			}).done(function(data){
				//console.log(data);
				$("#uqtable > tbody > tr:eq(0)").siblings().remove();
				var html="";	
				var list = data.list;
				var category = data.category;
				var level = data.level;
				console.log(list);	
				alert(list[0].quizNo)
				
				for(var i of list){
					html+="<tr><td>"+i.quizNo+"</td>";
						for(var j of category){
							if(i.categoryNo==j.categoryNo){
								html+="<td>"+j.categoryName+"</td>";	
							}//category end
						}//inner for end 
					html+="<td><a href='<c:url value='/board/quiz/uqdetail.do?quizNo="+i.quizNo+"'/>'>";
					html+=i.title+"</a></td><td>"+i.nickname+"</td>";
					html+="<td>"+$.format.date(i.regDate, "yyyy-MM-dd")+"</td>";
					html+="<td>"+i.answerCnt+"</td><td>"+i.probability+"%</td>";
					for(var k of level){
						if(k.levelNo==i.levelNo){
							html+="<td>"+k.levelName+"</td>";	
						}//category end
					}
		
					}//for end 	
		 			html+="</tr>"	
				$("#uqtable > tbody > tr:eq(0)").after(html);
			}); 
		});
	</script>
</body>
</html>