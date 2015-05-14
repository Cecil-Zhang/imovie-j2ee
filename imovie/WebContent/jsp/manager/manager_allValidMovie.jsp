<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="主页">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />
<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet"/>
<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<title>上映电影</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="movie" />
</jsp:include>
	
<div class="container-fluid">
	<div class="row personelrow">
		<div class="center text">
			<h1>上映电影</h1>
		</div>
	</div>
	
	<div class="row personelrow">
		<c:forEach var="movie" items="${movieList }">
			<div class="col-md-2 col-md-offset-1 personelrow">
				<a class="thumbnail">
            		<img data-src="holder.js/140x140" src="/imovie/common/img/${movie.poster }" alt="${movie.name }">
            	</a>
        	</div>
			
		<div class="col-md-2 personelrow">
			<p><span class="h6">${movie.name }</span>&nbsp;&nbsp; <c:if test="${plan.planState!='已生效' }"><a class="btn btn-inverse btn-sm" href="managerMovieOffAction.do?movieId=${movie.movieId }">电影下线</a></c:if></p>
            <p>${movie.duration }分钟 - ${movie.type } </p>
			<p class="mydescription">&nbsp; &nbsp; &nbsp;${fn:substring(movie.description,0,86) }...</p>
		</div>
		</c:forEach>
       
	</div>
	
	<div class="row personelrow">
		<div class="center text">
			<a class="h4 btn btn-primary btn-lg" href="/imovie/jsp/manager/manager_movieOn.jsp">添加电影&nbsp;&nbsp;&nbsp;<i class="icon-plus-sign-alt"></i></a>
		</div>
	</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>