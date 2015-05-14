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

<title>充值完成</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>
<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>充值完成</h1>
	</div>
</div>
	
<div class="row personelrow">
        <div class="col-xs-6 col-md-2 col-md-offset-3 personelrow">
          <a class="thumbnail orderPost" href="#">
            <img data-src="holder.js/140x140" src="/imovie/common/img/${user.information.image }" alt="...">
          </a>
        </div>
		
		<div class="col-md-4 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">会员号：</p>
					<td><p class="h6"><a>${user.userId }</a></p></td>
				</tr>
				<tr class="active center">
					<td><p class="h6">银行：</p>
					<td><p class="h6"><a>${bank }</a></p></td>
				</tr>
				<tr class="info center">
					<td><p class="h6">银行账户：</p></td>
					<td><p class="h6"><a>${bankAccount }</a></p></td>
				</tr>
				<tr class="warning center">
					<td><p class="h6">充值金额：</p></td>
					<td><p class="h6"><a>${amount }元</a></p></td>
				</tr>
				<tr class="danger center">
					<td><p class="h6">账户余额：</p></td>
					<td><p class="h6"><a>${user.information.balance }</a></p></td>
				</tr>
				<tr class="success center">
					<td><p class="h6">会员状态：</p></td>
					<td><p class="h6"><a>${user.information.state }</a></p></td>
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