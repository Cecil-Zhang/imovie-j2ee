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

<title>查看订单</title>
</head>
<body>

<jsp:include page="navbar.jsp" >

<jsp:param name="location" value="sale" /> 

</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>订单完成</h1>
	</div>
</div>
	
<div class="row personelrow">
        <div class="col-xs-6 col-md-2 col-md-offset-3">
          <a class="thumbnail orderPost" href="#">
            <img data-src="holder.js/140x140" src="/imovie/common/img/xglc.jpg" alt="...">
          </a>
        </div>
		
		<div class="col-md-5 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">订单号：</p></td>
					<td><p class="h6"><a>${order.orderId }</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">影片：</p></td>
					<td><p class="h6"><a>${order.purchaseMovie.movie.name } ${order.purchaseMovie.language }</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">时间：</p></td>
					<td><p class="h6"><a>${order.purchaseMovie.screeningTimeInString }</a></p></td>
				</tr>
				<tr class="warning center">
					<td><p class="h6">放映厅：</p></td>
					<td><p class="h6"><a>${order.purchaseMovie.screeningHall }</a></p></td>
				</tr>
				<tr class="danger center">
					<td><p class="h6">座位：</p></td>
					<td><p class="h6"><button type="button" class="btn btn-primary btn-sm">${order.orderSeat }</button></p></td>
				</tr>
				<tr class="success center">
					<td><p class="h6">金额：</p></td>
					<td><p class="h6"><a>${order.orderPrice }元</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">状态：</p></td>
					<td><p class="h6"><a>已付款</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">账户余额：</p></td>
					<td><p class="h6"><a>${balance }元</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">付款时间：</p></td>
					<td><p class="h6"><a>${order.purchaseTime }</a></p></td>
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