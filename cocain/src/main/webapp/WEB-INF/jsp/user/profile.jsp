<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CoCaIn</title>
    <link rel="stylesheet" href="/cocain/resources/css/user/myPage.css">
</head>
<body>
  	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"/> 
    <div class="container profileContainer">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fas fa-user-alt"></i>
                            &nbsp;&nbsp;프로필
                        </h3>
                    </div>
                    <input id="userId" type="hidden" value="" />
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                            <div id="drop">
                                <a href="#">
                                	<c:choose>
		                            	<c:when test="${userFile == null}">
	        	                            <img id="profile" class="media-object" src="/cocain/resources/images/icon.png" alt="프로필"/>
	    	                        	</c:when>
		                            	<c:otherwise>
	        	                            <img id="profile" class="media-object" src="${userFile.uploadPath}" alt="프로필"/>
	    	                        	</c:otherwise>
    	                        	</c:choose>
                                </a>
                            </div>    
                                <br>
                            </div>
                            <div class="media-body">
                            	<br><br>
                                <h1 class="media-heading">
									　${ra[0].writer}&nbsp;&nbsp;
                                </h1>
                                <div>
                                	<br><br>
                                    <div><h3> 　 &nbsp;랭킹  ${userRank.rank}위 </h3><h4> (${userInfo.point}p)</h4></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>       
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fas fa-users"></i>
                            &nbsp;&nbsp;최근 활동
                        </h3>
                    </div>
                    <div class="panel-body">
                    	<c:forEach var="active" items="${ra}">
	                        <div class="media">
	                            <div class="media-left">
	                           		<c:choose>
	                           			<c:when test="${active.typeqna == 'typeqna' or active.typeqna == 'typequiz' or active.typeqna == 'typestudy' or active.typeqna == 'typenotice'}">
		                                	<i class="far fa-edit fa-3x"></i>
		                                </c:when>
		                                <c:otherwise>
		                                	<i class="far fa-comment fa-3x" style="font-size:3.375em"></i>
		                                </c:otherwise>
	                                </c:choose>
	                            </div>
	                            <div class="media-body">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <tr>
	                                        	<c:choose>
	                                        		<c:when test="${active.typeqna == 'typenotice'}">
	                                          			<th>공지사항에 ${active.no}번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                          			</c:when>
	                                        		<c:when test="${active.typeqna == 'typeqna'}">
	                                          			<th>지식iN에 ${active.no}번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                          			</c:when>
	                                        		<c:when test="${active.typeqna == 'typequiz'}">
	                                          			<th>퀴즈 게시판에 ${active.no}번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                          			</c:when>
                                          			<c:when test="${active.typeqna == 'typestudy'}">
                                          				<th>스터디에 ${active.no}번 게시물을 작성하였습니다.&nbsp;&nbsp;
                                          			</c:when>
                                          			<c:when test="${active.typeqna == 'typenoticecm'}">
	                                          			<th>공지사항 ${active.no}번 게시물에 댓글을 작성하였습니다.&nbsp;&nbsp; 
                                          			</c:when>
                                          			<c:when test="${active.typeqna == 'typeqnacm'}">
                                          				<th>지식iN ${active.no}번 게시물에 댓글을 작성하였습니다.&nbsp;&nbsp;
                                          			</c:when>
                                          			<c:when test="${active.typeqna == 'typequizcm'}">
                                          				<th>퀴즈 게시판 ${active.no}번 게시물에 댓글을 작성하였습니다.&nbsp;&nbsp;
                                          			</c:when>
                                          			<c:when test="${active.typeqna == 'typestudycm'}">
                                          				<th>스터디 ${active.no}번 게시물에 댓글을 작성하였습니다.&nbsp;&nbsp;
                                          			</c:when>
	                                            </c:choose>
	                                            <span><fmt:formatDate value="${active.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>
		                                            <div style="width: 500px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
		                                            	<c:choose>
		                                        			<c:when test="${active.typeqna == 'typeqna' || active.typeqna == 'typeqnacm'}">
		                                            			<a href="<c:url value="/board/qna/detail.do?no=${active.no}" />">${active.title}</a>
		                                          			</c:when>
			                                        		<c:when test="${active.typeqna == 'typequiz' || active.typeqna == 'typequizcm'}">
		                                            			<a href="<c:url value="/board/quiz/uqdetail.do?quizNo=${active.no}" />">${active.title}</a>
		                                          			</c:when>
		                                          			<c:when test="${active.typeqna == 'typestudy' || active.typeqna ==  'typestudycm'}">
		                                            			<a href="<c:url value="/board/studygroup/detail.do?no=${active.no}" />">${active.title}</a>
		                                          			</c:when>
		                                          			<c:when test="${active.typeqna == 'typenotice' || active.typeqna == 'typenoticecm'}">
		                                            			<a href="<c:url value="/board/notice/detail.do?no=${active.no}" />">${active.title}</a>
		                                          			</c:when>
		                                            	</c:choose>
		                                            </div>
	                                            </td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div> 
	                        </div>   
						</c:forEach>
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
												href="<c:url value="profile.do?writer=${ra[0].writer}&pageNo=1"/>"
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
												href="<c:url value="profile.do?writer=${ra[0].writer}&pageNo=${pageResult.beginPage-1}"/>"
												aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
										<li
											<c:if test="${i eq pageResult.pageNo}">
											class="active"</c:if>>
											<a href="<c:url value="profile.do?writer=${ra[0].writer}&pageNo=${i}"/>">${i}</a>
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
												href="<c:url value="profile.do?writer=${ra[0].writer}&pageNo=${pageResult.endPage+1}"/>"
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
												href="<c:url value="profile.do?writer=${ra[0].writer}&pageNo=${pageResult.lastPage}"/>"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</c:if>
						</nav>
                    </div>
                </div>       
            </div>
        </div>
    </div>  
  	
  	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"/>   
	
</body>
</html>