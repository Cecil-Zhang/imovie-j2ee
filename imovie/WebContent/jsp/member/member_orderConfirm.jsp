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
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="purchase" />
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
            <img data-src="holder.js/140x140" src="/imovie/common/img/${screeningPlan.movie.poster }" alt="${screeningPlan.movie.name }">
          </a>
        </div>
		
		<div class="col-md-5 col-md-offset-1 personelrow">
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
					<td><p class="h6"><a>${discountPrice }元</a></p></td>
				</tr>
			</table>
		</div>
</div>

<c:if test="${todo=='buy' }">
<input type="hidden" id="userId" value="${user.userId }" />
<form method="post" action="orderAction.do" onsubmit="return check()">
<div class="row personelrow">
		<div class="form-group">
			<label for="loginPassword" class="col-md-2 col-md-offset-3 control-label inputLabel">登录密码</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="password" name="password" id="loginPassword" class="form-control" data-toggle="popover" data-trigger="manual" onblur="hide()" data-placement="bottom" data-content="密码错误，请重试" />
				<span class="input-group-addon add-on"><i class="icon-legal"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
</div>

<div class="row personelrow">
		<input type="hidden" name="planId" value="${screeningPlan.planId }" />
		<input type="hidden" name="price" value="${discountPrice }" />
		<input type="hidden" name="seatString" value="${seatString }" />
		
		<input type="submit" class="btn btn-success btn-lg col-md-2 col-md-offset-5" value="确认购买"/>
	
</div>
</form>
</c:if>

<c:if test="${todo=='recharge' }">
<div class="row personelrow">
		<a class="btn btn-default btn-lg col-md-2 col-md-offset-5">余额不足，请先充值</a>
</div>
</c:if>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/js/bootstrap.min.js"></script>
<script src="/imovie/common/js/popover.js"></script>
<script>
	$(function () {
	  $('[data-toggle="popover"]').popover()
	})
	
	var flag=false;
	function check(){
		var password=document.getElementById("loginPassword");
		if(password.value==null||password.value==""){
			password.placeholder="请输入登录密码";
			password.focus();
			return false;
		}
		var userid=document.getElementById("userId");
		$.ajax({
			type: "POST",
			url: "/imovie/json/ajaxLoginAction.do",
			data: {password:password.value,userId:userid.value,role:'member'},
			dataType: "json",
			success: function(data){
				if(Boolean(data.loginFlag)){
					flag=true;
				}else{
					flag=false;
					$('#loginPassword').popover('show');
					$('#loginPassword').focus();
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
				return false;
			}
		});
		if(flag){
			return true;
		}else{
			return false;
		}
	}
	
	function hide(){
		$('#loginPassword').popover('hide');
	}
</script>  
</body>
</html>