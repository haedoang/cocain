<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CoCaIn</title>
	<c:import url="/WEB-INF/jsp/base-ui/header.jsp" />
    <!-- include libraries(jQuery, bootstrap) -->
<!--     <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!--     <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</head>

<body>
	<div class="container">
        <div class="row">
            <form action="write.do" method="post" onsubmit="return doCheck()">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <h3>지식iN</h3>
                    <br>
                    <div class="panel panel-default">
                    	<input type="hidden" name="writer" value="${user.nickname}">
                        <div class="panel-heading">
                            <input type="text" class="form-control" name="title">
                        </div>
                        <div class="panel-body">
                            <textarea id="summernote" class="form-control" name="content"></textarea>
                        </div>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-default">등록</button>
                        <a class="btn btn-default" href="list.do">취소</a>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </form>
        </div>
    </div>
    <br>
	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp" />

    

    <script>

    	$("#summernote").summernote({
    		toolbar: [
    		    // [groupName, [list of button]]
    		    ['style', ['bold', 'italic', 'underline', 'clear']],
    		    ['font', ['strikethrough', 'superscript', 'subscript']],
    		    ['fontsize', ['fontsize']],
    		    ['color', ['color']],
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    ['height', ['height']]
    		  ],
			height:500,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: 'ko-KR',
			disableResize: true,            // Does not work
			disableResizeEditor: true,      // Does not work either
	      resize: false 
		});

    	/* 미설정 체크  */
		function doCheck(){
			if($("input[name='title']").val()==""){
				alert("제목을 입력하세요");
				$("input[name='title']").focus();
				return false;
			}
		}
		
    	
//     $('#summernote').summernote({
//         placeholder: 'Hello stand alone ui',
//         tabsize: 2,
//         height: 100
//       });
    
//         $(document).ready(function () {
//             $('#summernote').summernote({
//                 height: 500,
//                 
//             });
//         });

    </script>
</body>

</html>