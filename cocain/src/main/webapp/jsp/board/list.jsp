<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
text-align:center;
}
</style>
</head>
<body>
	<!-- 게시물 목록 표현하기 -->
	<h2>자유게시판</h2>
	<hr>
	<table>
	<tr>
		<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
	</tr>
	<c:forEach var="b" items="${list}">
    <tr>
		<td>${b.no}</td>
		<td><a href='detail.do?no=${b.no}'>${b.title}</a></td>
		<td>${b.writer}</td>
	    <td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></td>
	    <td>${b.viewCnt}</td>
	</tr>
	</c:forEach>	
	</table>
	<a href="writeForm.do">글쓰기</a>
</body>
</html>












