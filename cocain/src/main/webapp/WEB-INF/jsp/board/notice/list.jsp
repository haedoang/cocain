<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- 게시물 목록 표현하기 -->
	<marquee speed=1000>
		<c:if test="${user.nickname != undefined}">${user.nickname} 님이 로그인 중입니다 </c:if>
	</marquee>
	<div class="container">

		<div class="h2">공지사항</div>
		<div class="h4">
			전체 글
			<kbd>${count}</kbd>
			개
		</div>
		<hr>
		<div class="form-inline">
			<!-- 		<a class="btn btn-default "  href="list.do">최신순</a> -->

			<form class="form-group pull-right" id='form' name="form"
				method="post" action="category.do" onsubmit='return google();'>
				<select class="form-control" name="select">
					<option class="form-control" value="title">제목순</option>
					<option class="form-control" value="tc">제목+내용</option>
				</select> <input class='asdf form-control' type="text" name="text"
					placeholder="입력하세요">
				<button class="btn btn-default">검색</button>

			</form>
			<br>
		</div>
		<br>
		<!--여기까지 카테고리 검색시  form으로 이동-->

		<table class="table table-hover">
			<tr>
				<th><a id="num" href="list2.do">번호<i class="fas fa-sort"></i></a></th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th><a id="num2" href="list3.do">조회수<i class="fas fa-sort"></i></a></th>
			</tr>

			<c:forEach var="b" items="${list}">
				<tr>
					<td>${b.no}</td>
					<td><a
						<c:choose>
		<c:when test="${user.nickname == undefined}">
		href="#" data-target="#login" id="log" data-toggle="modal"
		</c:when>
		<c:otherwise>
		  href='detail.do?no=${b.no}'  
		   </c:otherwise>
		   </c:choose>>
							${b.title} [${b.cnt}] </a></td>
				<td><a
						<c:choose>
		<c:when test="${user.nickname == undefined}">
		href="#" data-target="#login" id="log" data-toggle="modal"
		</c:when>
		<c:otherwise>
		  href='/cocain/user/profile.do?writer=${b.writer}'
		   </c:otherwise>
		   </c:choose>>
					${b.writer}</a></td>
					
					<td><fmt:formatDate value="${b.regDate}" pattern="yy-MM-dd" /></td>
					<td><i class="far fa-eye"></i> ${b.viewCnt}</td>
				</tr>
			</c:forEach>
		</table>


		<c:if test="${user.nickname == '코카인관리자'}">
			<a class="btn btn-default" href="writeForm.do">글쓰기</a>
		</c:if>

		<nav>
			<div class="text-center">

				<ul class="pagination">
					<li><a
						<c:choose>
      <c:when test="${beginPage!=1}">href="list.do?pageNo=${beginPage-1}"</c:when>
      <c:otherwise>href="#"</c:otherwise>
	    </c:choose>
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach var="i" begin="${beginPage}" end="${endPage}">
						<li><a
							<c:choose>
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/category.do"}'>
    href="<c:url value='category.do?pageNo=${i-1}&select=${result.select}&text=${result.text}' />"
    </c:when>
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/list2.do"}'>
    href="list2.do?pageNo=${i}"
    </c:when>
    <c:otherwise>
     href="list.do?pageNo=${i}"
     </c:otherwise>
      </c:choose>>

								${i}</a></li>
					</c:forEach>

					<li><a
						<c:choose>
      <c:when test="${endPage != lastPage}"> href="list.do?pageNo=${endPage+1}" </c:when>
    	<c:otherwise>href="#"</c:otherwise>
    	</c:choose>
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</nav>
	</div>

	<div id="df"></div>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

	<script>
	
	function google() {
			if($.trim($('.asdf').val())==''){
			    alert('검색어를 입력 해 주세요.');
				$('.asdf').focus();
				return false;
			    }
			return true;
			}; 
		
			 $(".btn").mouseenter(function() {
				 $(this).addClass("active focus");
			 });
				 $(".btn").mouseleave(function() {
				$(this).removeClass("active focus")
			});
		
				 $(function(){
					 
				 if(${requestScope["javax.servlet.forward.request_uri"].substring(20) == '/list2.do'}){
// 					 console.log("성공");
					 $('#num').attr("href" , "list.do"); 
				 } else if (${requestScope["javax.servlet.forward.request_uri"].substring(20) == '/list3.do'}){
					 $('#num').attr("href" , "list.do"); 
					 $('#num2').attr("href" , "list.do"); 
				 }
				
				 })
		
				 
// 					console.log( '${requestScope["javax.servlet.forward.request_uri"]}'.substring(20)   );
				 
	</script>
</body>
</html>












