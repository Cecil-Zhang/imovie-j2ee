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
<title>电影上座率统计</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="static" />
</jsp:include>
	
<div class="container-fluid">
	<div class="row personelrow">
		<div class="center text">
			<h1>电影上座率统计</h1>
		</div>
	</div>
	
	<div class="row personelrow">
		<c:forEach var="movie" items="${movieList }" varStatus="status">
			<div class="col-md-2 col-md-offset-1 personelrow">
				<a class="thumbnail">
            		<img data-src="holder.js/140x140" src="/imovie/common/img/${movie.poster }" alt="${movie.name }">
            	</a>
        	</div>
			
		<div class="col-md-2 personelrow">
			<p><span class="h6">${movie.name }</span>&nbsp;&nbsp; <a class="btn btn-inverse btn-sm" href="managerMovieStaticAction.do?movieId=${movie.movieId }&name=${movie.name}">查看上座率</a></p>
            <p>${movie.duration }分钟 - ${movie.type } </p>
			<p class="mydescription">&nbsp; &nbsp; &nbsp;${fn:substring(movie.description,0,84) }...</p>
		</div>
		 <c:if test="${status.count%2==0 }"></div><div class="row personelrow"></c:if>
		</c:forEach>
     
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>