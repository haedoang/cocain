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
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/signup.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.animateNumber.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
  	<c:import url="header.jsp"/> 
  	
    <div class="container">
        <div class="row">
        	<div class="col-md-3">
        	</div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fas fa-user-plus"></i>
                            &nbsp;&nbsp;회원가입
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form>
                             <div class="input-group input-group-lg">
                                 <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                 <input id="id" type="text" class="form-control" name="id" value="" placeholder="아이디">                                        
                             </div>
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                             <input id="password" type="password" class="form-control" name="password" placeholder="비밀번호">
                             </div>
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                             <input id="passwordCk" type="password" class="form-control" name="passwordCk" placeholder="비밀번호 확인">
                             </div>
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-user-secret"></i></span>
	                             <input id="nickName" type="text" class="form-control" name="nickName" placeholder="닉네임">
                             </div>                             
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-envelope"></i></span>
	                             <input id="email" type="text" class="form-control" name="email" placeholder="이메일">
                             </div>
   							 <div class="text-center">
                           	 	 <button type="button" class="btn btn-default btn-lg">가입하기</button>
							 </div> 
						</form>     
                    </div>
                </div>       
            </div>
            <div class="col-md-3">
        	</div>
        </div>
    </div>  
  	
  	<c:import url="footer.jsp"/>  
  	
</body>
</html>