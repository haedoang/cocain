<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cocain</title>
<link rel="stylesheet" href="/cocain/resources/css/main/mainSearch.css">
<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
<script src="/cocain/resources/js/jquery.animateNumber.js"></script>
</head>
<body>
	<div class="container SearchContainer">
		<div class="row">
			<c:if test="${not empty list}">
				<div class="row">
					※ 게시물 제목 및 내용에 "${searchContent}"가 포함되어 있습니다.
				</div>
			</c:if>
			<table class="table table-hover">
				<tbody>
					<c:forEach var="i" items="${list}">
						<tr>
							<td>
								<div class="text-left">
									<div>
									<c:choose>
			                            <c:when test="${i.typeqna == 'typenotice'}">
			                            	<a <c:if test="${user == null}">
			                            		href="#" data-target="#login" id="log" data-toggle="modal"
			                            	</c:if>
			                            	href="<c:url value="/board/notice/detail.do?no=${i.no}" />">${i.title}</a>
			                            </c:when>
			                            <c:when test="${i.typeqna == 'typeqna'}">
			                            	<a <c:if test="${user == null}">
			                            		href="#" data-target="#login" id="log" data-toggle="modal"
			                            	</c:if>
			                            	href="<c:url value="/board/qna/detail.do?no=${i.no}" />">${i.title}</a>
			                            </c:when>
				                        <c:when test="${i.typeqna == 'typequiz'}">
			                          	  <a <c:if test="${user == null}">
			                            		href="#" data-target="#login" id="log" data-toggle="modal"
			                            	</c:if>
			                          	  href="<c:url value="/board/quiz/uqdetail.do?quizNo=${i.no}" />">${i.title}</a>
			                            </c:when>
			                            <c:when test="${i.typeqna == 'typestudy'}">
			                         	   <a <c:if test="${user == null}">
			                            		href="#" data-target="#login" id="log" data-toggle="modal"
			                            	</c:if>
			                         	   href="<c:url value="/board/studygroup/detail.do?no=${i.no}" />">${i.title}</a>
			                            </c:when>
		                            </c:choose>
									</div>
									<div>
										<c:choose>
				                            <c:when test="${i.typeqna == 'typenotice'}">
				                            	공지사항　
				                            </c:when>
				                            <c:when test="${i.typeqna == 'typeqna'}">
				                            	지식iN　
				                            </c:when>
					                        <c:when test="${i.typeqna == 'typequiz'}">
				                          	  	퀴즈　
				                            </c:when>
				                            <c:when test="${i.typeqna == 'typestudy'}">
				                         	   	스터디　
				                            </c:when>
			                            </c:choose>|　
	                                    <a
			                            	<c:choose>
		                                   		<c:when test="${user == null}">
		                                   			href="#" data-target="#login" id="log" data-toggle="modal"
		                                 		</c:when>
		                                  		<c:otherwise> 
		                                   			href="<c:url value="/user/profile.do?writer=${i.writer}" />"
		                                    	</c:otherwise>
	                                   		</c:choose> >
			                            ${i.writer}</a>　|　<fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd"/>　|　댓글 ${i.comCnt}
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
            <nav class="text-center">
				<c:if test="${pageResult.count!=0}">
					<ul class="pagination">
						<li
							<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
							<c:choose>
								<c:when test="${pageResult.prev eq false}">
									<a aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
								</c:when>
								<c:otherwise>
									<a
									href="<c:url value="mainSearch.do?pageNo=1&searchContent=${searchContent}"/>"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
						<li
							<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
							<c:choose>
								<c:when test="${pageResult.prev eq false}">
									<a aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span></a>
								</c:when>
								<c:otherwise>
									<a
									href="<c:url value="mainSearch.do?pageNo=${pageResult.beginPage-1}&searchContent=${searchContent}"/>"
									aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
						<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
							<li
								<c:if test="${i eq pageResult.pageNo}">
								class="active"</c:if>>
								<a href="<c:url value="mainSearch.do?pageNo=${i}&searchContent=${searchContent}"/>">${i}</a>
							</li>
						</c:forEach>
						<li
							<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
							<c:choose>
								<c:when test="${pageResult.next eq false}">
									<a aria-label="Previous"> <span aria-hidden="true">&rsaquo;</span></a>
								</c:when>
								<c:otherwise>
									<a
									href="<c:url value="mainSearch.do?pageNo=${pageResult.endPage+1}&searchContent=${searchContent}"/>"
									aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
						<li
							<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
							<c:choose>
								<c:when test="${pageResult.next eq false}">
									<a aria-label="Previous"> <span aria-hidden="true">&raquo;</span></a>
								</c:when>
								<c:otherwise>
									<a
									href="<c:url value="mainSearch.do?pageNo=${pageResult.lastPage}&searchContent=${searchContent}"/>"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</c:if>
			</nav>
			<c:if test="${empty list}">
				<div class="text-center">
					<h2>검색된 결과가 없습니다.</h2>
				</div>
			</c:if>
		</div>
	</div>


	<script>
		var searchContent = "${searchContent}";
		$("#searchContent").val(searchContent);
	</script>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />
</body>
</html>