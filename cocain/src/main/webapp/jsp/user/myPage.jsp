<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CoCaIn</title>
    <link rel="stylesheet" href="/cocain/resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/cocain/resources/css/user/myPage.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/cocain/resources/js/bootstrap.js"></script>
</head>
<body>
  	<c:import url="/jsp/base-ui/header.jsp"/> 
  	
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fas fa-user-alt"></i>
                            &nbsp;&nbsp;마이페이지
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="/cocain/resources/images/icon.png" alt="개발자 이미지"/>
                                </a>
                            </div>
                            <div class="media-body">
                            	<br>
                                <h1 class="media-heading">
                                    CoCaIn1234&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-target="#info" data-toggle="modal">
                                    	<i class="fas fa-user-alt"></i> 정보수정
                                    </button>
                                </h1>
                                <div>
                                	<br>
                                    <div><h3>랭킹 5위 </h3><h4> (3,820p)</h4></div><br>
                                    <h4>가입된 스터디 : 자바 스터디, 자바스크립트 스터디</h4>
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
                        <div class="media">
                            <div class="media-left">
                                <i class="far fa-edit fa-3x"></i>
                            </div>
                            <div class="media-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>질문과 답변에 1번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                            <span>2018-10-15 20:10:52</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>알고리즘 질문합니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>    
                        <div class="media">
                            <div class="media-left">
                                <i class="far fa-edit fa-3x"></i>
                            </div>
                            <div class="media-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>퀴즈 게시판에 2번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                            <span>2018-10-15 20:10:52</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>빙고 퀴즈 나갑니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>    
                        <div class="media">
                            <div class="media-left">
                                <i class="far fa-edit fa-3x"></i>
                            </div>
                            <div class="media-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>스터디 모집에 3번 게시물을 작성하였습니다.&nbsp;&nbsp; 
                                            <span>2018-10-15 20:10:52</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>강남역 자바스터디 모집합니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>    
                        <div class="media">
                            <div class="media-left">
                                <i class="far fa-comment fa-3x"></i>
                            </div>
                            <div class="media-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>1번 게시물에 댓글을 남겼습니다.&nbsp;&nbsp; 
                                            <span>2018-10-15 20:10:52</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>알고리즘 질문합니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>    
                        <div class="media">
                            <div class="media-left">
                                <i class="far fa-comment fa-3x"></i>
                            </div>
                            <div class="media-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>2번 게시물에 댓글을 남겼습니다.&nbsp;&nbsp; 
                                            <span>2018-10-15 20:10:52</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>빙고 퀴즈 나갑니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <nav class="text-center">
							    	<ul class="pagination">
									    <li>
										    <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										    </a>
									    </li>
									    <li class="active"><a href="#">1</a></li>
									    <li><a href="#">2</a></li>
									    <li><a href="#">3</a></li>
									    <li><a href="#">4</a></li>
									    <li><a href="#">5</a></li>
									    <li>
										    <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										    </a>
									    </li>
									</ul>
								</nav>
                            </div> 
                        </div>    
                    </div>
                </div>       
            </div>
        </div>
    </div>  
  	
	<div class="row">
		<div class="modal" id="info" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-primary">
	                    <div class="panel-heading">
	                        <h2 class="panel-title">
	                            <i class="fas fa-user-cog"></i>
	                            &nbsp;&nbsp;정보수정
	                        </h2>
	                    </div>
	                    <div class="panel-body">
	                        <form>
	                             <div class="input-group input-group-lg">
		                             <span class="input-group-addon"><i class="fas fa-user-secret"></i></span>
		                             <input id="nickName" type="text" class="form-control" name="nickName" placeholder="닉네임">
	                             </div>                             
	                             <div class="input-group input-group-lg">
		                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
		                             <input id="oriPassword" type="password" class="form-control" name="oriPassword" placeholder="현재 비밀번호">
	                             </div>
	                             <div class="input-group input-group-lg">
		                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
		                             <input id="newPassword" type="password" class="form-control" name="newPassword" placeholder="새 비밀번호">
	                             </div>
	                             <div class="input-group input-group-lg">
		                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
		                             <input id="passwordCk" type="password" class="form-control" name="passwordCk" placeholder="비밀번호 확인">
	                             </div>
	   							 <div class="text-center">
	                           	 	 <button type="button" class="btn btn-default btn-lg">수정하기</button>
								 </div> 
							</form>     
	                    </div>
	                </div>       
				</div>
			</div>
		</div>
	</div>
  	
  	<c:import url="/jsp/base-ui/footer.jsp"/>  

</body>
</html>