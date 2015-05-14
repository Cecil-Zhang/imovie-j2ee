<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />

<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet"/>

<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>

<title>查看放映计划</title>
</head>
<body>

<jsp:include page="navbar.jsp" >

<jsp:param name="location" value="plan" /> 

</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>查看放映计划</h1>
	</div>
</div>

	<div class="row personelrow">		
		<div class="col-md-6 col-md-offset-3">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">放映影片：</p>
					<td><p class="h6"><a>${screeningPlan.movie.name }</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">放映厅：</p>
					<td><p class="h6"><a>${screeningPlan.screeningHall }</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">放映时间：</p></td>
					<td><p class="h6"><a>${screeningPlan.screeningTimeInString }</a></p></td>
				</tr>
				<tr class="warning center">
					<td><p class="h6">放映时长：</p></td>
					<td><p class="h6"><a>${screeningPlan.movie.duration }分钟</a></p></td>
				</tr>
				<tr class="danger center">
					<td><p class="h6">放映语言</p></td>
					<td><p class="h6"><a>${screeningPlan.language }</a></p></td>
				</tr>
				<tr class="success center">
					<td><p class="h6">座位单价：</p></td>
					<td><p class="h6"><a>${screeningPlan.seatPrice }元</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">已售座位：</p></td>
					<td><p class="h6"><a>${screeningPlan.seatSaled }座</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">状态：</p></td>
					<td><p class="h6"><a>${screeningPlan.planState }</a></p></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
  
</body>
</html>