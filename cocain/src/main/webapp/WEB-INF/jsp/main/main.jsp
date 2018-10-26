<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery.animateNumber.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
  	<c:import url="header.jsp"/> 
  	
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="../images/code-2620118_1920.jpg" alt="code">
            </div>
            <div class="item">
                <img src="../images/비지니스.jpg" alt="비지니스">
            </div>
            <div class="item">
                <img src="../images/technology.jpg" alt="technology">
            </div>
            <div class="item">
                <img src="../images/web.png" alt="web">
            </div>
            <div class="item">
                <img src="../images/webdesign.jpg" alt="webdesign">
            </div>
            <div class="carousel-content">
                <p class="text-center">CoCaIn은 코딩 커뮤니티 사이트입니다. <br>원하는 스터디 그룹 모집 및 지식을 공유할 수 있습니다.</p>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div> 
    <div class="row first-row">
        <div class="row-control">
            <div class="col-md-4">
                <div class="jumbotron">
                    <div class="content">
                        <h2 class="text-center post-count">
                            12345
                        </h2>
                        <h4 class="text-center">전체 게시물</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="jumbotron">
                    <div class="content">
                        <h2 class="text-center quiz-count">
                            678
                        </h2>
                        <h4 class="text-center">전체 문제</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="jumbotron">
                    <div id="myCarousel-lank" class="carousel slide" data-ride="carousel" data-interval="3000">
                        <div class="carousel-inner">
                            <div class="item active">
                                <h2 class="text-center">
                                    <i class="fas fa-medal" style="color: gold"></i>&nbsp;&nbsp;김해동
                                </h2>
                                <h4 class="text-center">퀴즈 랭킹</h4>
                            </div>
                            <div class="item">
                                <h2 class="text-center">
                                    <i class="fas fa-medal" style="color: #c0c0c0"></i>&nbsp;&nbsp;박한준
                                </h2>
                                <h4 class="text-center">퀴즈 랭킹</h4>
                            </div>
                            <div class="item">
                                <h2 class="text-center">
                                    <i class="fas fa-medal" style="color: #cd7f32"></i>&nbsp;&nbsp;안규영
                                </h2>
                                <h4 class="text-center">퀴즈 랭킹</h4>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#myCarousel-lank" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel-lank" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-pushpin"></span>
                            &nbsp;&nbsp;공지사항
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 
                </div>       
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-pencil"></span>
                            &nbsp;&nbsp;스터디
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                    <td>1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 
                </div>       
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fab fa-quora"></i>
                            &nbsp;&nbsp;퀴즈
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 
                </div>       
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-comment"></span>
                            &nbsp;&nbsp;지식iN
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>안녕하세요</td>
                                    <td>관리자</td>
                                    <td>2018.10.11</td>
                                </tr>
                            </tbody>
                        </table>   
                    </div> 
                </div>       
            </div>
        </div>
    </div>  
  	
  	<c:import url="footer.jsp"/>  
  
    <script>
        var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
        var postConut = $(".post-count").text();
        $('.post-count').animateNumber(
            {
                number: parseInt(postConut),
                numberStep: comma_separator_number_step
            }, 2000
        );
        var quizConut = $(".quiz-count").text();
        $('.quiz-count').animateNumber(
            {
                number: parseInt(quizConut),
                numberStep: comma_separator_number_step
            }, 2000
        );
    </script>

</body>
</html>