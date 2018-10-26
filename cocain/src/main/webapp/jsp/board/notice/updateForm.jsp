<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>자유게시판</title>
</head>
<body>
	 <h2>자유게시판</h2>
	 <hr />
	 <form action='update.do' method='post'>
	   <input type='hidden' name='no' value='${board.no}' />
	    제목 : <input type='text' name='title' value='${board.title}' /><br>
	    글쓴이 : <input type='text' name='writer' readonly value='${board.writer}' /><br>
	    내용 : <br>
	   <textarea name='content' rows='5' cols='70'>${board.content}</textarea><br>
	   <button type='submit'>수정</button>
	 </form>
	 <a href='list.do'>목록</a>
</body>
</html>





