<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- header.. -->
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dqdetail</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

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
			<div class="row">
				<div class="background">
					<img src=<c:url value="/resources/images/quiz-back2.jpg"/>
						width=100% height=250px; />
				</div>

				<div class="title">
					<h2>UserQuiz > 문제풀기</h2>
				</div>

				<div class="context"></div>

				<div class="col-md-10">
					<table class="table">
						<tr>
							<th>게시글 번호</th>
							<td><span>${data.detail.quizNo}</span></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><a href="<c:url value="/user/profile.do?writer=${data.detail.nickname}" />"><span><c:out value="${data.detail.nickname}"/></span></a></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><span><fmt:formatDate
										value="${data.detail.regDate}" pattern="yyyy-MM-dd" /></span></td>
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
							<th>제목</th>
							<td><span><c:out value="${data.detail.title}"/></span></td>
						</tr>
						<tr>
							<th>문제 내용</th>
							<td>
								<div id="">${data.detail.content}</div>
							</td>
						</tr>
						<tr>
							<th>정답 확인하기</th>
							<td class="buttons">
								<form id="cForm" method="POST" action="#" class="buttons">
									<input type="hidden" name="quizNo"
										value="${data.detail.quizNo}" /> <input type="text"
										name="correct" placeholder="정답을 입력하세요" />
									<button id="correct" class="btn btn-primary">정답확인</button>
									<div id="result"></div>
								</form>
							</td>
							<td></td>
						</tr>
						<tr>
							<th colspan="2" class="buttons">
								<button id="list" class="btn btn-primary">목록</button> <c:if
									test="${sessionScope.user.nickname==data.detail.nickname}">
									<button id="update" class="btn btn-primary">수정</button>
									<button id="delete" class="btn btn-primary">삭제</button>
								</c:if>
							</th>
						</tr>
					</table>
					<hr />
					<h4>댓글테이블</h4>
					<div class="row">
						<c:if test="${not empty sessionScope.user.nickname}">
							<form id="comForm" method="POST">
								<div class="col-md-10">
									<input type="hidden" name="quizNo"
										value="${data.detail.quizNo}" /> <input type="hidden"
										name="nickname" value="${sessionScope.user.nickname}">
									<textarea name="content" class="form-control" rows="2"></textarea>
								</div>
								<div class="col-md-2 buttons">
									<button id="comSubmit" class="btn btn-primary">등록</button>
								</div>
							</form>
						</c:if>
					</div>
					<br>
					<div class="row">
						<table id="comTable" class="table">
							<tr>
								<th width="10%">작성자</th>
								<th width="40%">내용</th>
								<th width="20%">등록일</th>
								<th width="20%"></th>
							</tr>
							<c:forEach var="k" items="${data.comment}">
								<tr id="${k.comNo}">
									<td><a href="#"><span><c:out value="${k.nickname}"/></span></a></td>
									<td><span>${k.content}</span></td>
									<td><fmt:formatDate value="${k.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td class="buttons">
									<c:if test="${sessionScope.user.nickname==k.nickname}">
										<button id="comUpdate" class="btn btn-primary" onclick="comUpdate(${k.comNo})">수정</button>
										<button id="comDelete" class="btn btn-primary" onclick="comDel(${k.comNo})">삭제</button>
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- 8 end  -->
				</div>
			</div>
		</div>
	</section>



	

	<!-- summernote -->
	<script src="<c:url value="/resources/js/edit-summernote.js"/>"></script>
	<!--  date format -->
	<script src="<c:url value="/resources/js/jquery-dateformat.js"/>"></script>

	<!-- button script -->
	<script>

	
		$("#comSubmit").click(function(e){
			e.preventDefault();
			
			var str = $("textarea[name='content']").val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

			$("textarea[name='content']").val(str);
			
				
			
			var comForm = $("#comForm").serialize();
			
			$.ajax({
				url:"<c:url value='insertComment.do'/>",
				method:"POST",
				data:comForm
			})
			.done(function(data){
				listComment($("input[name=quizNo]").val());
			});
			
		});
		
		/* 댓글 리스트 출력 함수로 빼기 */
		var quizNo= $("input[name=quizNo]").val();
		function listComment(quizNo){
			$.ajax({
				url:"<c:url value='listComment.do'/>",
				data:"quizNo="+quizNo
			}).done(function(data){
				var html ="";
				$("#comTable > tbody > tr:eq(0)").siblings().remove();
				for(let i of data){
					html+="<tr id='"+i.comNo+"'><td><a href='#'><span>"+i.nickname+"</span></a></td>";
					html+="<td><span>"+i.content+"</span></td>";
					html+="<td>"+$.format.date(i.regDate, "yyyy-MM-dd HH:mm:ss")+"</td>";
					
					if(i.nickname==`${sessionScope.user.nickname}`){
						html+="<td class='buttons'><button class='btn btn-primary'onclick='comUpdate("+i.comNo+")'>수정</button>";
						html+=" <button class='btn btn-primary' onclick='comDel("+i.comNo+")'>삭제</button></td>";
					} else {
						html+="<td></td>"
					};		
				};//for end 
				$("textarea[name='content']").val("");
				$("#comTable > tbody > tr:eq(0)").after(html);
		
			});//ajax end 
			
		}//function end 
		
		
		
	
		/* 댓글 삭제 */
		function comDel(comNo){
			 $.ajax({
				url:"<c:url value='deleteComment.do'/>",
				data:"comNo="+comNo
			}).done(function(data){
				$("#"+comNo).remove();
				
			}) 
		} 
		
 		//댓글 수정하기 
		function comUpdate(comNo){
			var row = $("#"+comNo);
			var content = row.children("td:eq(1)").children("span").html();
			console.log(content);
			content= content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			alert(content);
		
			row.children("td:eq(1)").replaceWith("<td><input type='hidden' name='comNo' value='"+comNo+"'/> <textarea name='cContent' cols='50'>"+content+"</textarea></td>");
			row.children("td:eq(3)").replaceWith("<td class='buttons'><button class='btn btn-primary' id='comUp'>수정하기</button> <button class='btn btn-primary' id='comDel'>수정취소</button></td>")
		} 
		
		//댓글 수정 확인 
		$(document).on("click","#comUp",function(){
			var quizNo= $("input[name=quizNo]").val();
			var comNo= $("input[name='comNo']").val();
			var cContent = $("textarea[name='cContent']").val();
			
		
			cContent = cContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			
			
			$.ajax({
				url:"<c:url value='updateComment.do'/>",
				data:"quizNo="+quizNo+"&comNo="+comNo+"&content="+cContent
			}).done(function(data){	
				listComment($("input[name=quizNo]").val());
			})
		});
		
		//댓글 수정 취소 
		$(document).on("click","#comDel",function(){
			listComment($("input[name=quizNo]").val());	
		});
		
		
		
		
		/* 정답호출 ajax */
		$("#correct").click(function(e) {
			e.preventDefault();
			var data = $("#cForm").serialize();
			//console.log(data);
			$.ajax({
				url : "<c:url value="uqcorrect.do"/>",
				method : "post",
				data : data
			}).done(function(result) {
				if (result == 0) {
					$("#result").css({
						color : "red"
					}).html("틀렸습니다.");
				} else {
					$("#result").css({
						color : "green"
					}).html("정답입니다!!");
				}
			})
		});

		/* 게시글 삭제 */
		$("#delete").click(function() {
			location.href = "<c:url value='deleteboard.do?quizNo=${data.detail.quizNo}&typeNo=${data.detail.typeNo}'/>"
		});
		/* 게시글 수정*/
		$("#update").click(function() {
			location.href = "<c:url value='uqupdateform.do?quizNo=${data.detail.quizNo}'/>";
		});
		/* 게시글 목록 */
		$("#list").click(function() {
			location.href = "<c:url value="uqlist.do"/>";
		});
	</script>
</body>
<!-- footer.. -->
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
</html>
