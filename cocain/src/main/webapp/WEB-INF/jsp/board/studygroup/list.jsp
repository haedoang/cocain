<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../../resources/css/bootstrap/bootstrap.css"
	rel="stylesheet" />

<style>
th {
	background-color: grey;
}

.date{
	font-size: 10px;
	color: grey;
}

.title{
	color: grey;
	font: bold 20px italic 굴림;
}
.categori{
	font-size: 14px;
	color: brown;
	font-style: bold;
}
.id{
	font-size: 13px;
	font-style: bold;
}
</style>

</head>



<body>


	<!-- 게시물 목록 표현하기
	<h2>자유게시판</h2>
	<hr>
	<table class="table">
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th>
	</tr>
	</table>
	<a href="writeForm.do">글쓰기</a> -->
	
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"/> 
	<hr>
	<div class="container">
		<div class="form-inline">
			<div class="row text-center ">
		<div class="background">
				<img src="<c:url value="/resources/images/ii.jpg"/>" height=200px; position= left; />
			</div>
			<br>
			<form class="form-inline" role="form" action="searchlist.do" method="post">
				<div class="form-group">
					<select class="input-sm form-control" name="searchType"
						style="width: 140px; height: 30px; font-size: 14px;">
						
						<option value="">선택하세요</option>
						<c:forEach var="c" items="${category}">
							<option value="${c.categoryName}">${c.categoryName}	</option>
						</c:forEach>
						
					</select>
				</div>
				
					<div class="form-group">
						<input type="text" class="form-control" name="keyword"
							placeholder="검색어를 입력하세요">
					</div>
	
			
				<button class="btn btn btn-primary searchBNT" 
					style="background-color: black; border-color: black;" type="submit" >검색</button>
					
					
			<c:if test="${not empty keyword}">
				<div class="row">
					<br>※ 게시물 제목 및 내용에 "${keyword}"가 포함되어 있습니다. 
				</div>
			</c:if>
			
			</form>
					
			</div>
			<br>
		</div>
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<table class="table table-striped table-hover">
					<tbody>
						<c:forEach var="b" items="${list}">
							<tr>
								<td>
									<!-- <div>${b.no}</div> -->
									<div>
									<span class="id">
										<a 
	                                    <c:choose>
	                                   		<c:when test="${user == null}">
	                                   			href="#" data-target="#login" id="log" data-toggle="modal"
	                                 		</c:when>
	                                  		<c:otherwise>
	                                    		href="<c:url value="/user/profile.do?writer=${b.id}" />"
	                                    	</c:otherwise>
	                                 	</c:choose> >
	                                    	${b.id}
	                                    </a>

									</span>
									 &nbsp&nbsp&nbsp
									 <span class="date"><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></span>
									 </div>
									<div>
										<span class="categori">${b.categoryName}</span>
									</div>
									<div>
									<span class="title" ><a 
											<c:choose>
	                                    		<c:when test="${user == null}">
	                                    			href="#" data-target="#login" id="log" data-toggle="modal"
	                                   			</c:when>
	                                   			<c:otherwise>
													href='detail.do?no=${b.no}'
	                                    		</c:otherwise>
	                                    	</c:choose> > ${b.title}</a></span>
									</div>
									<div>
										<span class="glyphicon glyphicon-eye-open">${b.viewCnt}</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										 <span class="glyphicon glyphicon-pencil">${b.comCnt}</span> <!-- 조회수 알리아스 -->
										<div><a href='detail.do?no=${b.no}'></a></div>
									</div>
								</td>
							</tr>
						</c:forEach>	
					
					</tbody>
				</table>
				<div class="text-right">
					<button class="btn btn btn-primary"
						style="background-color: black; border-color: black;" onclick="location.href='writeForm.do'">글쓰기</button>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>

			<nav class="text-center">
				<c:if test="${pageResult.count!=0}">
							<!-- 전체 게시글이 0개가 아닐때 -->
							<ul class="pagination pagination-sm">
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
						</c:if>
			</nav>
	</div>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"/>  

	
</body>


</html>












