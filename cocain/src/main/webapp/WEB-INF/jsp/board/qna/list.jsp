<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CoCaIn</title>
<link rel="stylesheet" href="/cocain/resources/css/bootstrap/bootstrap.css">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/cocain/resources/js/bootstrap.js"></script>

</head>

<body>
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="table-responsive">
					<h3>지식iN</h3>
					<p>전체 ${listCount}건 ${pageResult.pageNo} 페이지</p>
					<table class="table" style="width: 100%">
						<thead>
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>추천수</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						
				<c:forEach var="list" items="${qna.list}">
							<tr>
								<td id="listno">${list.no}</td>
								<c:choose>
								<c:when test="${list.qnaStatus eq 'y' }">
								<td>답변완료</td>
								</c:when>
								<c:otherwise>
								<td>답변대기</td>
								</c:otherwise>
								</c:choose>
								<td><a href='detail.do?no=${list.no}' <c:if test="${user==null}">onclick="alert('로그인이 필요합니다.'); return false"</c:if>>${list.title}</a></td>
								
								
								<td><a>${list.writer}</a></td>
								<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
								<td>22</td>
								<td>${list.viewCnt}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr />
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<a class="btn btn-default pull-right" href="writeForm.do">글쓰기</a>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="text-center">
					<ul class="pagination">
						<li
							<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
							<a
							href="<c:url value="list.do?pageNo=${pageResult.beginPage-1}"/>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<c:forEach var="i" begin="${pageResult.beginPage}"
									end="${pageResult.endPage}">
									<!-- 현재페이지 체크 불가 -->
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a href="<c:url value="list.do?pageNo=${i}"/>">${i}</a>
									</li>
								</c:forEach>
						<li
							<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
							<a
							href="<c:url value="list.do?pageNo=${pageResult.endPage+1}"/>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10 text-center">
				<form class="form-inline" role="form" action="/board/search"
					method="post">
					<div class="form-group">
						<select class="form-control" name="search_scope">
							<option value="everything">전체</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="problem">제목+내용</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="search_term"
							placeholder="" value="">
					</div>
					<input type="hidden" value="all" name="search_category">
					<button type="submit" class="btn">검색</button>
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-12" style="height: 50px"></div>
		</div>
	</div>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />
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
		
		var temp = $("#listno").val();
		var num = "${list.list}"
		function recCount(){
			console.log(num.no)
		}
		recCount();
	</script>
</body>

</html>