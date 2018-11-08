<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
<!-- <script type="text/javascript" -->
<!--   src="https://code.jquery.com/jquery-3.3.1.js" -->
<!--   integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" -->
<!--   crossorigin="anonymous"></script> -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

</head>
<body>
	<div class="container">
		<div class="h3">공지사항</div>
		<hr>
		<form id="form" action="write.do" method="post">
			<div class="panel panel-default">
				<div class="panel-heading">
					<input class="form-control" id="title" type="text" name="title"
						placeholder="제목을 입력 해 주세요" />
				</div>

				<input type="hidden" name="writer" value="${user.nickname}" />
				<div class="panel-body">
					<textarea class="summernote" id="ddd" name="content"></textarea>
				</div>
			</div>

			<button class="btn btn-default">등록</button>
			<a class="btn btn-default" href="list.do">목록</a>
		</form>

	</div>
	<br>

	<script>
		$('.summernote').summernote({
			height : 500,
			minHeight : null,
			maxHeight : null,
			focus : true,
			toolbar: [
    		    // [groupName, [list of button]]
    		    ['style', ['bold', 'italic', 'underline', 'clear']],
    		    ['font', ['strikethrough', 'superscript', 'subscript']],
    		    ['fontsize', ['fontsize']],
    		    ['color', ['color']],
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    ['height', ['height']]
    		  ]
		});

		$coco = $('.summernote').summernote('code');

		$('#ddd').html($coco);

		$('#form').submit(function() {

			if ($('#title').val() == "") {
				alert("제목이 없잖아");
				return false;
			} else if ($('#title').val().length > 30) {
				alert("제목은 30자 이상 넘을 수 없습니다.")
				return false;
			}

			if ($('#ddd').val() == "") {
				alert("내용 입력 해 주세요")
				return false;
			} else if ($('#ddd').val().length > 1300) {
				alert("내용이 1300자를 초과합니다");
				return false;
			}
		})
	</script>

	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

</body>
</html>
















