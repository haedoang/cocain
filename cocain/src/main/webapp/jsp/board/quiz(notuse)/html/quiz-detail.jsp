<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content 연습</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/quiz.css" />
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header.. -->
	<c:import url="header.jsp"></c:import>

	<section>
		<div class="container">
			<hr/>
			<div class="row">
				<span>문제 번호:　</span><span>799</span>
			</div>
			<div class="row">
				<span>출제자:　</span><span>관리자</span><hr/>
			</div>
			<div class="row">
				<span>문제 제목:　</span><span>객체 생성하기</span>
			</div>
			<div class="row">
				<p>문제지:　</p>
				<p>다음 코드를 분석해서 출력된 결과를 작성해주세요</p>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="sheet">
<pre>
	//class B의 구조
	@Data
	public class B{
		private int no;
		private String name;
	}	


	public class A{
		public static void main(String[] args) {
			B b = new B();
			b.setName("홍길동");
			
			system.out.println("이름 :"+b.getName());
		}
	}
</pre>
					</div>
				</div>
				<div class="col-md-6">
					<div class="sheet">
						<textarea rows="20" cols="80"></textarea>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- footer.. -->
	<c:import url="footer.jsp"></c:import>

</body>
</html>