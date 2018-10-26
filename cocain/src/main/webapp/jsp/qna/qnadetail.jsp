<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CoCaIn</title>
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <h3>지식iN</h3>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">질문입니다</h3>
                    </div>
                    <div class="panel-heading">
                        <a>홍길동</a>　<span>2018-10-10</span>
                        <div style="float:right">
                            <span>조회 20회</span>　<span>추천 1</span>
                        </div>
                    </div>
                    <div class="panel-body" style="height: 400px">
                        질문내용질문내용질문내용질문내용
                    </div>
                </div>
                <div class="text-right">
                        <button class="btn btn-default">목록</button> <button class="btn btn-default">수정</button> <button class="btn btn-default">삭제</button>
                    </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    
    
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <label for="content"><i class="fas fa-users"></i>총 2개의 댓글</label>
            <div class="panel panel-default">
                <div class="comment">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            djm03178　
                            <span>
                                2018-10-10
                            </span>
                        </h4>
                    </div>
                    <div class="panel-body" style="border-bottom: 1px solid #ddd">
                        <p>전역 변수는 자동으로 0으로 초기화되지만, 지역 변수에는 쓰레기값이 들어있게 됩니다.</p>
                        <div class="text-right">
                            <button class="btn btn-default">수정</button>　<button class="btn btn-default">삭제</button>
                        </div>

                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            djm03178 &nbsp;
                            <span>
                                2018-10-10
                            </span>
                        </h4>
                    </div>
                    <div class="panel-body">
                        <p>전역 변수는 자동으로 0으로 초기화되지만, 지역 변수에는 쓰레기값이 들어있게 됩니다.</p>
                        <div class="text-right">
                            <button class="btn btn-default">수정</button> <button class="btn btn-default">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form name="commentInsertForm">
                <div class="input-group">
                    <input type="hidden" name="bno" value="${detail.bno}" />
                    <textarea class="form-control" name="content"></textarea>
                    <span class="input-group-btn">
                        <button class="btn btn-default-" type="button" name="commentInsertBtn">등록</button>
                    </span>
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
    </div>

    
</body>

</html>