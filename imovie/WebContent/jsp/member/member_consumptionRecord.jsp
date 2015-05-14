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

<title>消费记录</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>消费记录</h1>
	</div>
</div>
	
<div class="row personelrow">
		
		<div class="col-md-8 col-md-offset-2">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">	
					<td><p class="h6">编号</p></td>
					<td><p class="h6">订单号</p></td>
					<td><p class="h6">购买影片</p></td>
					<td><p class="h6">座位数</p></td>
					<td><p class="h6">购买时间</p></td>
					<td><p class="h6">订单金额</p></td>
					<td><p class="h6">获得积分</p></td>
				</tr>
				<c:forEach var="order" items="${orderList }" varStatus="status">
				<tr class="danger center">
					<td><p class="h6">${status.count }</p></td>
					<td><p class="h6">${order.orderId }</p></td>
					<td><p class="h6">${order.purchaseMovie.movie.name }</p></td>
					<td><p class="h6">${order.orderSeat }</p></td>
					<td><p class="h6">${order.purchaseTimeInString }</p></td>
					<td><p class="h6">${order.orderPrice }元</p></td>
					<td><p class="h6">${order.orderCredit }</p></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
  
</body>
</html>