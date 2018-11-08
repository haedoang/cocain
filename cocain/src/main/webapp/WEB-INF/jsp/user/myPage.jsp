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
    <div class="container myPageContainer">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fas fa-user-alt"></i>
                            &nbsp;&nbsp;마이페이지
                        </h3>
                    </div>
                    <input id="userId" type="hidden" value="${user.id}" />
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
                                <div class="fileBox text-center">
                                	<label for="uploadBtn" class="btn_file">프로필 사진 수정</label>
									<input type="file" name="uploadFile" id="uploadBtn" class="uploadBtn"/>
                                </div>
                            </div>
                            <div class="media-body">
                            	<br><br>
                                <h1 class="media-heading">
									　${user.nickname}&nbsp;&nbsp;
                                    <button type="button" id="modify" class="btn btn-default" data-target="#info" data-toggle="modal">
                                    	<i class="fas fa-user-cog"></i> 비밀번호 수정
                                    </button>
                                </h1>
                                <div>
                                	<br><br>
                                    <div><h3> 　 &nbsp;랭킹 ${userRank.rank}위 </h3><h4> (${user.point}p)</h4></div>
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
		                                          			<c:when test="${active.typeqna == 'typestudy' || active.typeqna == 'typestudycm'}">
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
												href="<c:url value="myPage.do?pageNo=1"/>"
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
												href="<c:url value="myPage.do?pageNo=${pageResult.beginPage-1}"/>"
												aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
										<li
											<c:if test="${i eq pageResult.pageNo}">
											class="active"</c:if>>
											<a href="<c:url value="myPage.do?pageNo=${i}"/>">${i}</a>
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
												href="<c:url value="myPage.do?pageNo=${pageResult.endPage+1}"/>"
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
												href="<c:url value="myPage.do?pageNo=${pageResult.lastPage}"/>"
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
  	
	<div class="row">
		<div class="modal fade" id="info" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-primary">
	                    <div class="panel-heading">
	                        <h2 class="panel-title">
	                            <i class="fas fa-user-cog"></i>
	                            &nbsp;&nbsp;비밀번호 수정
	                        </h2>
	                    </div>
	                    <div class="panel-body">            
                             <div class="input-group input-group-lg" id="oriPassDiv">
	                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
	                             <input id="oriPassword" type="password" class="form-control" name="oriPassword" placeholder="현재 비밀번호">
                             </div>
                             <br>
                        	<form id="modifyForm" action="modifyPass.do" method="post">               
	                             <div class="input-group input-group-lg" id="newPassDiv" style="display: none;">
		                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
		                             <input id="password" type="password" class="form-control" name="password" placeholder="새 비밀번호">
	                             </div>
                            	 <div class="row" id="ckPassMsg" style="display: none;"></div>     
	                             <div class="input-group input-group-lg" id="passCkDiv" style="display: none;">
		                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
		                             <input id="passwordCk" type="password" class="form-control" name="passwordCk" placeholder="비밀번호 확인">
	                             </div>
	                             <input type="hidden" name="id" value="${user.id}"/>
                            	 <div class="row" id="ConfirmPassMsg" style="display: none;"></div>  
	   							 <div class="text-center">
	                           	 	 <button type="button" class="btn btn-default btn-lg" id="confirm">확인</button>
	                           	 	 <button class="btn btn-default btn-lg" id="mod" style="display: none;">수정하기</button>
								 </div> 
							</form>     
	                    </div>
	                </div>       
				</div>
			</div>
		</div>
	</div>
  	
  	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"/>   
	
	<script type="text/javascript">
		var passConfirmSwich = 1;	
		var passCkConfirmSwich = 1;	
		
		// 현재 비밀번호 확인 후 새 비밀번호 UI 부르기
		$("#confirm").click(function() {
			var oriPassword = $("#oriPassword").val();
			var id = "${user.id}";
			$.ajax({
				url: "/cocain/user/passCheck.do",
				data: {id: id, oriPassword: oriPassword}
			})
			.done(function(user) {
				if(user == "") {
					alert("비밀번호를 다시 확인해주세요.");					
				} else {
					$("#oriPassDiv").css("display", "none");				
					$("#confirm").css("display", "none");				
					$("#newPassDiv, #passCkDiv").css("display", "table");
					$("#newPassDiv, #ckPassMsg").css("display", "table");
					$("#newPassDiv, #ConfirmPassMsg").css("display", "table");
					$("#mod").css("display", "inline");
					
				}
			});
		});
		

		// 비밀번호 입력
		$("#password").on("input", function() {
			var password = $("#password").val();
			var passwordCk = $("#passwordCk").val();
			
			if(password.length < 8 || password.length > 16) {
				$("#ckPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 8~16자까지 입력해주세요.</span>");
				passConfirmSwich = 1;

				return false;
			} else {
				$("#ckPassMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 비밀번호입니다.</span>");
				passConfirmSwich = 0;
			}
			
			if(password != passwordCk) {
				$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 재확인해주세요.</span>");
				passCkConfirmSwich = 1;

				return false;
			}
		});
		
		// 비밀번호 확인 입력
		$("#passwordCk").on("input", function() {
			var password = $("#password").val();
			var passwordCk = $("#passwordCk").val();
			
			if(password == passwordCk) {
				$("#ConfirmPassMsg").html("<span style='color: green; line-height: 25px;'>비밀번호가 확인되었습니다.</span>");
				passCkConfirmSwich = 0;
			} else {
				$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호가 일치하지 않습니다.</span>");
				passCkConfirmSwich = 1;

				return false;
			}
		});
		
		// 새 비밀번호 유효성 체크
		$("#mod").on("click", function(e) {
			if($("#password").val() == "") {
				$("#ckPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 입력하세요.</span>");
	            $("#password").focus();
	            return false;
			}    
			if($("#passwordCk").val() == "") {
				$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 확인하세요.</span>");
	            $("#passwordCk").focus();
	            return false;
			}
			if(passConfirmSwich == 1) {
	            $("#password").focus();
				return false;
			}
			if(passCkConfirmSwich == 1) {
	            $("#passwordCk").focus();
				return false;
			}
			alert("비밀번호가 수정되었습니다. 다시 로그인 해주세요.");
		});
		
 		// 확장자 제한
		function checkFile(f){
			// files로 해당 파일 정보 얻기
			var file = f.files;

			// file[0].name 은 파일명
			// 정규식으로 확장자 체크
			if(!/(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
				alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
				return false;
			} else {
				return;
			}
		} 

		// 파일
		$("input[type='file']").change(function(e) {
			 if(checkFile(this) == false) {
				 return;
			 }
			 
			 var fileReader = new FileReader();
			 var conf = null;
			 fileReader.readAsDataURL(e.target.files[0]);
			 
			 fileReader.onload = function(e) {
			    document.getElementById('profile').src = e.target.result;
			 	setTimeout(function() {
			 		conf = confirm("수정하시겠습니까?");
					if(conf == false) {location.href = "myPage.do"; return;}
		 			
					var formData = new FormData();
					var inputFile = $("input[name='uploadFile']")
					var files = inputFile[0].files;
					var id = $("#userId").val();
					formData.append("uploadFile", files[0]);
					$.ajax({
						url: "/cocain/user/profileImg.do",
						processData: false,
						contentType: false,
						data: formData,
						type: "POST"
					})
					.done(function(result) {
						location.href = "myPage.do";
					});   
				}, 10)
			 }  
		});
		
		// 파일 드래그 앤 드롭
		var drop = document.getElementById('drop');
		var fileInput = document.getElementById('uploadBtn');
		
		drop.ondragover = drop.ondragenter = function(e) {
			e.preventDefault();
		};

		drop.ondrop = function(e) {
			fileInput.files = e.dataTransfer.files;
			e.preventDefault();
		};
	</script>
</body>
</html>