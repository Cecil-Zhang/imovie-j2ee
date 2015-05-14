<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="主页">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<title>首页</title>
</head>
<body class="paddingForNav">
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="index" />
</jsp:include>
	
<div class="container-fluid">
<div class="row">
<div class="span4 col-md-3">
          <div class="todo mrm">
            <div class="todo-search">
              <h4 class="todo-name h3">
				Screening Schedule
            </div>
            <ul>
              <li class="todo-done">
                <div class="todo-icon fui-video"></div>
                <div class="todo-content">
                  <h4 class="todo-name">
                    《金刚狼》  3D  120分钟
                  </h4>
                  12:00  英语
                </div>
              </li>

              <li>
                <div class="todo-icon fui-video"></div>
                <div class="todo-content">
                  <h4 class="todo-name">
                    《蜘蛛侠3》  3D <br/> 130分钟
                  </h4>
                  13:00  英语
                </div>
              </li>

              <li>
                <div class="todo-icon fui-video"></div>
                <div class="todo-content">
                  <h4 class="todo-name">
                    《雪国列车》  3D <br/> 150分钟
                  </h4>
                  14:00  英语
                </div>
              </li>

              <li>
                <div class="todo-icon fui-video"></div>
                <div class="todo-content">
                  <h4 class="todo-name">
                    《金刚狼》  3D  120分钟
                  </h4>
                  14:00  国语
                </div>
              </li>
			  
			  <li>
                <div class="todo-icon fui-video"></div>
                <div class="todo-content">
                  <h4 class="todo-name">
                    《雪国列车》  3D <br/> 150分钟
                  </h4>
                  14:00  英语
                </div>
              </li>
            </ul>
          </div>
	</div>
	
		  
<div id="carousel-example-generic" class="carousel slide col-md-9  mycarousel haspadding" data-ride="carousel" data-interval="4000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/imovie/common/img/wolf.jpg" class="poster" alt="金刚狼">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="/imovie/common/img/spider.jpg" class="poster" alt="蜘蛛侠3">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="/imovie/common/img/snow.jpg" class="poster" alt="雪国列车">
      <div class="carousel-caption">
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>

</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>