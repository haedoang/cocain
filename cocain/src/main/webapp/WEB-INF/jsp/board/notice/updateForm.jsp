<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>자유게시판</title>
<c:import url="/WEB-INF/jsp/base-ui/header.jsp"></c:import>
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
		<h2>공지사항</h2>
		<hr />
		<form id="form" action='update.do' method='post'>

			<div class="panel panel-default">
				<div class="panel-heading">
					<input type='hidden' name='no' value='${board.no}' /> <input
						id="title" class="form-control" type='text' name='title'
						value='${board.title}' placeholder="제목을 입력 해 주세요" />
				</div>
				<input type='hidden' name='writer' readonly value='${board.writer}' />
				<div class="panel-body">
					<textarea id="content" class="summernote" name='content'>${board.content}</textarea>
				</div>
			</div>
			<button class="btn btn-default" type='submit'>수정</button>
			&nbsp;<a class="btn btn-default" href='list.do'>목록</a>
		</form>
	</div>

	<c:import url="/WEB-INF/jsp/base-ui/footer.jsp"></c:import>

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
    		  ],
		});

		
		
		$coco = $('.summernote').summernote('code');

		$('#form').submit(function() {

			if ($('#title').val() == "") {
				alert("제목이 없잖아");
				return false;
			} else if ($('#title').val().length > 30) {
				alert("제목은 30자 이상 넘을 수 없습니다.")
				return false;
			}

			if ($('#content').val() == "") {
				alert("내용 입력 해 주세요")
				return false;
			} else if ($('#content').val().length > 1300) {
				alert("내용이 1300자를 초과합니다");
				return false;
			}
		})
	</script>

</body>
</html>





