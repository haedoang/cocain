<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</head>
<body>
	<div class="h2">자유게시판</div>
	<hr>
	<form action="write.do" method="post">
		<div>
			제목 : <input type="text" name="title" />
		</div>
		<div>
			작성자 : <input type="text" name="writer" />
		</div>
		<div>
			<textarea class="summernote"  id="ddd"  name="content" ></textarea>
			<div id ="fff"></div>
		</div>
		<button class="btn btn-default">등록</button>
		<a class="btn btn-default" href="list.do">목록</a>
	</form>
	<script>
	
	 $(function() {
	        $('.summernote').summernote({
	        	  height: 500,               
	        	  minHeight: null,         
	        	  maxHeight: null,        
	        	  focus: true    
	        });
	    });
	 
	$coco = $('#summernote').summernote('code'); 

	$('#fff').html($coco);
	
	</script>
</body>
</html>
















