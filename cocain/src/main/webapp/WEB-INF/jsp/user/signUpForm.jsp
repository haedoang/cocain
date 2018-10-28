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
    <link rel="stylesheet" href="/cocain/resources/css/user/signUp.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/cocain/resources/js/bootstrap.js"></script>
</head>
<body>
  	<c:import url="../base-ui/header.jsp"/> 
  	
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
                        <form action="signUp.do" method="post">
                             <div class="input-group input-group-lg">
                                 <span class="input-group-addon"><i class="fas fa-user"></i></span>
                                 <input id="id" type="text" class="form-control" name="id" placeholder="아이디"> 
                             </div>
                             <div class="row" id="ckMsg"></div>                                       
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
	                             <input id="password" type="password" class="form-control" name="password" placeholder="비밀번호">
                             </div>
                             <div class="row" id="ckPassMsg"></div>     
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-lock"></i></span>
	                             <input id="passwordCk" type="password" class="form-control" name="passwordCk" placeholder="비밀번호 확인">
                             </div>
                             <div class="row" id="ConfirmPassMsg"></div>     
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-user-secret"></i></span>
	                             <input id="nickname" type="text" class="form-control" name="nickname" placeholder="닉네임">
                             </div>       
                             <div class="row" id="ckNameMsg"></div>                           
                             <div class="input-group input-group-lg">
	                             <span class="input-group-addon"><i class="fas fa-envelope"></i></span>
	                             <input id="email" type="text" class="form-control" name="email" placeholder="이메일">
                             </div>
                             <div class="row" id="ckEmailMsg"></div>     
   							 <div class="text-center">
                           	 	 <button class="btn btn-default btn-lg" id="singUp">가입하기</button>
							 </div> 
						</form>     
                    </div>
                </div>       
            </div>
            <div class="col-md-3">
        	</div>
        </div>
    </div>  
  	
  	<c:import url="../base-ui/footer.jsp"/>  
  	
	<script type="text/javascript">
		var idConfirmSwich = 1;	
		var passConfirmSwich = 1;	
		var passCkConfirmSwich = 1;	
		var nicknameConfirmSwich = 1;	
		var emailConfirmSwich = 1;	
	
		// 아이디 입력
		$("#id").on("input", function() {
			var id = $("#id").val();
			
			if(id.length < 4 || id.length > 12) {
				$("#ckMsg").html("<span style='color: red; line-height: 25px;'>아이디를 4~12자까지 입력해주세요.</span>");
				idConfirmSwich = 1;

				return false;
			} else {
				idConfirmSwich = 0;
			}
	        
	        var idReg = /^[a-zA-Z0-9]{4,12}$/;
	      
	        if(!idReg.test(id)) {
            	$("#ckMsg").html("<span style='color: red; line-height: 25px;'>아이디는 영문, 숫자만 입력가능합니다.</span>");
            	idConfirmSwich = 1;

				return false;
			} else {
				idConfirmSwich = 0;
			}
	        
			$.ajax({
				url: "checkId.do",
				data: {id: id}
			})
			.done(function(check) {
				if(check == "0") {
					$("#ckMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 아이디입니다.</span>");
					idConfirmSwich = 0;
				} else {
					$("#ckMsg").html("<span style='color: red; line-height: 25px;'>중복된 아이디입니다.</span>");
					idConfirmSwich = 1;

					return false;
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
		
		// 닉네임 입력
		$("#nickname").on("input", function() {
			var nickname = $("#nickname").val();
			
			if(nickname.length < 4 || nickname.length > 10) {
				$("#ckNameMsg").html("<span style='color: red; line-height: 25px;'>닉네임을 4~10자까지 입력해주세요.</span>");
				nicknameConfirmSwich = 1;
				
				return false;
			} else {
				nicknameConfirmSwich = 0;
			}
	        
			$.ajax({
				url: "checkName.do",
				data: {nickname: nickname}
			})
			.done(function(check) {
				if(check == "0") {
					$("#ckNameMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 닉네임입니다.</span>");
					nicknameConfirmSwich = 0;
				} else {
					$("#ckNameMsg").html("<span style='color: red; line-height: 25px;'>중복된 닉네임입니다.</span>");
					nicknameConfirmSwich = 1;
					
					return false;
				}
			});
		});
		
		// 이메일 입력
		$("#email").on("input", function() {
			var email = $("#email").val();
			
			var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			
			if(!emailReg.test(email)) {
				$("#ckEmailMsg").html("<span style='color: red; line-height: 25px;'>올바른 이메일 형식을 입력해주세요.</span>");
				emailConfirmSwich = 1;
				
				return false;
			} else {
				$("#ckEmailMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 이메일입니다.</span>");
				emailConfirmSwich = 0;
			}
		});
		
		// 가입하기
		$("#singUp").on("click", function(e) {
			if($("#id").val() == "") {
				$("#ckMsg").html("<span style='color: red; line-height: 25px;'>아이디를 입력하세요.</span>");
	            $("#id").focus();
	            return false;
			}
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
			if($("#nickname").val() == "") {
				$("#ckNameMsg").html("<span style='color: red; line-height: 25px;'>닉네임을 입력하세요.</span>");
	            $("#nickname").focus();
	            return false;
			}
			if($("#email").val() == "") {
				$("#ckEmailMsg").html("<span style='color: red; line-height: 25px;'>이메일을 입력하세요.</span>");
	            $("#email").focus();
	            return false;
			}
			if(idConfirmSwich == 1) {
	            $("#id").focus();
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
			if(nicknameConfirmSwich == 1) {
	            $("#nickname").focus();
				return false;
			}
			if(emailConfirmSwich == 1) {
	            $("#email").focus();
				return false;
			}	
			alert("가입되었습니다.");
		});
	</script>  	
</body>
</html>