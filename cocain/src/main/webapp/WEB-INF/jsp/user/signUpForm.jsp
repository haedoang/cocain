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
    <link rel="stylesheet" href="/cocain/resources/css/user/signUp.css">
</head>
<body>
  	<c:import url="/WEB-INF/jsp/base-ui/header.jsp"/> 
    <div class="container signUpContainer">
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
                        	     <span class="input-group-btn">
								 	<button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>
							     </span>
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
	<div class="modal fade" id="certify">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h3 class="modal-title">이메일 인증</h3>
				</div>
				<div class="modal-body">
					<h4>
						입력하신 이메일로 인증번호를 보냈습니다.
					</h4><br>
					<div class="input-group input-group-lg">
                         <span class="input-group-addon"><i class="fas fa-key"></i></span>
                         <input id="certifyNo" type="text" class="form-control" name="certifyNo" placeholder="인증번호">
                    </div>
				</div>
				<div class="modal-footer text-center">
					<button id="auth" type="button" class="btn btn-primary btn-lg">인증하기</button>
				</div>
			</div>
		</div>
	</div>
  	
  	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"/>  
  	
	<script type="text/javascript">
		var idConfirmSwich = 1;	
		var passConfirmSwich = 1;	
		var passCkConfirmSwich = 1;	
		var nicknameConfirmSwich = 1;	
		var emailConfirmSwich = 1;	
		var emailKeyConfirmSwich = 1;	
	
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
		$("#sendMail").addClass("disabled");
		$("#email").on("input", function() {
			var email = $("#email").val();
			
			var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			
			if(!emailReg.test(email)) {
				$("#ckEmailMsg").html("<span style='color: red; line-height: 25px;'>올바른 이메일 형식을 입력해주세요.</span>");
				$("#sendMail").addClass("disabled");
				emailConfirmSwich = 1;
				
				return false;
			} else {
				$("#ckEmailMsg").html(
						"<span style='color: green; line-height: 25px;'>사용 가능한 이메일입니다.　</span>"
				);
				$("#sendMail").removeClass("disabled");
				emailConfirmSwich = 0;
			}
		});
		
		// 이메일 인증
		var key = "";
		$("#sendMail").on("click", function(e) {
			if(emailConfirmSwich == 1) {return;}
 			key = "";
			var email = $("#email").val();
			$.ajax({
				url: "sendMail.do",
				data: {email: email}
			})
			.done(function(result) {
				key = result;
			});
		});	
		
		// 이메일 인증 확인
		$("#auth").on("click", function(e) {
			var certifyNo = $("#certifyNo").val();
			if(certifyNo == key) {
				alert("인증 성공");
				emailKeyConfirmSwich = 0;
				
				$("#certify").modal("hide");
			} else {
				alert("올바른 인증키를 입력하십시오.");
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
			if(emailKeyConfirmSwich == 1) {
				alert("이메일 인증을 하십시오.")
	            $("#sendMail").focus();
				return false;
			}	
			alert("가입되었습니다. 로그인 후 이용해주세요.");
		});
	</script>  	
</body>
</html>