<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script -->
<!--   src="https://code.jquery.com/jquery-3.3.1.js" -->
<!--   integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" -->
<!--   crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<style type="text/css">
.form-control{
width:auto;
}
</style>
</head>
<body>
	    <c:import url="/jsp/base-ui/header.jsp"></c:import>
	
	<!-- 게시물 목록 표현하기 -->
	
	<div class="container">
	
	<form class="form-inline" id='form' name="form" method="post" action="category.do"  onsubmit='return google();'>
	<div class="h2">공지사항</div>
	<div class="h4">전체 글 <kbd>${count}</kbd> 개</div>
	<hr>
		<a class="btn btn-default "  href="list.do">최신순</a>
		<a class="btn btn-default"  href="selectView.do">조회순</a>
		<!-- <a href="selectRecom.do">추천순</a> -->
	<div style="float: right"> 
	<select class="form-control"  name="select">
		<option class="form-control" value="title">제목순</option>
		<option class="form-control" value="writer">작성자순</option>
	</select>
		<input class='asdf form-control'  type="text" name="text" placeholder="입력하세요">
		<button class="btn btn-default">검색</button>
	</div>
	
	</form><br>
		<!--여기까지 카테고리 검색시  form으로 이동-->
	
	<table class="table">	
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
	</tr>

	<c:forEach var="b" items="${list}">
    <tr>
		<td>${b.no}</td>
		<td><a href='detail.do?no=${b.no}'>${b.title}</a></td>
		<td>${b.writer}</td>
	    <td><fmt:formatDate value="${b.regDate}" pattern="yy-MM-dd" /></td>
	    <td>${b.viewCnt}</td>
	</tr>
	</c:forEach>	
	</table>
	<a class="btn btn-default"  href="writeForm.do">글쓰기</a>
	
	<nav>
	<div class="text-center">
	
  <ul class="pagination">
    <li>
    
      <a 
      <c:choose>
      <c:when test="${beginPage!=1}">href="list.do?pageNo=${beginPage-1}"</c:when>
      <c:otherwise>href="#"</c:otherwise>
	    </c:choose>
      aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>

	<c:forEach var="i" begin="${beginPage}" end="${endPage}">
    <li ><a href="list.do?pageNo=${i}">${i}</a></li>
	</c:forEach>
    
    <li>
    	    	
      	
      <a 
    	<c:choose>
      <c:when test="${endPage != lastPage}"> href="list.do?pageNo=${endPage+1}" </c:when>
    	<c:otherwise>href="#"</c:otherwise>
    	</c:choose>
      aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      	
    </li>
  </ul>
  </div>
</nav>
	</div>
	
	    <c:import url="/jsp/base-ui/footer.jsp"></c:import>
	
	
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
		
	</script>
</body>
</html>












