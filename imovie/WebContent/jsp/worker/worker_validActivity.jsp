<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="主页">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet"
	type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet" />
<title>参加活动</title>
</head>
<body>
	<jsp:include page="navbar.jsp">
		<jsp:param name="location" value="plan" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row personelrow">
			<div class="center text">
				<h1>查看活动</h1>
			</div>
		</div>

		<div class="row personelrow">
			<c:forEach var="ac" items="${activityList }" varStatus="status">
				<div class="col-md-2 col-md-offset-1 personelrow">
					<a class="thumbnail"
						href="movieShowPlanAction.do?planId=${actiplan.planId }"> <img
						data-src="holder.js/140x140"
						src="/imovie/common/img/${ac.planList[0].movie.poster }"
						alt="${ac.planList[0].movie.name }" />
					</a>
				</div>

				<div class="col-md-2 haspadding">
					<h6>${ac.planList[0].movie.name }&nbsp;&nbsp;</h6>
					<h6>
						<a>相关放映计划</a>
					</h6>
					<p>
						<c:forEach var="plan" items="${ac.planList }">
							<a href="movieShowPlanAction.do?planId=${plan.planId }">${plan.screeningTimeInString }</a>
							<br />
						</c:forEach>
					</p>
					<p>
						<a role="button" class="btn btn-primary btn-sm col-md-offset-1"
							href="orderCheckActivityAction.do?activityId=${ac.activityId }&movie=${ac.planList[0].movie.movieId}">查看活动</a>
					</p>
				</div>
				<c:if test="${status.count%2==0}"></div><div class="row personelrow"></c:if>
			</c:forEach>
		</div>
	</div>

	<script src="/imovie/common/js/jquery.min.js"></script>
	<script src="/imovie/common/js/flat-ui.min.js"></script>
	<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>