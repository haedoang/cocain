<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/bootstrap.css" rel="stylesheet" />
<style>
span {
	font-size: 20px;
	color: black;
	font-weight: bold;
}

select>option {
	text-align: center;
}
</style>

</head>

<body>
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"/> 
	<hr>
	<form method="post" onsubmit="return doAction()" action="write.do">
	<input type="hidden" name="id" value="${user.nickname}"/>
	<div class="container">
				<div class="row text-center ">
		<div class="background">
				<img src="<c:url value="/resources/images/ii.jpg"/>" height=200px; position= left; />
			</div>
			</div>
			<br>
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<br>
				<br>
				<div>
					<span>제목</span> <br> <input type="text" class="form-control" name="title"
						id="exampleInputName2" placeholder="제목을 입력하세요"> <br>
					<span>분류</span> <br> 
					<select class="input-sm" style="width: 280px; height: 35px; font-size: 14px;" name="categoryName">
						<option value="">선택하세요</option>
						<c:forEach var="c" items="${category}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</div>
				<br>

				<div>
					<span>내용</span>
					<textarea class="form-control" rows="3" style="height: 200px" name="content"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<br>
				<div class="text-center">
					<button class="btn btn btn-primary" style="background-color: black; border-color: black;" >
					등록</button>
					<button type="button"
					class="btn btn btn-primary" style="background-color: black; border-color: black;" onclick="location.href='list.do'">
					목록</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-2"></div>
	</div>
	</form>
	<br>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"/>  
	
	
	
	<script>
	<!-- 값 체크하기 -->
	function doAction(){
		if($("input[name='title']").val()==""){
			alert("제목을 입력하세요");
			$("input[name='title']").focus();
			return false;
		}
		if($("textarea[name='content']").val()==""){
			alert("내용을 입력하세요");
			$("textarea[name='content']").focus();
			return false;
		}
	}
	
	
	</script>
</body>

</html>