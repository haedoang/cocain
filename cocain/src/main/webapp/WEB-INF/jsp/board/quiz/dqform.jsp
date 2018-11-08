<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- header.. -->
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데일리퀴즈 등록하기</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<!-- include summernote css/js -->
<link rel="stylesheet"
	href="<c:url value="/resources/summernote/summernote.css"/>" />
<script src="<c:url value="/resources/summernote/summernote.js"/>"></script>
<body>
	<section id="dqform-section">
		<div class="aside">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">퀴즈게시판</a></li>
					<li role="presentation" ><a
						href="#"> <i class="fas fa-folder"></i>
							데일리퀴즈
					</a></li>
					<li role="presentation" class="active"><a href="<c:url value="dqlist.do"/>">
							&nbsp;&nbsp; <i class="fas fa-folder-open"></i> 문제
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
			<div class="background">
				<img src="<c:url value="/resources/images/quiz-back.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>데일리퀴즈 > 문제 업로드</h2>
			</div>

			<div class="context"></div>

			<div class="col-md-10">

				<form id="dqForm" action="<c:url value="dqwrite.do"/>" method="post" onsubmit="return doCheck()">
					<table class="table">
						<tr>
							<th>카테고리</th>
							<td><select name="categoryNo">
									<c:forEach var="i" items="${data.category}">
										<option value="${i.categoryNo}">${i.categoryName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>난이도</th>
							<td><c:forEach var="j" items="${data.level}">
									<input type="radio" id="r${j.levelNo}" name="levelNo"
										value="${j.levelNo}" />
									<label for="r${j.levelNo}">${j.levelName}</label>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th>Hint 설정</th>
							<td>
								<div>
									<input id="yeshint" type="text" name="hint" placeholder="힌트를 입력하세요"
										size="50" /> <br> <span> <input type="checkbox"
										id="nohint" name="hint" value=""/> <label for="nohint">힌트 없음</label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<!-- typeNo, Id hidden --> <input type="hidden" name="typeNo"
								value="1" /> <input type="hidden" name="nickname"
								value="${user.nickname}" /> <input type="text" size="50"
								name="title" placeholder="제목을 입력하세요" />
							</td>
						</tr>
						<tr>
							<th>문제 내용</th>
							<td><textarea id="summernote" name="content"></textarea></td>
						</tr>
						<tr>
							<th class="buttons" colspan="2">
								<button id="submit" class="btn btn-primary">등록</button>
								<button id="cancel" class="btn btn-primary">취소</button>
							</th>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- col-md-8 end -->
		</div>
	</section>

	<script>
	
		
		$(function(){
			$("#nohint").change(function(){
				if($("#nohint").is(":checked")){
					$("#yeshint").val("");
					$("#yeshint").attr("placeholder","");
					$("#yeshint").attr("disabled","disabled");
				} else{
					$("#yeshint").attr("placeholder","힌트를입력하세요");
					$("#yeshint").removeAttr("disabled");
				}
				
			});
		});
	
		$("#cancel").click(function(e){
			e.preventDefault();
			location.href="<c:url value="dqlist.do"/>";
		});
	
		/* 미설정 체크  */
		function doCheck(){
			if(!$("input[name='levelNo']").is(":checked")){
				alert("난이도를 선택하세요.");
				return false;
			}
			if(!$("#nohint").is(":checked")&& $("#yeshint").val()==""){
				alert("힌트를 입력하세요");
				return false;
			}
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

	<!-- footer.. -->
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>
</body>
</html>

	