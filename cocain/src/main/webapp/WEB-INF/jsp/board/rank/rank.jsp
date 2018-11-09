<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>daily-quiz list</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/quiz/dailyquizlist.css"/>" />
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
					<li role="presentation"><a
						href="<c:url value="/board/quiz/dqlist.do"/>"> &nbsp;&nbsp; <i
							class="fas fa-folder"></i> 문제
					</a></li>
					<li role="presentation"><a
						href="<c:url value="/board/quiz/dqsubmit.do"/>"> &nbsp;&nbsp;
							<i class="fas fa-folder"></i> 제출확인
					</a></li>
					<li role="presentation"><a
						href="<c:url value="/board/quiz/uqlist.do"/>"> <i
							class="fas fa-folder-open"></i> 유저퀴즈
					</a></li>
					<li role="presentation" class="active"><a
						href="<c:url value="/board/rank/rank.do"/>"> <i
							class="fas fa-signal"></i> 랭킹보기
					</a></li>
				</ul>
			</div>
		</div>

		<div class="section">
			<div class="background">
				<img src="<c:url value="/resources/images/quiz-back3.jpg"/>"
					width=100% height=250px; />
			</div>

			<div class="title">
				<h2>랭킹 순위</h2>
			</div>

			<div class="context"></div>

			<div class="col-md-8">
				<table class="table table-condensed">
					<tr>
						<th width="20%">순위</th>
						<th width="40%">닉네임</th>
						<th width="40%">포인트</th>

					</tr>
					<c:forEach var="i" items="${list}">
						<tr>
							<td><c:choose>
									<c:when test="${i.rank==1}">
								🥇
							</c:when>
									<c:when test="${i.rank==2}">
								🥈
							</c:when>
									<c:when test="${i.rank==3}">
								🥉
							</c:when>
									<c:otherwise>
								${i.rank}
							</c:otherwise>
								</c:choose></td>
							<td><a
								<c:choose>
                              		<c:when test="${user == null}">
                                 		href="#" data-target="#login" id="log" data-toggle="modal"
                               	</c:when>
                              	<c:otherwise> 
                              		href="<c:url value="/user/profile.do?writer=${i.nickname}" />"
								</c:otherwise>
                             	</c:choose>>
									<c:out value="${i.nickname}" />
							</a></td>
							<td>${i.point}</td>
						</tr>

					</c:forEach>

				</table>


				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<c:if test="${pageResult.count!=0}">
							<ul class="pagination pagination-sm">
								<c:forEach var="i" begin="${pageResult.beginPage}" end="5">
									<li
										<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
										<a href="<c:url value="rank.do?pageNo=${i}"/>">
											${(i-1)*20+1} ~ ${i*20} </a>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<form id="sForm" method="POST" class="buttons">
							<input type="text" style="display: none;" /> <input type="text"
								name="nickname" placeholder="아이디를 입력해주세요" />
							<button id="search" type="button" class="btn btn-primary">찾기</button>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- row end -->

	</section>



	<!-- footer.. -->
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>
	<script>
		$(document).on("click","#search",function(){
			if($("input[name='nickname']").val()==""){
				alert("닉네임을 입력해주세요");
				$("input[name='nickname']").focus();
				return false;
			}
			
			$.ajax({
				url:"<c:url value='search.do'/>",
				data:"nickname="+$("input[name='nickname']").val()
			}).done(function(data){
				
				var html="";
				$("table > tbody > tr:eq(0)").siblings().remove();
				$(".pagination").remove();
							
				//조회결과 없을때 
				if(data.length==0){
					html="<tr><td></td><td>검색 결과가 존재하지 않습니다.</td><td></td></tr>";
					$( 'html, body' ).animate( { scrollTop : 48 }, 400 );
				
				} else {
					
					html="<tr><td>";
					switch(data.rank){
					case 1 : html+="🥇"
						break;
					case 2 : html+="🥈";
						break;
					case 3 : html+="🥉";
					default: html+=data.rank;
					}
					
					html+="</td><td>"+data.nickname+"</td><td>"+data.point+"</td></tr>";
				}
				$("table > tbody > tr:eq(0)").after(html);
				$( 'html, body' ).animate( { scrollTop : 48 }, 400 );
				
			})
		});
		
	
	
	</script>
</body>
</html>