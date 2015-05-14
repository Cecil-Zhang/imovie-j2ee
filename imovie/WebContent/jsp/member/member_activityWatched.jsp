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

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<title>参加活动</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="activity" />
</jsp:include>
	
<div class="container-fluid">
	<div class="row personelrow">
		<div class="center text">
			<h1>参加活动</h1>
		</div>
	</div>
	
	<div class="row personelrow">
		<c:forEach var="plan" items="${planList }">
			<div class="col-md-2 col-md-offset-1 personelrow">
          		<a class="thumbnail" href="movieShowPlanAction.do?planId=${plan.planId }">
            		<img data-src="holder.js/140x140" src="/imovie/common/img/${plan.movie.poster }" alt="${plan.movie.name }">
          		</a>
        	</div>
			
		<div class="col-md-2 haspadding">
			<h6><a href="movieShowPlanAction.do?planId=${plan.planId }">${plan.movie.name }&nbsp;&nbsp;</a></h6>
            <p>${plan.movie.duration }分钟 - ${plan.movie.type } <br />
			   ${plan.screeningTimeInString}<br />
			   订单号：${plan.orderId } </p>
			<p class="mydescription">&nbsp; &nbsp; &nbsp;${fn:substring(plan.movie.description,0,46) }...</p>
            <p><a role="button" class="btn btn-primary btn-sm col-md-offset-1" href="orderAnswerQuestionAction.do?planId=${plan.planId }&movie=${plan.movie.name}&orderId=${plan.orderId}">开始答题</a>
		</div>
		</c:forEach>
	</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>