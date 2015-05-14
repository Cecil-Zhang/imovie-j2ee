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

<title>充值</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>充值</h1>
	</div>
</div>
	
	<form method="post" action="userRechargeAction.do" id="info" onsubmit="return check()">
	<!-- 登录密码 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="loginPassword" class="col-md-2 col-md-offset-3 control-label inputLabel" >登录密码</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="password" name="password" id="loginPassword" class="form-control" />
				<span class="input-group-addon add-on"><i class="icon-legal"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
	</div>
	
	<!-- 银行 -->
	<div class="row personelrow">
	
		<div class="form-group">
			<label for="bank" class="col-md-2 col-md-offset-3 control-label inputLabel">银行</label>
				<div class="input-group col-md-3" id="bankDiv">
					<select data-toggle="select" class="form-control select select-primary mrs mbm" name="bank" id="bank">
						<optgroup label="银行">
          				  <option value="中国工商银行">中国工商银行</option>
         				  <option value="中国建设银行">中国建设银行</option>
						  <option value="中国农业银行">中国农业银行</option>
						  <option value="中国招商银行">中国招商银行</option>
						  <option value="中国银行">中国银行</option>
        				</optgroup>
        				<optgroup label="其他">
        				  <option value="支付宝">支付宝</option>
        				  <option value="百度钱包">百度钱包</option>
        				  <option value="微信支付">微信支付</option>
        				</optgroup>
      				</select>
				</div>
		</div>
	</div>
	
	<!-- 银行卡账号 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="bankAccount" class="col-md-2 col-md-offset-3 control-label inputLabel">银行卡账号</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="text" class="form-control bank" rows="6" id="bankAccount" name="bankAccount" />
				<span class="input-group-addon add-on"><i class="icon-user-md"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 充值金额 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="amout" class="col-md-2 col-md-offset-3 control-label inputLabel">充值金额</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="text" class="form-control bank" placeholder="首次充值200元以上可激活会员资格" rows="6" id="amout" name="amount" />
				<span class="input-group-addon add-on"><i class="icon-money"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 验证码 -->
	<!-- <div class="row personelrow">
		<div class="form-group">
			<label for="bankAccount" class="col-md-2 col-md-offset-3 control-label inputLabel">验证码</label>
			<div class="col-md-2">
				<div class="input-group">
				<input type="text" class="form-control bank" onblur="changeBar()" id="bankAccount" placeholder="" name="introduction" />
				</div>
			</div>
		</div>
	</div> -->
	
	<!-- 提交和重置按钮 -->
	<div class="row paddingForNav">
		<div class="form-group">
			<div class="col-md-3 col-md-offset-4">
			<input name="submit" type="submit" id="submit" value="充值" class="btn btn-inverse btn-embossed btn-lg col-md-4"/>			
			</div>
			<div class="col-md-3">
			<input name="reset" type="reset" value="清空" class="btn btn-default btn-embossed btn-lg col-md-4" data-toggle="popover" data-trigger="manual" data-content="密码或银行信息错误，请检查后重试" id="reset" onblur="hide()"></input>
			</div>
		</div>
	</div>
	
	</form>	
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/bootstrap.min.js"></script>
<script src="/imovie/common/js/popover.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/js/recharge.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
  
</body>
</html>