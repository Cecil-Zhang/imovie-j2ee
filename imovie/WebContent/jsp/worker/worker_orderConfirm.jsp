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

<title>订单确认</title>
</head>
<body>

<jsp:include page="navbar.jsp" >

<jsp:param name="location" value="sale" /> 

</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>订单确认</h1>
	</div>
</div>
	
<div class="row personelrow">
        <div class="col-xs-6 col-md-2 col-md-offset-3">
          <a class="thumbnail orderPost" href="#">
            <img data-src="holder.js/140x140" src="/imovie/common/img/${screeningPlan.movie.poster }" alt="...">
          </a>
        </div>
		
		<div class="col-md-4 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="active center">
					<td><p class="h6">影片：</p>
					<td><p class="h6"><a>${screeningPlan.movie.name } ${screeningPlan.language }</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">时间：</p></td>
					<td><p class="h6"><a>${screeningPlan.screeningTimeInString }</a></p></td>
				</tr>
				<tr class="warning center">
					<td><p class="h6">放映厅：</p></td>
					<td><p class="h6"><a>${screeningPlan.screeningHall }</a></p></td>
				</tr>
				<tr class="danger center">
					<td><p class="h6">座位：</p></td>
					<td><p class="h6"><button type="button" class="btn btn-primary btn-sm">${seatString }</button></p></td>
				</tr>
				<tr class="success center">
					<td><p class="h6">总价：</p></td>
					<td><p class="h6"><a>${price }元</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">优惠合计：</p></td>
					<td><p class="h6"><a><span id="discount">${price }</span>元</a></p></td>
				</tr>
			</table>
		</div>
</div>
<form action="orderAction.do" method="post">
<input type="hidden" name="planId" value="${screeningPlan.planId }" />
<input type="hidden" name="price" id="price" value="${price }" />
<input type="hidden" name="seatString" value="${seatString }" />
<div class="row personelrow">
		<div class="form-group">
			<label for="payWay" class="col-md-2 col-md-offset-3 control-label inputLabel">银行</label>
				<div class="input-group col-md-3">
					<select data-toggle="select" class="form-control select select-primary mrs mbm" onclick="chooseWay(this)" name="payWay" id="payWay">
						<optgroup label="支付方式">
						  <option value="0">现金</option>
						  <option value="1">会员卡</option>
						</optgroup>
					</select>
				</div>
		</div>
</div>

<div class="row personelrow">
		<div class="form-group">
			<label title="支付方式为会员卡时可用" data-placement="left" data-toggle="tooltip" for="account" class="col-md-2 col-md-offset-3 control-label inputLabel">会员账号</label>
			
			<div class="input-group col-md-3">
				<input type="text" name="userId" id="account" class="form-control" onblur="displayBalance(this)" disabled="disabled"/>
				<span class="input-group-addon add-on"><i class="icon-legal"></i></span>
			</div>
			<div class="input-group col-md-3"><p id="Balance" hidden>账户余额: &nbsp;&nbsp;<span id="balance"></span></p></div>
		</div>
</div>

<div class="row personelrow">
		<input type="submit" class="btn btn-success btn-lg col-md-2 col-md-offset-5" id="submit" value="确认购买" />
</div>
</form>
</div>


<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
<script src="/imovie/common/js/buyTicketForCustomer.js"></script>
<script>
      $(function () {
        $('[data-toggle=tooltip]').tooltip();
      });
</script>
</body>
</html>